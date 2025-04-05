import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart'; // ✅ استيراد `CartController`
import '../../core/constant/color.dart';
import '../../data/model/itemsmodel.dart';
import '../../linkapi.dart';

class BooksListPageDisc extends StatelessWidget {
  final List<ItemsModel> items;

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
          ? const Center(child: Text("لا توجد كتب بخصومات"))
          : Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
              childAspectRatio: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 0.7
                  : 1.0,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final book = items[index];
            final CartController cartController = Get.find<CartController>(); // ✅ استدعاء `CartController`

            return GestureDetector(
              onTap: () {
                Get.toNamed("productdetails", arguments: {"itemsmodel": book});
              },
              child: Card(
                color:AppColor.secondColor,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ✅ صورة المنتج
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                        child: CachedNetworkImage(
                          imageUrl: "${AppLink.imagesItems}/${book.itemsImage}",
                          width: double.infinity,
                          height: 100,
                          //width: 100,
                          fit: BoxFit.fitHeight,
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/images/placeholder.jpg',
                            width: double.infinity,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),

                    // ✅ معلومات المنتج
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ✅ اسم الكتاب
                          Text(
                            book.itemsName ?? "بدون اسم",
                            style: const TextStyle(fontSize: 15,color:AppColor.primaryColor2,fontWeight: FontWeight.w500,  fontFamily: "ttf",

                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                          ),
                          const SizedBox(height: 5),

                          // ✅ السعر الجديد بعد الخصم
                          Text(
                            "${(double.parse(book.itemsPrice!) * (1 - (double.parse(book.discount!.discountPercentage!) / 100))).round()} درهم",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily:"cairo",
                              color: AppColor.primaryColor2,
                            ),
                          ),

                          // ✅ السعر قبل الحسم ونسبة الخصم
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ✅ السعر الأصلي (مشطوب)
                              Text(
                                "${double.parse(book.itemsPrice!).toInt()} درهم", // ✅ تحويل السعر إلى عدد صحيح فقط
                                style: const TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.black,
                                  fontFamily:"cairo",

                                ),
                              ),


                              // ✅ نسبة الخصم
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "-${double.parse(book.discount!.discountPercentage!).toInt()}%", // ✅ حذف الفاصلة العشرية
                                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold,   fontFamily:"cairo",
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 5),

                          // ✅ الوقت المتبقي للحسم وأيقونة السلة
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ✅ الوقت المتبقي
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                child: Text(
                                  getRemainingTime(book.discount!.expiresAt!),
                                  style: const TextStyle(
                                    color: Colors.black,fontFamily:"cairo",
                                    fontSize: 10,
                                  ),
                                ),
                              ),

                              // ✅ أيقونة السلة لإضافة المنتج مباشرة
                              IconButton(
                                onPressed: () {

                                  cartController.add(book.itemsId!.toString());
                                },
                                icon: const Icon(Icons.shopping_cart),
                                iconSize: 20,
                                color: AppColor.primaryColor2,
                              ),
                            ],
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
