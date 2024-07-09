import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login.dart';
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
    LoginControllerImp controller = Get.put(LoginControllerImp()) ;
    return Scaffold(
      appBar: AppBar(
          centerTitle:true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text('9'.tr, style:Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.grey))
      ),
      body:  Container(
        padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 30),
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
                return validInput(val! ,5,100, "email") ;

              },

              mycontroller: controller.email ,
              hinttext: "Enter your Email",
              iconData: Icons.email_outlined ,
              labeltext: "Email",

            ) ,

            CustomTextFormAuth(
              isNumber: false,

              valid:(val){
                return validInput(val! ,5,30, "password") ;
              },

              mycontroller: controller.password,
              hinttext: "12".tr,
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
      )
      ,);




  }

}