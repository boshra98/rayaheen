import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

// class PriceAndCountItems extends StatelessWidget {
//   final void Function()? onAdd;
//   final void Function()? onRemove;
//   final String price;
//    final String count;
//
//
//
//   const PriceAndCountItems(
//       {Key? key,
//         required this.onAdd,
//         required this.onRemove,
//         required this.price,
//         required this.count})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//         // Price and Count in a Column
//         Column(
//           // mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             //const SizedBox(height: 8,),
//             //padding: const EdgeInsets.only(top: 4),
//
//             Text(
//               "$price درهم\ ",
//               style: const TextStyle(
//                   color: AppColor.primaryColor2, fontSize: 16, fontWeight: FontWeight.w300,                      // fontWeight: FontWeight.w300,
//
//                  ),
//             ),
//             const SizedBox(height: 15),
//
//             Row(
//               children: [
//                 IconButton(
//                   onPressed: onAdd,
//                   icon: const Icon(Icons.add_circle, color: AppColor.primaryColor2),
//                 ),
//                 Container(
//                   alignment: Alignment.centerLeft,
//                  //padding: const EdgeInsets.only(top: 4),
//                   child: Text(
//                     count,
//
//                     style: const TextStyle(
//                         fontSize: 20, height: 1.1, color: AppColor.primaryColor),
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: onRemove,
//                   icon: const Icon(Icons.remove_circle, color: AppColor.primaryColor2),
//                 ),
//               ],
//             ),
//
//           ],
//
//     );
//
//
//
//   }
// }




class PriceAndCountItems extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
  final String count;
  final String? discountPercentage; // ✅ نسبة الخصم الجديدة
  final String? expiresAt; // ✅ تاريخ انتهاء الحسم

  const PriceAndCountItems({
    Key? key,
    required this.onAdd,
    required this.onRemove,
    required this.price,
    required this.count,
    this.discountPercentage, // ✅ اجعلها اختيارية
    this.expiresAt, // ✅ إضافة تاريخ انتهاء الحسم
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ✅ تحويل السعر ونسبة الخصم إلى أرقام
    double originalPrice = double.tryParse(price) ?? 0.0;
    double discount = double.tryParse(discountPercentage ?? "0") ?? 0.0;
    double discountedPrice = originalPrice - (originalPrice * (discount / 100));

    // ✅ التحقق من `expiresAt`
    DateTime? expiryDate;
    if (expiresAt != null && expiresAt!.isNotEmpty) {
      try {
        expiryDate = DateTime.parse(expiresAt!);
      } catch (e) {
        print("❌ خطأ في تحليل تاريخ الحسم: $e");
      }
    }

    bool isDiscountActive = expiryDate != null &&
        DateTime.now().isBefore(expiryDate);

    print("✅ السعر الأصلي: $originalPrice درهم");
    print("✅ نسبة الخصم: $discount%");
    print("✅ السعر بعد الخصم: $discountedPrice درهم");
    print("✅ تاريخ انتهاء الحسم: $expiresAt");
    print("✅ الحسم نشط؟ $isDiscountActive");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // ✅ جعل العناصر تبدأ من اليسار دائمًا
      children: [
        if (isDiscountActive && discount > 0)
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // ✅ التأكد من أن العناصر تبدأ من اليسار
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min, // ✅ منع `Row` من إجبار العناصر على التمدد
            children: [

              // ✅ السعر بعد الحسم مع كلمة "درهم" بجانبه مباشرة
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "$discountedPrice",
                    style: const TextStyle(
                      color: AppColor.primaryColor2,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 2), // ✅ مسافة صغيرة بين السعر وكلمة "درهم"
                  const Text(
                    "درهم",
                    style: TextStyle(
                      color: AppColor.primaryColor2,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),

              // ✅ السعر الأصلي (مشطوب) مع "درهم" بجانبه
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "$originalPrice",
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: 2), // ✅ مسافة صغيرة بين السعر وكلمة "درهم"
                  // const Text(
                  //   "درهم",
                  //   style: TextStyle(
                  //     color: Colors.orange,
                  //     fontSize: 8,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(width: 8),

              // ✅ نسبة الخصم داخل صندوق أحمر
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "-${double.parse(discountPercentage!).toInt()}%", // ✅ حذف الفاصلة العشرية والأصفار
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        else
          Align(
            alignment: AlignmentDirectional.centerStart, // ✅ التأكد من أن السعر يظهر من البداية
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "$originalPrice",
                  style: const TextStyle(
                    color: AppColor.primaryColor2,
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(width: 4), // ✅ مسافة صغيرة بين السعر وكلمة "درهم"
                const Text(
                  "درهم",
                  style: TextStyle(
                    color: AppColor.primaryColor2,
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),

        const SizedBox(height: 15),

        Row(
          children: [
            IconButton(
              onPressed: onAdd,
              icon: const Icon(Icons.add_circle, color: AppColor.primaryColor2),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                count,
                style: const TextStyle(
                  fontSize: 20,
                  height: 1.1,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
            IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.remove_circle, color: AppColor.primaryColor2),
            ),
          ],
        ),
      ],
    );







  }
}



// ✅ دالة لحساب السعر بعد الحسم
//   double calculateDiscountedPrice(String price, String discountPercentage) {
//     double originalPrice = double.tryParse(price) ?? 0.0;
//     double discount = double.tryParse(discountPercentage) ?? 0.0;
//     return originalPrice - (originalPrice * (discount / 100));
//   }


//}
