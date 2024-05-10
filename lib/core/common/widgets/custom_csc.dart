import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';

class CustomCSC extends StatefulWidget {
  const CustomCSC({super.key});

  @override
  State<CustomCSC> createState() => _CustomCSCState();
}

class _CustomCSCState extends State<CustomCSC> {
  OutlineInputBorder formOutlineBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 0,
      color: Colors.transparent,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CSCPicker(
          dropdownDecoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: context.theme.colorScheme.tertiaryContainer.withOpacity(.5),
          ),
          disabledDropdownDecoration: BoxDecoration(

            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: context.theme.colorScheme.tertiaryContainer.withOpacity(.5),
            border: Border.all(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          countrySearchPlaceholder: 'Country',
          stateSearchPlaceholder: 'State',
          citySearchPlaceholder: 'City',
          defaultCountry: CscCountry.United_States,
          selectedItemStyle: GoogleFonts.outfit(
            textStyle: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 16,
              height:2.5,
              textBaseline: TextBaseline.alphabetic
            ),
          ),
          dropdownHeadingStyle: GoogleFonts.plusJakartaSans(
            textStyle: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 16,
            ),
          ),
          dropdownItemStyle: GoogleFonts.plusJakartaSans(
            textStyle: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 16,
            ),
          ),
          dropdownDialogRadius: 10,
          searchBarRadius: 50,
          onCountryChanged: (value) {
            setState(() {});
          },
          onStateChanged: (value) {
            setState(() {});
          },
          onCityChanged: (value) {
            setState(() {});
          },
        ),
      ],
    );
  }
}
