import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
          centerTitle:true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text('17'.tr, style:Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.grey))
      ),
      body: GetBuilder<SignUpControllerImp>(builder:(controller)=>Container(
        padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 30),
        child:Form(
          key:controller.formstate,

          child: ListView(children: [

            // SizedBox(height: 20,) ,
            CustomTextTitleAuth(text: "10".tr ,) ,
            const  SizedBox(height: 10) ,
            CustomTextBodyauth(text: "24".tr),
            const  SizedBox(height: 15) ,
            CustomTextFormAuth(
              isNumber: false,

              valid:(val){
                return validInput(val! ,5,30, "username") ;

              },
              mycontroller: controller.username,
              hinttext: "23".tr,
              iconData: Icons.person ,
              labeltext: "20".tr,

            ) ,
            CustomTextFormAuth(
              isNumber: false,

              valid:(val){
                return validInput(val! ,5,100, "email") ;

              },

              mycontroller: controller.email,
              hinttext: "12".tr,
              iconData: Icons.lock_outline,
              labeltext: "18".tr,
              //mycontrller
            ) ,

            CustomTextFormAuth(
              isNumber: true,

              valid:(val){
                return validInput(val! ,9,30, "phone") ;

              },

              mycontroller: controller.phone,
              hinttext: "22".tr,
              iconData: Icons.phone_android,
              labeltext: "21".tr,
              //mycontrller
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

            CustomButtomAuth(text:"17".tr,onPressed:(){
              controller.signUp() ;
            },),
            const  SizedBox(height: 40,),
            CustomTextSignUpOrSignIn(
              textone: "25".tr,
              texttwo: "26".tr,
              onTap: (){
                controller.goToSignIn();
              },
            ),

          ]),
        ),
      ),)

    );


  }

}