import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import '../../data/model/itemsmodel.dart'; // ✅ تأكد من استيراد `ItemsModel`
import '../../linkapi.dart'; // ✅ مكتبة لحساب الوقت المتبقي

class BooksListPageDisc extends StatelessWidget {
  final List<ItemsModel> items; // ✅ تأكد من أن `List<ItemsModel>` صحيح

  const BooksListPageDisc({Key? key, required this.items}) : super(key: key);

  /// **حساب الوقت المتبقي لانتهاء الخصم**
  String getRemainingTime(String expiresAt) {
    DateTime expiryDate = DateTime.parse(expiresAt);
    Duration remaining = expiryDate.difference(DateTime.now());

    if (remaining.isNegative) {
      return "انتهى الخصم";
    } else if (remaining.inDays > 0) {
      return "متبقي ${remaining.inDays} يوم";
    } else if (remaining.inHours > 0) {
      return "متبقي ${remaining.inHours} ساعة";
    } else {
      return "متبقي ${remaining.inMinutes} دقيقة";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("109".tr)),
      body: items.isEmpty
          ? Center(child: Text("لا توجد كتب بخصومات"))
          : Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // ✅ عدد الأعمدة
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.62, // ✅ التحكم في شكل العنصر
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final book = items[index]; // ✅ الحصول على بيانات الكتاب

            return GestureDetector(
              onTap: () {
                Get.toNamed("productdetails", arguments: {"itemsmodel": book});
              },
              child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                      mainAxisSize: MainAxisSize.min, // ✅ تجنب التمدد غير الضروري
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                  // ✅ صورة المنتج باستخدام CachedNetworkImage
                  Expanded(
                  child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: CachedNetworkImage(
                imageUrl: "${AppLink.imagesItems}/${book.itemsImage}",
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/placeholder.jpg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ),



                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ✅ اسم الكتاب
                          Text(
                            book.itemsName ?? "بدون اسم",
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "${(double.parse(book.itemsPrice!) * (1 - (double.parse(book.discount!.discountPercentage!) / 100))).toStringAsFixed(2)} درهم",
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),

                          const SizedBox(height: 5),

                          // ✅ السعر قبل الحسم بجانب السعر بعد الحسم ونسبة الحسم
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ✅ السعر بعد الحسم
                              // Text(
                              //   "${(double.parse(book.itemsPrice!) * (1 - (double.parse(book.discount!.discountPercentage!) / 100))).toStringAsFixed(2)} درهم",
                              //   style: const TextStyle(
                              //     fontSize: 11,
                              //     fontWeight: FontWeight.bold,
                              //     color: Colors.green,
                              //   ),
                              // ),

                              // ✅ السعر قبل الحسم (مشطوب)
                              Text(
                                "${book.itemsPrice} درهم",
                                style: const TextStyle(
                                  fontSize: 8,
                                  decoration: TextDecoration.lineThrough,
                                  color: AppColor.primaryColor2,
                                ),
                              ),

                             // ✅ نسبة الحسم (بدون فواصل)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "-${double.parse(book.discount!.discountPercentage!).toInt()}%", // ✅ حذف الفاصلة العشرية والأصفار
                                  style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                                ),
                              ),

                            ],
                          ),

                          const SizedBox(height: 5),

                          // ✅ الوقت المتبقي للخصم
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            // decoration: BoxDecoration(
                            //   color: Colors.grey[300], // ✅ لون رمادي
                            //   borderRadius: BorderRadius.circular(5),
                            // ),
                            child: Center(
                              child: Text(
                                getRemainingTime(book.discount!.expiresAt!),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
