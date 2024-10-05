import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaheen_bookstore/view/screen/home.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
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

    Get.put(LoginControllerImp()) ;
    return Scaffold(
      appBar: AppBar(
          centerTitle:true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text('9'.tr, style:Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColor.grey))
      ),
      body:  Container(
        child: GetBuilder<LoginControllerImp>(
        builder: (controller) =>
    controller.statusRequest == StatusRequest.loading
        ?  const Center(child: Text("Loading"))
        : Container(
      padding: const EdgeInsets.symmetric(
          vertical: 15, horizontal: 30),
       // padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 30),
        child:Form(
          key:controller.formstate,
          child: ListView(children: [
            const  LogoAuth(),
            // SizedBox(height: 20,) ,
            CustomTextTitleAuth(text: "10".tr ,) ,
            const  SizedBox(height: 10) ,
            CustomTextBodyauth(text: "11".tr),
            const  SizedBox(height: 15) ,
            CustomTextFormAuth(
              isNumber: false,

              valid:(val){
                return validInput(val! ,9,9,"phone") ;

              },

              mycontroller: controller.phone,
              hinttext: "Enter your phone",
              iconData: Icons.phone ,
              labeltext: "phone",


            ) ,

            CustomTextFormAuth(
              isNumber: false,

              valid:(val){
                return validInput(val! ,5,30, "password") ;
              },

              mycontroller: controller.password,
              hinttext: "13".tr,
              iconData: Icons.lock_outline,
              labeltext: "19".tr,
              //mycontrller
            ) ,
            InkWell(
              onTap:(){
                controller.goToForgetPassword();
              },
              child:  Text("14".tr,textAlign:TextAlign.end
                ,),
            ) ,
            CustomButtomAuth(text:"15".tr,onPressed:(){
// Simulate login by saving a token
//               SharedPreferences prefs = await SharedPreferences.getInstance();
//               await prefs.setString('auth_token', 'user_token');
              controller.login();
            },),
            const  SizedBox(height: 40,),
            CustomTextSignUpOrSignIn(
              textone: "16".tr,
              texttwo: "17".tr,
              onTap: (){
                controller.goToSignUp();
              },
            )
          ]),
        ),
    ),
        )),
    );
  }
}