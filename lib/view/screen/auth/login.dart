import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaheen_bookstore/view/screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/validinput.dart';
import '../../../core/services/formatted.dart';
import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/logoauth.dart';
import '../../widget/auth/textsignup.dart';



class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> countryCodes = [
      {"country": "United Arab Emirates", "code": "+971"},
      {"country": "Oman", "code": "+968"},
      {"country": "Saudi Arabia", "code": "+966"},
      {"country": "Syria", "code": "+963"},
      {"country": "Albania", "code": "+355"},
      {"country": "Algeria", "code": "+213"},
      {"country": "Andorra", "code": "+376"},
      {"country": "Angola", "code": "+244"},
      {"country": "Antigua and Barbuda", "code": "+1-268"},
      {"country": "Argentina", "code": "+54"},
      {"country": "Armenia", "code": "+374"},
      {"country": "Australia", "code": "+61"},
      {"country": "Austria", "code": "+43"},
      {"country": "Azerbaijan", "code": "+994"},
      {"country": "Bahamas", "code": "+1-242"},
      {"country": "Bahrain", "code": "+973"},
      {"country": "Bangladesh", "code": "+880"},
      {"country": "Barbados", "code": "+1-246"},
      {"country": "Belarus", "code": "+375"},
      {"country": "Belgium", "code": "+32"},
      {"country": "Belize", "code": "+501"},
      {"country": "Benin", "code": "+229"},
      {"country": "Bhutan", "code": "+975"},
      {"country": "Bolivia", "code": "+591"},
      {"country": "Bosnia and Herzegovina", "code": "+387"},
      {"country": "Botswana", "code": "+267"},
      {"country": "Brazil", "code": "+55"},
      {"country": "Brunei", "code": "+673"},
      {"country": "Bulgaria", "code": "+359"},
      {"country": "Burkina Faso", "code": "+226"},
      {"country": "Burundi", "code": "+257"},
      {"country": "Cabo Verde", "code": "+238"},
      {"country": "Cambodia", "code": "+855"},
      {"country": "Cameroon", "code": "+237"},
      {"country": "Canada", "code": "+1"},
      {"country": "Afghanistan", "code": "+93"},

      {"country": "Central African Republic", "code": "+236"},
      {"country": "Chad", "code": "+235"},
      {"country": "Chile", "code": "+56"},
      {"country": "China", "code": "+86"},
      {"country": "Colombia", "code": "+57"},
      {"country": "Comoros", "code": "+269"},
      {"country": "Congo", "code": "+243"},
      {"country": "Costa Rica", "code": "+506"},
      {"country": "Croatia", "code": "+385"},
      {"country": "Cuba", "code": "+53"},
      {"country": "Cyprus", "code": "+357"},
      {"country": "Czech Republic", "code": "+420"},
      {"country": "Denmark", "code": "+45"},
      {"country": "Djibouti", "code": "+253"},
      {"country": "Dominica", "code": "+1-767"},
      {"country": "Dominican Republic", "code": "+1-809"},
      {"country": "Ecuador", "code": "+593"},
      {"country": "Egypt", "code": "+20"},
      {"country": "El Salvador", "code": "+503"},
      {"country": "Equatorial Guinea", "code": "+240"},
      {"country": "Eritrea", "code": "+291"},
      {"country": "Estonia", "code": "+372"},
      {"country": "Eswatini", "code": "+268"},
      {"country": "Ethiopia", "code": "+251"},
      {"country": "Fiji", "code": "+679"},
      {"country": "Finland", "code": "+358"},
      {"country": "France", "code": "+33"},
      {"country": "Gabon", "code": "+241"},
      {"country": "Gambia", "code": "+220"},
      {"country": "Georgia", "code": "+995"},
      {"country": "Germany", "code": "+49"},
      {"country": "Ghana", "code": "+233"},
      {"country": "Greece", "code": "+30"},
      {"country": "Grenada", "code": "+1-473"},
      {"country": "Guatemala", "code": "+502"},
      {"country": "Guinea", "code": "+224"},
      {"country": "Guinea-Bissau", "code": "+245"},
      {"country": "Guyana", "code": "+592"},
      {"country": "Haiti", "code": "+509"},
      {"country": "Honduras", "code": "+504"},
      {"country": "Hungary", "code": "+36"},
      {"country": "Iceland", "code": "+354"},
      {"country": "India", "code": "+91"},
      {"country": "Indonesia", "code": "+62"},
      {"country": "Iran", "code": "+98"},
      {"country": "Iraq", "code": "+964"},
      {"country": "Ireland", "code": "+353"},
      {"country": "Israel", "code": "+972"},
      {"country": "Italy", "code": "+39"},
      {"country": "Jamaica", "code": "+1-876"},
      {"country": "Japan", "code": "+81"},
      {"country": "Jordan", "code": "+962"},
      {"country": "Kazakhstan", "code": "+7"},
      {"country": "Kenya", "code": "+254"},
      {"country": "Kiribati", "code": "+686"},
      {"country": "Korea, North", "code": "+850"},
      {"country": "Korea, South", "code": "+82"},
      {"country": "Kosovo", "code": "+383"},
      {"country": "Kuwait", "code": "+965"},
      {"country": "Kyrgyzstan", "code": "+996"},
      {"country": "Laos", "code": "+856"},
      {"country": "Latvia", "code": "+371"},
      {"country": "Lebanon", "code": "+961"},
      {"country": "Lesotho", "code": "+266"},
      {"country": "Liberia", "code": "+231"},
      {"country": "Libya", "code": "+218"},
      {"country": "Liechtenstein", "code": "+423"},
      {"country": "Lithuania", "code": "+370"},
      {"country": "Luxembourg", "code": "+352"},
      {"country": "Madagascar", "code": "+261"},
      {"country": "Malawi", "code": "+265"},
      {"country": "Malaysia", "code": "+60"},
      {"country": "Maldives", "code": "+960"},
      {"country": "Mali", "code": "+223"},
      {"country": "Malta", "code": "+356"},
      {"country": "Marshall Islands", "code": "+692"},
      {"country": "Mauritania", "code": "+222"},
      {"country": "Mauritius", "code": "+230"},
      {"country": "Mexico", "code": "+52"},
      {"country": "Micronesia", "code": "+691"},
      {"country": "Moldova", "code": "+373"},
      {"country": "Monaco", "code": "+377"},
      {"country": "Mongolia", "code": "+976"},
      {"country": "Montenegro", "code": "+382"},
      {"country": "Morocco", "code": "+212"},
      {"country": "Mozambique", "code": "+258"},
      {"country": "Myanmar", "code": "+95"},
      {"country": "Namibia", "code": "+264"},
      {"country": "Nauru", "code": "+674"},
      {"country": "Nepal", "code": "+977"},
      {"country": "Netherlands", "code": "+31"},
      {"country": "New Zealand", "code": "+64"},
      {"country": "Nicaragua", "code": "+505"},
      {"country": "Niger", "code": "+227"},
      {"country": "Nigeria", "code": "+234"},
      {"country": "North Macedonia", "code": "+389"},
      {"country": "Norway", "code": "+47"},
      {"country": "Pakistan", "code": "+92"},
      {"country": "Palau", "code": "+680"},
      {"country": "Palestine", "code": "+970"},
      {"country": "Panama", "code": "+507"},
      {"country": "Papua New Guinea", "code": "+675"},
      {"country": "Paraguay", "code": "+595"},
      {"country": "Peru", "code": "+51"},
      {"country": "Philippines", "code": "+63"},
      {"country": "Poland", "code": "+48"},
      {"country": "Portugal", "code": "+351"},
      {"country": "Qatar", "code": "+974"},
      {"country": "Romania", "code": "+40"},
      {"country": "Russia", "code": "+7"},
      {"country": "Rwanda", "code": "+250"},
      {"country": "Saint Kitts and Nevis", "code": "+1-869"},
      {"country": "Saint Lucia", "code": "+1-758"},
      {"country": "Saint Vincent and the Grenadines", "code": "+1-784"},
      {"country": "Samoa", "code": "+685"},
      {"country": "San Marino", "code": "+378"},
      {"country": "Sao Tome and Principe", "code": "+239"},
      {"country": "Senegal", "code": "+221"},
      {"country": "Serbia", "code": "+381"},
      {"country": "Seychelles", "code": "+248"},
      {"country": "Sierra Leone", "code": "+243"},
      {"country": "Singapore", "code": "+65"},
      {"country": "Slovakia", "code": "+421"},
      {"country": "Slovenia", "code": "+421"},
      {"country": "Solomon Islands", "code": "+677"},
      {"country": "Somalia", "code": "+252"},
      {"country": "South Africa", "code": "+27"},
      {"country": "South Sudan", "code": "+211"},
      {"country": "Spain", "code": "+34"},
      {"country": "Sri Lanka", "code": "+94"},
      {"country": "Sudan", "code": "+249"},
      {"country": "Suriname", "code": "+597"},
      {"country": "Sweden", "code": "+46"},
      {"country": "Switzerland", "code": "+41"},
      {"country": "Taiwan", "code": "+886"},
      {"country": "Tajikistan", "code": "+992"},
      {"country": "Tanzania", "code": "+255"},
      {"country": "Thailand", "code": "+66"},
      {"country": "Timor-Leste", "code": "+670"},
      {"country": "Togo", "code": "+228"},
      {"country": "Tonga", "code": "+676"},
      {"country": "Trinidad and Tobago", "code": "+1-868"},
      {"country": "Tunisia", "code": "+216"},
      {"country": "Turkey", "code": "+90"},
      {"country": "Turkmenistan", "code": "+993"},
      {"country": "Tuvalu", "code": "+688"},
      {"country": "Uganda", "code": "+256"},
      {"country": "Ukraine", "code": "+380"},
      {"country": "United Kingdom", "code": "+44"},
      {"country": "United States", "code": "+1"},
      {"country": "Uruguay", "code": "+598"},
      {"country": "Uzbekistan", "code": "+998"},
      {"country": "Vanuatu", "code": "+678"},
      {"country": "Vatican City", "code": "+39"},
      {"country": "Venezuela", "code": "+58"},
      {"country": "Vietnam", "code": "+84"},
      {"country": "Yemen", "code": "+967"},
      {"country": "Zambia", "code": "+260"},
      {"country": "Zimbabwe", "code": "+263"},



    // Add all other country codes here...

    ];

    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('9'.tr, style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => controller.statusRequest == StatusRequest.loading
              ? const Center(child: Text("Loading"))
              : Form(
            key: controller.formstate,
            child: ListView(
              children: [
                const LogoAuth(),
                CustomTextTitleAuth(text: "10".tr),
                const SizedBox(height: 10),
                CustomTextBodyauth(text: "11".tr),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        inputFormatters: [EnglishDigitsFormatter()],
                        controller: controller.phone,
                        textDirection: TextDirection.ltr,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontFamily: "cairo",
                        ),
                        decoration: InputDecoration(
                          labelText: "21".tr,
                          labelStyle: const TextStyle(fontSize: 14, fontFamily: "cairo"),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                          suffixIcon: const Icon(
                            Icons.phone_android,
                            color: Colors.grey,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: controller.code.text.isNotEmpty ? controller.code.text : null,
                                items: countryCodes.map((country) {
                                  return DropdownMenuItem<String>(
                                    value: country['code'],
                                    child: Text(
                                      country['code']!,
                                      style: const TextStyle(fontSize: 14, fontFamily: "cairo"),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newCode) {
                                  controller.code.text = newCode!;
                                  controller.update();
                                  controller.phone.clear();
                                },
                                isExpanded: false, // Prevent dropdown from expanding too much
                                iconSize: 24.0, // Adjust the dropdown arrow size
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        validator: (val) {
                          return validInput(val!, 5, 10, "phone", countryCode: controller.code.text);
                        },
                      ),
                    ),
                  ],
                ),                const SizedBox(height: 20),
                CustomTextFormAuth(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 8, 30, "password");
                  },
                  mycontroller: controller.password,
                  hinttext: "13".tr,
                  iconData: Icons.lock_outline,
                  labeltext: "19".tr,
                ),
                InkWell(
                  onTap: () {
                    controller.goToForgetPassword();
                  },
                  child: Text(
                    "14".tr,
                    textAlign: TextAlign.end,
                  ),
                ),
                CustomButtomAuth(
                  text: "15".tr,
                  onPressed: () {
                    controller.login();
                  },
                ),
                const SizedBox(height: 20),
                CustomTextSignUpOrSignIn(
                  textone: "16".tr,
                  texttwo: "17".tr,
                  onTap: () {
                    controller.goToSignUp();
                  },
                ),

                ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();

                    await prefs.setString("step", "guest");      // ✅ تظل كما هي
                    await prefs.setString("id", "guest");        // ✅ ID وهمي
                    await prefs.setBool("guest", true);          // ✅ هذا هو الجديد والمهم

                    Get.offAllNamed(AppRoute.homePage);          // الانتقال للصفحة الرئيسية
                  },
                  child: Text(
                    "110".tr,
                    style: TextStyle(color: AppColor.primaryColor2),
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}