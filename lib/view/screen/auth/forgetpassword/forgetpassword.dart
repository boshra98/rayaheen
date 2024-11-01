import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpassword_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttomauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller= Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
          centerTitle:true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text('14'.tr, style:Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColor.grey))
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 30),
        child:Form(
          key:controller.formstate,

          child: ListView(children: [

            const SizedBox(height: 20,) ,
            CustomTextTitleAuth(text: "27".tr ,) ,
            const  SizedBox(height: 10) ,
            CustomTextBodyauth(text: "29".tr),
            const  SizedBox(height: 15) ,

            CustomTextFormAuth(
              isNumber: false,

              valid:(val){
                return validInput(val! ,9,9, "phone") ;

              },

              mycontroller: controller.phone,
              hinttext: "22".tr,
              iconData: Icons.phone,
              labeltext: "21".tr,
              //mycontrller
            ) ,




            CustomButtomAuth(text:"30".tr,onPressed:(){
              controller.checkphone();
            },),
            const  SizedBox(height: 40,),


          ]),
        ),
      ),

    );


  }

}