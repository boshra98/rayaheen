import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpassword_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttomauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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

  String getFlagEmoji(String countryCode) {
    return countryCode.toUpperCase().codeUnits.map((e) => String.fromCharCode(e + 127397)).join();
  }

  late ForgetPasswordControllerImp controller;

  // Initialize selectedCountryCode as a state variable
 // String selectedCountryCode = "+971"; // Set a default value here

  @override
  void initState() {
    super.initState();
    controller = Get.put(ForgetPasswordControllerImp());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          '14'.tr,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                CustomTextTitleAuth(text: "27".tr),
                const SizedBox(height: 10),
                CustomTextBodyauth(text: "29".tr),
                const SizedBox(height: 15),
                TextFormField(
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontFamily: "cairo",
                  ),
                  keyboardType: TextInputType.phone,
                  controller: controller.phone,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    labelText: "21".tr,
                    labelStyle: const TextStyle(fontSize: 12, fontFamily: "cairo"),
                    hintText: "22".tr,
                    hintStyle: const TextStyle(fontSize: 12),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: controller.code.text.isEmpty ? null : controller.code.text,
                          hint: const Text("⚑ رمز الدولة"),
                          items: countryCodes.map((country) {
                            final iso = country['iso']!.toLowerCase();
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
                            controller.update();
                            controller.phone.clear();
                          },
                        ),
                      ),
                    ),
                    suffixIcon: const Icon(Icons.phone_android, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (val) {
                    return validInput(val!, 5, 15, "phone", countryCode: controller.code.text);
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller.email,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontFamily: "cairo",
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    labelText: "18".tr,
                    hintText: "12".tr,
                    prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (val) {
                    return validInput(val!, 5, 100, "email");
                  },
                ),
                const SizedBox(height: 35),
                CustomButtomAuth(
                  text: "30".tr,
                  onPressed: () {
                    controller.checkphone();
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
