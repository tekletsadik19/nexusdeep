import 'package:flutter/material.dart';
import 'package:nexusdeep/core/common/widgets/telephone_form_field.dart';

class CreateProfileFormBody extends StatefulWidget {
  const CreateProfileFormBody({super.key});

  @override
  State<CreateProfileFormBody> createState() => _CreateProfileFormBodyState();
}

class _CreateProfileFormBodyState extends State<CreateProfileFormBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
            title: const Text("Business "),
            content: Container(
              child: const TelephoneText(
                width: 300.0,
                height: 50.0, // Example height
                initialValue: '+1234567890', // Example initial value
                enabledBorderColor:
                    Colors.grey, // Example border color when enabled
                enabledBorderWidth: 1.0, // Example border width when enabled
                enabledBorderRadius: 10.0, // Example border radius when enabled
                focusedBorderColor:
                    Colors.blue, // Example border color when focused
                focusedBorderWidth: 2.0, // Example border width when focused
                focusedBorderRadius: 10.0, // Example border radius when focused
                fillColor: Colors.white, // Example fill color
                textStyleFontFamily: 'Arial', // Example text style font family
                textStyleColor: Colors.black, // Example text style color
                textStyleFontSize: 16.0, // Example text style font size
                labelText: 'Phone Number', // Example label text
                hintText: 'Enter your phone number', // Example hint text
                validatorErrorText:
                    'Invalid phone number', // Example validator error text
                validatorErrorColor:
                    Colors.red, // Example validator error color
                validatorErrorFontFamily:
                    'Arial', // Example validator error font family
                validatorErrorFontSize:
                    12.0, // Example validator error font size
                validatorPhoneMustBeValid: true, // Example validator flag
                allowedCountryCodes: null, // Allowing all countries
              ),
            )),
        Step(title: const Text("Business "), content: Container()),
        Step(title: const Text("Business "), content: Container())
      ];
}
