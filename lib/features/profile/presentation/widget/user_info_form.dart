import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:nexusdeep/core/common/widgets/custom_csc.dart';
import 'package:nexusdeep/core/common/widgets/custom_form_field.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';
import 'package:nexusdeep/core/utils/core_utils.dart';
import 'package:phone_form_field/phone_form_field.dart';

class LocationForm extends StatefulWidget {
  const LocationForm({super.key});

  @override
  State<LocationForm> createState() => _LocationFormState();
}

class _LocationFormState extends State<LocationForm> {
  final TextEditingController _moreDetailsController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _verifyCodeController = TextEditingController();
  final PhoneController _phoneController = PhoneController();
  CountrySelectorNavigator selectorNavigator =
      const CountrySelectorNavigator.page();

  bool _isLoading = true;
  Timer? _timer;
  int _start = 0;


  @override
  void initState() {
    super.initState();
    _determinePosition();
    startTimer();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);

    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
    final placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    final place = placemarks[0];

    setState(() {
      _countryController.text = place.country ?? '';
      _cityController.text = place.locality ?? '';
      _stateController.text = place.administrativeArea ?? '';
      _moreDetailsController.text = '${place.street}, ${place.subLocality}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!_isLoading) ...[
          Column(
            children: [
              CustomCSC(
                initialCountry: _countryController.text,
                initialCity: _cityController.text,
                initialState: _stateController.text,
                onCountrySelected: (country) async {
                  _countryController.text = country;
                },
                onStateChanged: (state) {
                  _stateController.text = state;
                },
                onCityChanged: (city) {
                  _cityController.text = city;
                },
              ),
              const SizedBox(height: 6),
              CustomTextFormField(
                textInputType: TextInputType.text,
                hintText: 'More address details (Optional)',
                controller: _moreDetailsController,
                maxLines: 1,
                maxLength: 100,
                borderRadius: 10,
              ),
              const SizedBox(height: 6),
              CustomTextFormField(
                textInputType: TextInputType.number,
                hintText: 'Postal/ZIP code',
                controller: _zipCodeController,
                maxLines: 1,
                maxLength: 6,
                borderRadius: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 2,
                thickness: 1,
                color: Color(0xFFE5E7EB),
              ),
              const SizedBox(
                height: 10,
              ),
              PhoneFormField(
                isCountryButtonPersistent: true,
                controller: _phoneController,
                countryButtonStyle: const CountryButtonStyle(
                  showIsoCode: true,
                  flagSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Phone Number',

                  filled: true,
                  prefixStyle: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: context.theme.textTheme.bodyMedium!.color,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.transparent,
                    ),
                  ),
                  counterText: '',
                  labelStyle: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                    ),
                  ),
                  hintStyle: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: context.theme.colorScheme.tertiaryContainer
                      .withOpacity(.5),
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(20, 18, 0, 18),
                ),
                countrySelectorNavigator:
                CountrySelectorNavigator.modalBottomSheet(
                  favorites: [IsoCode.ET, IsoCode.US, IsoCode.GB],
                  height: 500,
                  titleStyle: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitleStyle: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  searchBoxDecoration: InputDecoration(
                    hintText: 'Search Country',
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        color: Colors.transparent,
                      ),
                    ),
                    counterText: '',
                    prefixIcon: const Icon(
                      IconlyLight.search,
                    ),
                    hintStyle: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 16,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: context.theme.colorScheme.tertiaryContainer
                        .withOpacity(.5),
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(20, 18, 0, 18),
                  ),
                  searchBoxTextStyle: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Click ',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Send Code',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' and enter the verification code '
                            'we sent to your phone.',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                    style: GoogleFonts.outfit(
                      color: const Color(0xFF15161E),
                      fontSize: 32,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                textInputType: TextInputType.phone,
                hintText: 'Verification Code',
                controller: _verifyCodeController,
                maxLines: 1,
                onChange: (email) {},
                maxLength: 6,
                borderRadius: 10,

              ),
              GestureDetector(
                onTap: () {
                  if (_phoneController.value.isValid() && _start == 0) {
                    startTimer();
                    setState(() {
                      _start = 90;
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 4,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      _start > 0
                          ? 'Resend code in ${CoreUtils.formatDuration(_start)}'
                          : 'Send Code',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: context.theme.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
        if (_isLoading)
          Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          ),
      ],
    );
  }


}
