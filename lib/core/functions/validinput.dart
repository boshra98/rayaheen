import 'package:get/get_utils/src/get_utils/get_utils.dart';
// Function to check if the input contains only Arabic, English characters, underscores, or spaces
bool isArabicOrEnglish(String val) {
  final regex = RegExp(r'^[\u0600-\u06FFa-zA-Z_\s]+$'); // Arabic, English, underscores, and spaces only
  return regex.hasMatch(val);
}

// Function to validate phone number based on country code
// bool isValidPhoneNumber(String val, String countryCode) {
//   switch (countryCode) {
//     case "+971": // UAE
//       return val.startsWith("5") && val.length == 9; // UAE mobile numbers start with '5' and have 9 digits after country code
//     case "+968": // Oman
//       return val.length == 8; // Oman numbers have 8 digits after country code
//     case "+966": // Saudi Arabia
//       return val.startsWith("5") && val.length == 9; // Saudi Arabia mobile numbers start with '5' and have 9 digits after country code
//     default:
//       return false;
//   }
// }

// Main validation function

bool isValidPhoneNumber(String val, String countryCode) {
  // Remove any non-digit characters from the phone number
  val = val.replaceAll(RegExp(r'\D'), '');

  // Define validation rules for each country code
  switch (countryCode) {
    case "+971": // UAE
      return val.startsWith("5") && val.length == 9; // UAE mobile numbers start with '5' and have 9 digits after country code
    case "+968": // Oman
      return val.length == 8; // Oman numbers have 8 digits after country code
    case "+966": // Saudi Arabia
      return val.startsWith("5") && val.length == 9; // Saudi Arabia mobile numbers start with '5' and have 9 digits after country code
    case "+93": // Afghanistan
      return val.length == 9; // Afghanistan numbers have 9 digits after country code
    case "+355": // Albania
      return val.length == 9; // Albania numbers have 9 digits after country code
    case "+213": // Algeria
      return val.length == 9; // Algeria numbers have 9 digits after country code
    case "+376": // Andorra
      return val.length == 6; // Andorra numbers have 6 digits after country code
    case "+244": // Angola
      return val.length == 9; // Angola numbers have 9 digits after country code
    case "+1-268": // Antigua and Barbuda
      return val.length == 7; // Antigua and Barbuda numbers have 7 digits after country code
    case "+54": // Argentina
      return val.length == 10; // Argentina numbers have 10 digits after country code
    case "+374": // Armenia
      return val.length == 8; // Armenia numbers have 8 digits after country code
    case "+61": // Australia
      return val.length == 9; // Australia numbers have 9 digits after country code
    case "+43": // Austria
      return val.length == 10; // Austria numbers have 10 digits after country code
    case "+994": // Azerbaijan
      return val.length == 9; // Azerbaijan numbers have 9 digits after country code
    case "+1-242": // Bahamas
      return val.length == 7; // Bahamas numbers have 7 digits after country code
    case "+973": // Bahrain
      return val.length == 8; // Bahrain numbers have 8 digits after country code
    case "+880": // Bangladesh
      return val.length == 10; // Bangladesh numbers have 10 digits after country code
    case "+1-246": // Barbados
      return val.length == 7; // Barbados numbers have 7 digits after country code
    case "+375": // Belarus
      return val.length == 9; // Belarus numbers have 9 digits after country code
    case "+32": // Belgium
      return val.length == 9; // Belgium numbers have 9 digits after country code
    case "+501": // Belize
      return val.length == 7; // Belize numbers have 7 digits after country code
    case "+229": // Benin
      return val.length == 8; // Benin numbers have 8 digits after country code
    case "+975": // Bhutan
      return val.length == 8; // Bhutan numbers have 8 digits after country code
    case "+591": // Bolivia
      return val.length == 8; // Bolivia numbers have 8 digits after country code
    case "+387": // Bosnia and Herzegovina
      return val.length == 8; // Bosnia and Herzegovina numbers have 8 digits after country code
    case "+267": // Botswana
      return val.length == 8; // Botswana numbers have 8 digits after country code
    case "+55": // Brazil
      return val.length == 9; // Brazil numbers have 9 digits after country code
    case "+673": // Brunei
      return val.length == 7; // Brunei numbers have 7 digits after country code
    case "+359": // Bulgaria
      return val.length == 9; // Bulgaria numbers have 9 digits after country code
    case "+226": // Burkina Faso
      return val.length == 8; // Burkina Faso numbers have 8 digits after country code
    case "+257": // Burundi
      return val.length == 8; // Burundi numbers have 8 digits after country code
    case "+238": // Cabo Verde
      return val.length == 7; // Cabo Verde numbers have 7 digits after country code
    case "+855": // Cambodia
      return val.length == 8; // Cambodia numbers have 8 digits after country code
    case "+237": // Cameroon
      return val.length == 9; // Cameroon numbers have 9 digits after country code
    case "+1": // Canada
      return val.length == 10; // Canada numbers have 10 digits after country code
    case "+236": // Central African Republic
      return val.length == 8; // Central African Republic numbers have 8 digits after country code
    case "+235": // Chad
      return val.length == 8; // Chad numbers have 8 digits after country code
    case "+56": // Chile
      return val.length == 9; // Chile numbers have 9 digits after country code
    case "+86": // China
      return val.length == 11; // China numbers have 11 digits after country code
    case "+57": // Colombia
      return val.length == 10; // Colombia numbers have 10 digits after country code
    case "+269": // Comoros
      return val.length == 7; // Comoros numbers have 7 digits after country code
    case "+243": // Congo
      return val.length == 9; // Congo numbers have 9 digits after country code
    case "+506": // Costa Rica
      return val.length == 8; // Costa Rica numbers have 8 digits after country code
    case "+385": // Croatia
      return val.length == 9; // Croatia numbers have 9 digits after country code
    case "+53": // Cuba
      return val.length == 8; // Cuba numbers have 8 digits after country code
    case "+357": // Cyprus
      return val.length == 8; // Cyprus numbers have 8 digits after country code
    case "+420": // Czech Republic
      return val.length == 9; // Czech Republic numbers have 9 digits after country code
    case "+45": // Denmark
      return val.length == 8; // Denmark numbers have 8 digits after country code
    case "+253": // Djibouti
      return val.length == 8; // Djibouti numbers have 8 digits after country code
    case "+1-767": // Dominica
      return val.length == 7; // Dominica numbers have 7 digits after country code
    case "+1-809": // Dominican Republic
      return val.length == 7; // Dominican Republic numbers have 7 digits after country code
    case "+593": // Ecuador
      return val.length == 9; // Ecuador numbers have 9 digits after country code
    case "+20": // Egypt
      return val.length == 10; // Egypt numbers have 10 digits after country code
    case "+503": // El Salvador
      return val.length == 8; // El Salvador numbers have 8 digits after country code
    case "+240": // Equatorial Guinea
      return val.length == 9; // Equatorial Guinea numbers have 9 digits after country code
    case "+291": // Eritrea
      return val.length == 7; // Eritrea numbers have 7 digits after country code
    case "+372": // Estonia
      return val.length == 8; // Estonia numbers have 8 digits after country code
    case "+268": // Eswatini
      return val.length == 8; // Eswatini numbers have 8 digits after country code
    case "+251": // Ethiopia
      return val.length == 9; // Ethiopia numbers have 9 digits after country code
    case "+679": // Fiji
      return val.length == 7; // Fiji numbers have 7 digits after country code
    case "+358": // Finland
      return val.length == 10; // Finland numbers have 10 digits after country code
    case "+33": // France
      return val.length == 9; // France numbers have 9 digits after country code
    case "+241": // Gabon
      return val.length == 8; // Gabon numbers have 8 digits after country code
    case "+220": // Gambia
      return val.length == 7; // Gambia numbers have 7 digits after country code
    case "+995": // Georgia
      return val.length == 9; // Georgia numbers have 9 digits after country code
    case "+49": // Germany
      return val.length == 10; // Germany numbers have 10 digits after country code
    case "+233": // Ghana
      return val.length == 9; // Ghana numbers have 9 digits after country code
    case "+30": // Greece
      return val.length == 10; // Greece numbers have 10 digits after country code
    case "+1-473": // Grenada
      return val.length == 7; // Grenada numbers have 7 digits after country code
    case "+502": // Guatemala
      return val.length == 8; // Guatemala numbers have 8 digits after country code
    case "+224": // Guinea
      return val.length == 9; // Guinea numbers have 9 digits after country code
    case "+245": // Guinea-Bissau
      return val.length == 7; // Guinea-Bissau numbers have 7 digits after country code
    case "+592": // Guyana
      return val.length == 7; // Guyana numbers have 7 digits after country code
    case "+509": // Haiti
      return val.length == 8; // Haiti numbers have 8 digits after country code
    case "+504": // Honduras
      return val.length == 8; // Honduras numbers have 8 digits after country code
    case "+36": // Hungary
      return val.length == 9; // Hungary numbers have 9 digits after country code
    case "+354": // Iceland
      return val.length == 7; // Iceland numbers have 7 digits after country code
    case "+91": // India
      return val.length == 10; // India numbers have 10 digits after country code
    case "+62": // Indonesia
      return val.length == 10; // Indonesia numbers have 10 digits after country code
    case "+98": // Iran
      return val.length == 10; // Iran numbers have 10 digits after country code
    case "+964": // Iraq
      return val.length == 10; // Iraq numbers have 10 digits after country code
    case "+353": // Ireland
      return val.length == 9; // Ireland numbers have 9 digits after country code
    case "+972": // Israel
      return val.length == 9; // Israel numbers have 9 digits after country code
    case "+39": // Italy
      return val.length == 10; // Italy numbers have 10 digits after country code
    case "+1-876": // Jamaica
      return val.length == 7; // Jamaica numbers have 7 digits after country code
    case "+81": // Japan
      return val.length == 10; // Japan numbers have 10 digits after country code
    case "+962": // Jordan
      return val.length == 9; // Jordan numbers have 9 digits after country code
    case "+7": // Kazakhstan
      return val.length == 10; // Kazakhstan numbers have 10 digits after country code
    case "+254": // Kenya
      return val.length == 9; // Kenya numbers have 9 digits after country code
    case "+686": // Kiribati
      return val.length == 5; // Kiribati numbers have 5 digits after country code
    case "+850": // Korea, North
      return val.length == 10; // Korea, North numbers have 10 digits after country code
    case "+82": // Korea, South
      return val.length == 9; // Korea, South numbers have 9 digits after country code
    case "+383": // Kosovo
      return val.length == 8; // Kosovo numbers have 8 digits after country code
    case "+965": // Kuwait
      return val.length == 8; // Kuwait numbers have 8 digits after country code
    case "+996": // Kyrgyzstan
      return val.length == 9; // Kyrgyzstan numbers have 9 digits after country code
    case "+856": // Laos
      return val.length == 10; // Laos numbers have 10 digits after country code
    case "+371": // Latvia
      return val.length == 8; // Latvia numbers have 8 digits after country code
    case "+961": // Lebanon
      return val.length == 7; // Lebanon numbers have 7 digits after country code
    case "+266": // Lesotho
      return val.length == 8; // Lesotho numbers have 8 digits after country code
    case "+231": // Liberia
      return val.length == 7; // Liberia numbers have 7 digits after country code
    case "+218": // Libya
      return val.length == 9; // Libya numbers have 9 digits after country code
    case "+423": // Liechtenstein
      return val.length == 7; // Liechtenstein numbers have 7 digits after country code
    case "+370": // Lithuania
      return val.length == 8; // Lithuania numbers have 8 digits after country code
    case "+352": // Luxembourg
      return val.length == 9; // Luxembourg numbers have 9 digits after country code
    case "+261": // Madagascar
      return val.length == 9; // Madagascar numbers have 9 digits after country code
    case "+265": // Malawi
      return val.length == 9; // Malawi numbers have 9 digits after country code
    case "+60": // Malaysia
      return val.length == 9; // Malaysia numbers have 9 digits after country code
    case "+960": // Maldives
      return val.length == 7; // Maldives numbers have 7 digits after country code
    case "+223": // Mali
      return val.length == 8; // Mali numbers have 8 digits after country code
    case "+356": // Malta
      return val.length == 8; // Malta numbers have 8 digits after country code
    case "+692": // Marshall Islands
      return val.length == 7; // Marshall Islands numbers have 7 digits after country code
    case "+222": // Mauritania
      return val.length == 8; // Mauritania numbers have 8 digits after country code
    case "+230": // Mauritius
      return val.length == 8; // Mauritius numbers have 8 digits after country code
    case "+52": // Mexico
      return val.length == 10; // Mexico numbers have 10 digits after country code
    case "+691": // Micronesia
      return val.length == 7; // Micronesia numbers have 7 digits after country code
    case "+373": // Moldova
      return val.length == 8; // Moldova numbers have 8 digits after country code
    case "+377": // Monaco
      return val.length == 8; // Monaco numbers have 8 digits after country code
    case "+976": // Mongolia
      return val.length == 8; // Mongolia numbers have 8 digits after country code
    case "+382": // Montenegro
      return val.length == 8; // Montenegro numbers have 8 digits after country code
    case "+212": // Morocco
      return val.length == 9; // Morocco numbers have 9 digits after country code
    case "+258": // Mozambique
      return val.length == 9; // Mozambique numbers have 9 digits after country code
    case "+95": // Myanmar
      return val.length == 10; // Myanmar numbers have 10 digits after country code
    case "+264": // Namibia
      return val.length == 9; // Namibia numbers have 9 digits after country code
    case "+674": // Nauru
      return val.length == 7; // Nauru numbers have 7 digits after country code
    case "+977": // Nepal
      return val.length == 10; // Nepal numbers have 10 digits after country code
    case "+31": // Netherlands
      return val.length == 9; // Netherlands numbers have 9 digits after country code
    case "+64": // New Zealand
      return val.length == 9; // New Zealand numbers have 9 digits after country code
    case "+505": // Nicaragua
      return val.length == 8; // Nicaragua numbers have 8 digits after country code
    case "+227": // Niger
      return val.length == 8; // Niger numbers have 8 digits after country code
    case "+234": // Nigeria
      return val.length == 10; // Nigeria numbers have 10 digits after country code
    case "+389": // North Macedonia
      return val.length == 8; // North Macedonia numbers have 8 digits after country code
    case "+47": // Norway
      return val.length == 8; // Norway numbers have 8 digits after country code
    case "+92": // Pakistan
      return val.length == 10; // Pakistan numbers have 10 digits after country code
    case "+680": // Palau
      return val.length == 7; // Palau numbers have 7 digits after country code
    case "+970": // Palestine
      return val.length == 9; // Palestine numbers have 9 digits after country code
    case "+507": // Panama
      return val.length == 8; // Panama numbers have 8 digits after country code
    case "+675": // Papua New Guinea
      return val.length == 8; // Papua New Guinea numbers have 8 digits after country code
    case "+595": // Paraguay
      return val.length == 9; // Paraguay numbers have 9 digits after country code
    case "+51": // Peru
      return val.length == 9; // Peru numbers have 9 digits after country code
    case "+63": // Philippines
      return val.length == 10; // Philippines numbers have 10 digits after country code
    case "+48": // Poland
      return val.length == 9; // Poland numbers have 9 digits after country code
    case "+351": // Portugal
      return val.length == 9; // Portugal numbers have 9 digits after country code
    case "+974": // Qatar
      return val.length == 8; // Qatar numbers have 8 digits after country code
    case "+40": // Romania
      return val.length == 10; // Romania numbers have 10 digits after country code
    case "+7": // Russia
      return val.length == 10; // Russia numbers have 10 digits after country code
    case "+250": // Rwanda
      return val.length == 9; // Rwanda numbers have 9 digits after country code
    case "+1-869": // Saint Kitts and Nevis
      return val.length == 7; // Saint Kitts and Nevis numbers have 7 digits after country code
    case "+1-758": // Saint Lucia
      return val.length == 7; // Saint Lucia numbers have 7 digits after country code
    case "+1-784": // Saint Vincent and the Grenadines
      return val.length == 7; // Saint Vincent and the Grenadines numbers have 7 digits after country code
    case "+685": // Samoa
      return val.length == 5; // Samoa numbers have 5 digits after country code
    case "+378": // San Marino
      return val.length == 8; // San Marino numbers have 8 digits after country code
    case "+239": // Sao Tome and Principe
      return val.length == 7; // Sao Tome and Principe numbers have 7 digits after country code
    case "+221": // Senegal
      return val.length == 9; // Senegal numbers have 9 digits after country code
    case "+381": // Serbia
      return val.length == 9; // Serbia numbers have 9 digits after country code
    case "+248": // Seychelles
      return val.length == 7; // Seychelles numbers have 7 digits after country code
    case "+243": // Sierra Leone
      return val.length == 9; // Sierra Leone numbers have 9 digits after country code
    case "+65": // Singapore
      return val.length == 8; // Singapore numbers have 8 digits after country code
    case "+421": // Slovakia
      return val.length == 9; // Slovakia numbers have 9 digits after country code
    case "+421": // Slovenia
      return val.length == 8; // Slovenia numbers have 8 digits after country code
    case "+677": // Solomon Islands
      return val.length == 7; // Solomon Islands numbers have 7 digits after country code
    case "+252": // Somalia
      return val.length == 8; // Somalia numbers have 8 digits after country code
    case "+27": // South Africa
      return val.length == 9; // South Africa numbers have 9 digits after country code
    case "+211": // South Sudan
      return val.length == 9; // South Sudan numbers have 9 digits after country code
    case "+34": // Spain
      return val.length == 9; // Spain numbers have 9 digits after country code
    case "+94": // Sri Lanka
      return val.length == 9; // Sri Lanka numbers have 9 digits after country code
    case "+249": // Sudan
      return val.length == 9; // Sudan numbers have 9 digits after country code
    case "+597": // Suriname
      return val.length == 7; // Suriname numbers have 7 digits after country code
    case "+46": // Sweden
      return val.length == 9; // Sweden numbers have 9 digits after country code
    case "+41": // Switzerland
      return val.length == 9; // Switzerland numbers have 9 digits after country code
    case "+963": // Syria
      return val.length == 9; // Syria numbers have 9 digits after country code
    case "+886": // Taiwan
      return val.length == 9; // Taiwan numbers have 9 digits after country code
    case "+992": // Tajikistan
      return val.length == 9; // Tajikistan numbers have 9 digits after country code
    case "+255": // Tanzania
      return val.length == 9; // Tanzania numbers have 9 digits after country code
    case "+66": // Thailand
      return val.length == 9; // Thailand numbers have 9 digits after country code
    case "+670": // Timor-Leste
      return val.length == 7; // Timor-Leste numbers have 7 digits after country code
    case "+228": // Togo
      return val.length == 8; // Togo numbers have 8 digits after country code
    case "+676": // Tonga
      return val.length == 7; // Tonga numbers have 7 digits after country code
    case "+1-868": // Trinidad and Tobago
      return val.length == 7; // Trinidad and Tobago numbers have 7 digits after country code
    case "+216": // Tunisia
      return val.length == 8; // Tunisia numbers have 8 digits after country code
    case "+90": // Turkey
      return val.length == 10; // Turkey numbers have 10 digits after country code
    case "+993": // Turkmenistan
      return val.length == 8; // Turkmenistan numbers have 8 digits after country code
    case "+688": // Tuvalu
      return val.length == 5; // Tuvalu numbers have 5 digits after country code
    case "+256": // Uganda
      return val.length == 9; // Uganda numbers have 9 digits after country code
    case "+380": // Ukraine
      return val.length == 9; // Ukraine numbers have 9 digits after country code
    case "+44": // United Kingdom
      return val.length == 10; // United Kingdom numbers have 10 digits after country code
    case "+1": // United States
      return val.length == 10; // United States numbers have 10 digits after country code
    case "+598": // Uruguay
      return val.length == 8; // Uruguay numbers have 8 digits after country code
    case "+998": // Uzbekistan
      return val.length == 9; // Uzbekistan numbers have 9 digits after country code
    case "+678": // Vanuatu
      return val.length == 7; // Vanuatu numbers have 7 digits after country code
    case "+39": // Vatican City
      return val.length == 10; // Vatican City numbers have 10 digits after country code
    case "+58": // Venezuela
      return val.length == 10; // Venezuela numbers have 10 digits after country code
    case "+84": // Vietnam
      return val.length == 9; // Vietnam numbers have 9 digits after country code
    case "+967": // Yemen
      return val.length == 9; // Yemen numbers have 9 digits after country code
    case "+260": // Zambia
      return val.length == 9; // Zambia numbers have 9 digits after country code
    case "+263": // Zimbabwe
      return val.length == 9; // Zimbabwe numbers have 9 digits after country code
    default:
      return false; // Return false for unsupported country codes
  }
}
String? validInput(String val, int min, int max, String type, {String? countryCode}) {
  if (val.isEmpty) {
    return "لا يمكن أن يكون فارغاً"; // "Can't be empty" in Arabic
  }

  // Handle username validation (allows underscores, Arabic/English letters, but no spaces)
  if (type == "username") {
    if (!isArabicOrEnglish(val)) {
      return "اسم المستخدم غير صالح، يجب أن يحتوي على أحرف عربية أو إنجليزية وشرطة سفلية (_) بدون مسافات";
      // "Invalid username, should contain only Arabic or English letters and underscores (_) without spaces"
    }
    if (val.contains(' ')) {
      return "يرجى استبدال المسافة بشرطة سفلية (_)";
      // "Please replace spaces with an underscore (_)" in Arabic
    }
  }

  // Handle address validation (allows spaces with Arabic/English letters)
  if (type == "address") {
    if (!isArabicOrEnglish(val)) {
      return "العنوان غير صالح، يجب أن يحتوي على أحرف عربية أو إنجليزية فقط"; // "Invalid address, should contain only Arabic or English letters"
    }
  }

  // Handle email validation
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "البريد الإلكتروني غير صالح"; // "Not a valid email" in Arabic
    }
  }

  // Handle phone number validation based on country code
  if (type == "phone" && countryCode != null) {
    if (!GetUtils.isPhoneNumber(val) || !isValidPhoneNumber(val, countryCode)) {
      return "رقم الهاتف غير صالح"; // "Not a valid phone number" in Arabic
    }
  }


  // Handle password validation
  if (type == "password") {
    if (val.length < 8) {
      return "يجب أن يحتوي على 8 أرقام على الأقل"; // "Should contain at least 4 digits" in Arabic
    }
    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$').hasMatch(val)) {
      return "يجب أن يحتوي على أحرف وأرقام"; // "Should contain both letters and numbers" in Arabic
    }
  }


  // Check length constraints
  if (val.length < min) {
    return "لا يمكن أن يكون أقل من $min"; // "Can't be less than $min" in Arabic
  }

  if (val.length > max) {
    return "لا يمكن أن يكون أكبر من $max"; // "Can't be larger than $max" in Arabic
  }

  return null; // Return null if the input is valid
}
