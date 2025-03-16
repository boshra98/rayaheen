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

  const PriceAndCountItems({
    Key? key,
    required this.onAdd,
    required this.onRemove,
    required this.price,
    required this.count,
    this.discountPercentage, // ✅ اجعلها اختيارية
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ✅ تحويل السعر ونسبة الخصم إلى أرقام
    double originalPrice = double.tryParse(price) ?? 0.0;
    double discount = double.tryParse(discountPercentage ?? "0") ?? 0.0;

    // ✅ حساب السعر بعد الخصم
    double discountedPrice = originalPrice - (originalPrice * (discount / 100));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ عند وجود خصم، عرض السعر الأصلي مشطوب والسعر الجديد
        if (discount > 0)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ السعر الأصلي مشطوب
              Text(
                "$originalPrice درهم",
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough, // ❌ شطب السعر القديم
                ),
              ),
              const SizedBox(height: 4),

              // ✅ السعر بعد الخصم
              Text(
                "$discountedPrice درهم", // ✅ عرض السعر الجديد بعد الخصم
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // ✅ نسبة الخصم
              Text(
                "خصم $discountPercentage%",
                style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        else
        // ✅ عرض السعر العادي إذا لم يكن هناك خصم
          Text(
            "$originalPrice درهم",
            style: const TextStyle(
              color: AppColor.primaryColor2,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),

        const SizedBox(height: 15),

        // ✅ أزرار الإضافة والإزالة
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


// ✅ دالة لحساب السعر بعد الحسم
//   double calculateDiscountedPrice(String price, String discountPercentage) {
//     double originalPrice = double.tryParse(price) ?? 0.0;
//     double discount = double.tryParse(discountPercentage) ?? 0.0;
//     return originalPrice - (originalPrice * (discount / 100));
//   }


}
