// import 'package:flutter/material.dart';
//
// import '../../../core/constant/color.dart';
//
// class CardPaymentMethodCheckout extends StatelessWidget {
//   final String title;
//   final bool isActive;
//   const CardPaymentMethodCheckout(
//       {Key? key, required this.title, required this.isActive})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 10),
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       decoration: BoxDecoration(
//           color: isActive == true ? AppColor.secondColor : AppColor.thirdColor,
//           borderRadius: BorderRadius.circular(20)),
//       child: Center(
//         child: Text(title,
//             style: TextStyle(
//                 color: isActive == true ? Colors.white : AppColor.primaryColor,
//                 height: 1,
//                 fontWeight: FontWeight.bold)),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../core/constant/color.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckout({
    Key? key,
    required this.title,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// البطاقة الأساسية
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color:
            isActive ? AppColor.secondColor : AppColor.thirdColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isActive ? Colors.white : AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        /// أيقونة الصح تظهر فقط إذا كانت البطاقة مفعّلة
        if (isActive)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(4),
              child: const Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
