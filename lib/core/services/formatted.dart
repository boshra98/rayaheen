import 'package:flutter/services.dart';

class EnglishDigitsFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Convert Arabic digits to English digits
    String newText = convertArabicToEnglishDigits(newValue.text);

    // Allow only English digits (0-9)
    final englishDigitsOnly = RegExp(r'^[0-9]*$');

    // If the new text contains only English digits, allow it
    if (englishDigitsOnly.hasMatch(newText)) {
      return TextEditingValue(
        text: newText, // Display the converted English digits
        selection: newValue.selection.copyWith(
          baseOffset: newText.length,
          extentOffset: newText.length,
        ),
      );
    }

    // Otherwise, return the old value (reject the input)
    return oldValue;
  }

  String convertArabicToEnglishDigits(String input) {
    const arabicDigits = '٠١٢٣٤٥٦٧٨٩';
    const englishDigits = '0123456789';

    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < input.length; i++) {
      String char = input[i];
      int index = arabicDigits.indexOf(char);
      if (index != -1) {
        buffer.write(englishDigits[index]);
      } else {
        buffer.write(char);
      }
    }
    return buffer.toString();
  }
}