import "package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart";

class OCRFunctions {
  LicenceModelOcr getLicenseData(final RecognizedText recognizedText) {
    final licenseModelOcr = LicenceModelOcr();
    bool secondNameShouldBeInSecondLine = false;
    for (var i = 0; i < recognizedText.blocks.length; i++) {
      final textBlockText = recognizedText.blocks[i].text;

      if (secondNameShouldBeInSecondLine &&
          i + 1 < recognizedText.blocks.length &&
          recognizedText.blocks[i + 1].text.startsWith("3.")) {
        licenseModelOcr.firstName = textBlockText;
      }
      secondNameShouldBeInSecondLine = false;

      if (textBlockText.startsWith("2.")) {
        if (textBlockText.substring(2).trim().isNotEmpty) {
          licenseModelOcr.firstName = textBlockText.substring(2).trim();
        } else {
          secondNameShouldBeInSecondLine = true;
        }
      }
      if (textBlockText.startsWith("3.")) {
        licenseModelOcr.dob = textBlockText.substring(2).trim();
      }
      if (textBlockText.startsWith("5.")) {
        licenseModelOcr.licenceNumber = textBlockText.substring(2).trim();
      }
      for (int x = 0; x < recognizedText.blocks[i].lines.length; x++) {
        final line = recognizedText.blocks[i].lines[x];
        if (line.text.trim().length > 2 && textBlockText.startsWith("1.")) {
          final newLineIndex = textBlockText.indexOf("\n");
          licenseModelOcr.lastName = textBlockText.substring(2, newLineIndex).trim();
        }
        if (line.text.trim().length > 2 && line.text.startsWith("5.")) {
          licenseModelOcr.licenceNumber = line.text.substring(2).trim();
        }
        if (line.text.trim().length > 2 && line.text.startsWith("2.")) {
          licenseModelOcr.firstName = line.text.substring(2).trim();
        }
        if (line.text.trim().length > 2 && line.text.startsWith("3.")) {
          licenseModelOcr.dob = line.text.substring(2).trim();
        }
      }
    }
    return licenseModelOcr;
  }

  String? getVinNumber(final RecognizedText recognizedText) {
    for (var i = 0; i < recognizedText.blocks.length; i++) {
      final text = recognizedText.blocks[i].text;

      if (vinCodeCardValidator(text)) {
        return text.replaceAll(RegExp("[^A-Z0-9]"), "");
      }
    }
    return null;
  }

  String? getCardType(final RecognizedText recognizedText) {
    for (var i = 0; i < recognizedText.blocks.length; i++) {
      final text = recognizedText.blocks[i].text;
      if (cardTypeValidator(text)) {
        return text.replaceAll(" ", "");
      }
    }
    return null;
  }

  static bool vinCodeCardValidator(final String val) {
    if (val.replaceAll(RegExp("[^A-Z0-9]"), "").length == 17) {
      return RegExp("[A-Z0-9]").hasMatch(val);
    }
    return false;
  }

  static bool cardTypeValidator(final String val) {
    return RegExp(r"^([A-Z0-9]{4}\s[A-Z0-9]{2})$").hasMatch(val);
  }
}

class LicenceModelOcr {
  LicenceModelOcr({this.firstName = "", this.lastName = "", this.dob = "", this.licenceNumber = ""});
  String firstName, lastName, dob, licenceNumber;
}
