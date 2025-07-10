import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../../../core/services/formatted.dart';
import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/textsignup.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final List<Map<String, String>> countryCodes = [
    {
      "country": "United Arab Emirates",
      "code": "+971",
      "iso": "ae",
      "flag": "https://flagcdn.com/w40/ae.png"
    },
    {
      "country": "Oman",
      "code": "+968",
      "iso": "om",
      "flag": "https://flagcdn.com/w40/om.png"
    },
    {
      "country": "Saudi Arabia",
      "code": "+966",
      "iso": "sa",
      "flag": "https://flagcdn.com/w40/sa.png"
    },
    {
      "country": "Syria",
      "code": "+963",
      "iso": "sy",
      "flag": "https://flagcdn.com/w40/sy.png"
    },
    {
      "country": "Qatar",
      "code": "+974",
      "iso": "qa",
      "flag": "https://flagcdn.com/w40/qa.png"
    },
    {
      "country": "Kuwait",
      "code": "+965",
      "iso": "kw",
      "flag": "https://flagcdn.com/w40/kw.png"
    },
    {
      "country": "Bahrain",
      "code": "+973",
      "iso": "bh",
      "flag": "https://flagcdn.com/w40/bh.png"
    },
    {
      "country": "Yemen",
      "code": "+967",
      "iso": "ye",
      "flag": "https://flagcdn.com/w40/ye.png"
    },
    {
      "country": "Egypt",
      "code": "+20",
      "iso": "eg",
      "flag": "https://flagcdn.com/w40/eg.png"
    },
    {
      "country": "Jordan",
      "code": "+962",
      "iso": "jo",
      "flag": "https://flagcdn.com/w40/jo.png"
    },
    {
      "country": "Lebanon",
      "code": "+961",
      "iso": "lb",
      "flag": "https://flagcdn.com/w40/lb.png"
    },
    {
      "country": "Iraq",
      "code": "+964",
      "iso": "iq",
      "flag": "https://flagcdn.com/w40/iq.png"
    },
    {
      "country": "Algeria",
      "code": "+213",
      "iso": "dz",
      "flag": "https://flagcdn.com/w40/dz.png"
    },
    {
      "country": "Tunisia",
      "code": "+216",
      "iso": "tn",
      "flag": "https://flagcdn.com/w40/tn.png"
    },
    {
      "country": "Morocco",
      "code": "+212",
      "iso": "ma",
      "flag": "https://flagcdn.com/w40/ma.png"
    },
    {
      "country": "Palestine",
      "code": "+970",
      "iso": "ps",
      "flag": "https://flagcdn.com/w40/ps.png"
    },
    {
      "country": "United States",
      "code": "+1",
      "iso": "us",
      "flag": "https://flagcdn.com/w40/us.png"
    },
    {
      "country": "United Kingdom",
      "code": "+44",
      "iso": "gb",
      "flag": "https://flagcdn.com/w40/gb.png"
    },
    {
      "country": "Germany",
      "code": "+49",
      "iso": "de",
      "flag": "https://flagcdn.com/w40/de.png"
    },
    {
      "country": "France",
      "code": "+33",
      "iso": "fr",
      "flag": "https://flagcdn.com/w40/fr.png"
    },
    {
      "country": "Turkey",
      "code": "+90",
      "iso": "tr",
      "flag": "https://flagcdn.com/w40/tr.png"
    },
    {
      "country": "India",
      "code": "+91",
      "iso": "in",
      "flag": "https://flagcdn.com/w40/in.png"
    },
    {
      "country": "Pakistan",
      "code": "+92",
      "iso": "pk",
      "flag": "https://flagcdn.com/w40/pk.png"
    },
    {
      "country": "Indonesia",
      "code": "+62",
      "iso": "id",
      "flag": "https://flagcdn.com/w40/id.png"
    },
    {
      "country": "Malaysia",
      "code": "+60",
      "iso": "my",
      "flag": "https://flagcdn.com/w40/my.png"
    },
    {
      "country": "Philippines",
      "code": "+63",
      "iso": "ph",
      "flag": "https://flagcdn.com/w40/ph.png"
    },
    {
      "country": "Bangladesh",
      "code": "+880",
      "iso": "bd",
      "flag": "https://flagcdn.com/w40/bd.png"
    },
    {
      "country": "Netherlands",
      "code": "+31",
      "iso": "nl",
      "flag": "https://flagcdn.com/w40/nl.png"
    },
    {
      "country": "Brazil",
      "code": "+55",
      "iso": "br",
      "flag": "https://flagcdn.com/w40/br.png"
    },

  ];

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          '17'.tr,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                CustomTextTitleAuth(text: "10".tr),
                const SizedBox(height: 15),
                CustomTextBodyauth(text: "24".tr),
                const SizedBox(height: 15),
                CustomTextFormAuth(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 3, 30, "username");
                  },
                  mycontroller: controller.username,
                  hinttext: "23".tr,
                  iconData: Icons.person,
                  labeltext: "20".tr,
                ),

                // Phone number field with country code dropdown
                const SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [EnglishDigitsFormatter()],

                  controller: controller.phone,
                  textDirection: TextDirection.ltr,


                  style: const TextStyle(
                      fontSize: 18.0, // Adjust the font size as needed
                      color: Colors.black,
                      fontFamily:"cairo"// Adjust the text color as needed
                  ),
                  decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    labelText: "21".tr,
                    labelStyle:const TextStyle(fontSize:14,fontFamily:"cairo"),

                    hintText: "22".tr,
                    hintStyle: const TextStyle(fontSize:14),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: controller.code.text,  // Bind to code controller
                          items: countryCodes.map((country) {
                            final iso = country['iso']!.toLowerCase(); // 'ae', 'sy', etc.

                            return DropdownMenuItem<String>(
                              value: country['code'],

                              child: Row(
                                children: [
                                  Image.network(
                                    'https://flagcdn.com/24x18/$iso.png',
                                    width: 24,
                                    height: 18,
                                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.flag),
                                  ),
                                  const SizedBox(width: 8),
                                  Text("${country['code']}"),
                                ],
                              ),
                            );

                          }).toList(),
                          onChanged: (newCode) {
                            controller.code.text = newCode!;
                            controller.update();  // Force UI update after selection

                            controller.phone.clear();
                          },
                        ),
                      ),
                    ),
                    suffixIcon: const Icon(
                      Icons.phone_android,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (val) {
                    return validInput(
                        val!, 5, 15, "phone", countryCode: controller.code.text);
                  },
                ),

                const SizedBox(height: 35),
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

                const SizedBox(height: 15),
                CustomButtomAuth(
                  text: "17".tr,
                  onPressed: () {
                    controller.signUp();
                  },
                ),
                const SizedBox(height: 40),
                CustomTextSignUpOrSignIn(
                  textone: "25".tr,
                  texttwo: "26".tr,
                  onTap: () {
                    controller.goToSignIn();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
