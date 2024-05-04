import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';



class TelephoneText extends StatefulWidget {
  const TelephoneText({
    super.key,
    this.width,
    this.height,
    this.initialValue,
    this.enabledBorderColor,
    this.enabledBorderWidth,
    this.enabledBorderRadius,
    this.focusedBorderColor,
    this.focusedBorderWidth,
    this.focusedBorderRadius,
    this.fillColor,
    this.textStyleFontFamily,
    this.textStyleColor,
    this.textStyleFontSize,
    this.labelText,
    this.hintText,
    this.dropDownIcon,
    this.validatorErrorText,
    this.validatorErrorColor,
    this.validatorErrorFontFamily,
    this.validatorErrorFontSize,
    this.validatorPhoneMustBeValid,
    this.allowedCountryCodes,
  });

  final double? width;
  final double? height;
  final String? initialValue;
  final Color? enabledBorderColor;
  final double? enabledBorderWidth;
  final double? enabledBorderRadius;
  final Color? focusedBorderColor;
  final double? focusedBorderWidth;
  final double? focusedBorderRadius;
  final Color? fillColor;
  final String? textStyleFontFamily;
  final Color? textStyleColor;
  final double? textStyleFontSize;
  final String? labelText;
  final String? hintText;
  final Widget? dropDownIcon;
  final String? validatorErrorText;
  final Color? validatorErrorColor;
  final String? validatorErrorFontFamily;
  final double? validatorErrorFontSize;
  final bool? validatorPhoneMustBeValid;
  final List<String>? allowedCountryCodes;

  @override
  _TelephoneTextState createState() => _TelephoneTextState();
}

class _TelephoneTextState extends State<TelephoneText> {
  String phoneNumber = '';
  String country = '';
  String? initialCountryCode;
  String? initialNumber;
  late List<Country> countryList;
  late List<Country> allowedCountries;

  @override
  void initState() {
    super.initState();
    countryList = countries;
    allowedCountries = widget.allowedCountryCodes != null
        ? countries.where((country) => widget.allowedCountryCodes!.contains(country.code)).toList()
        : countries;

    if (widget.initialValue != null && widget.initialValue!.startsWith('+')) {
      var fd = widget.initialValue!.substring(1);
      var foundCountries = countryList.where((element) => fd.startsWith(element.dialCode));
      for (var r in foundCountries) {
        if (fd.length >= r.dialCode.length && r.dialCode == fd.substring(0, r.dialCode.length)) {
          initialCountryCode = r.code;
          country = r.dialCode;
          initialNumber = fd.substring(r.dialCode.length);
          phoneNumber = initialNumber!;
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        labelText: widget.labelText,
        enabledBorder: getEnabledBorder(),
        border: getEnabledBorder(),
        focusedBorder: getFocusedBorder(),
        fillColor: widget.fillColor,
        hoverColor: widget.fillColor,
        focusColor: widget.fillColor,
        filled: true,
        hintText: widget.hintText,
        errorBorder: getEnabledBorder(),
        focusedErrorBorder: getFocusedBorder(),
      ),
      initialValue: initialNumber,
      initialCountryCode: initialCountryCode ?? 'US',
      countries: allowedCountries,
      onChanged: (phone) {
        setState(() {
          phoneNumber = phone.number;
          country = phone.countryCode;
        });
      },
      onCountryChanged: (phone) {
        setState(() {
          country = phone.dialCode;
        });
      },
      dropdownIcon: const Icon(IconlyBold.arrow_down_2),
      dropdownTextStyle: TextStyle(
          fontFamily: widget.textStyleFontFamily,
          fontSize: widget.textStyleFontSize,
          color: widget.textStyleColor),
      dropdownDecoration: BoxDecoration(
        borderRadius: widget.enabledBorderRadius != null
            ? BorderRadius.circular(widget.enabledBorderRadius!)
            : BorderRadius.circular(0),
        color: widget.fillColor,
      ),
      cursorColor: widget.textStyleColor,
    );
  }

  InputBorder? getEnabledBorder() {
    if (widget.enabledBorderColor == null) return null;
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.enabledBorderRadius ?? 50),
      borderSide: BorderSide(
          color: widget.enabledBorderColor!,
          width: widget.enabledBorderWidth ?? 0),
    );
  }

  InputBorder? getFocusedBorder() {
    if (widget.focusedBorderColor == null) return null;
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.focusedBorderRadius ?? 50),
      borderSide: BorderSide(
          color: widget.focusedBorderColor!,
          width: widget.focusedBorderWidth ?? 0),
    );
  }
}