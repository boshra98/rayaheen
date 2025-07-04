
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../controller/home_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../data/model/categorymodel.dart';

import '../../data/model/itemsmodel.dart';
import '../../linkapi.dart';
import '../widget/customappbar2.dart';
import '../widget/home/customcardhome.dart';
import '../widget/home/customtitlehome.dart';
import '../widget/home/listagegroup.dart';
import '../widget/home/listagegroup_responsive.dart';
import '../widget/home/listagegroup_responsive_ordered.dart';
import '../widget/home/listcategorieshome.dart';

import 'package:cached_network_image/cached_network_image.dart';



import 'package:rayaheen_bookstore/view/widget/home/listitemshome.dart';

import '../widget/home/listitemshome_responsive_final.dart';
import 'allbooks.dart';
import 'allbooksdiscount.dart';
import 'newitems.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    // final CategoriesModel categoriesModel;
    final List<String> ageGroups = [
      "0-3  سنوات",
      "9-12 سنوات",
      " 3-6 سنوات",
      "12+ سنوات",
      "6-9  سنوات",
      "للأهل والمربين",
    ];
    final List<String> Groups = [
      "ذكر وأنثى",
      "أبطال الإسلام",
    ];
    int i = 0;
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Scaffold(
        key: _scaffoldKey, // Attach the key to the Scaffold
        endDrawer: Drawer(
          // Use endDrawer for the drawer to appear on the right side
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true, // Helps with wrapping the content

            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: AppColor.primaryColor2),
                child: Center(
                  // Center the content within the DrawerHeader
                  child: Container(
                    width: 100, // Set the desired circle size
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Circular shape
                      color: Colors.white, // Optional background color
                      border: Border.all(
                        color: Colors.grey.shade300, // Border color
                        width: 3, // Border width
                      ),
                      boxShadow: [
                        // Optional shadow for a polished look
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      // Ensures the logo image is clipped to a circle
                      child: Image.asset(
                        'assets/images/logo.png', // Path to the image
                        fit: BoxFit.cover, // Ensures the image fills the circle
                      ),
                    ),
                  ),
                ),
              ),

              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    "43".tr,
                    style: const TextStyle(color: AppColor.primaryColor2),
                  ),
                  children: [
                    ListTile(
                      title: Text("97".tr,
                          style: TextStyle(color: AppColor.primaryColor2)),
                      onTap: () async {
                        // Ensure data is fetched before navigating
                        if (controller.newitems.isEmpty) {
                          // Optionally, show a loading indicator or a message if the data is still loading
                          Get.snackbar("Loading",
                              "Please wait while the items are being loaded.");
                          return; // Prevent navigation if newitems is empty
                        }

                        // Proceed with navigation once newitems is not empty
                        Get.to(() => NewItemsPage(items: controller.newitems));
                      },
                    ),
                  ],
                ),
              ),
              ExpansionTile(
                title: Text('92'.tr,
                    style: const TextStyle(color: AppColor.primaryColor2)),
                // leading: const Icon(Icons.numbers_rounded,color:AppColor.primaryColor2), // Optional: Add an icon if needed
                children: [
                  ListTile(
                    title: Text(ageGroups[0]),
                    onTap: () {
                      controller.goToItemsage(controller.categories, 0);

                      // Handle tap for the first child
                      // Get.back();
                    },
                  ),
                  ListTile(
                    title: Text(ageGroups[2]),
                    onTap: () {
                      controller.goToItemsage(controller.categories, 2);

                      // Handle tap for the second child
                      // Get.back();
                    },
                  ),
                  ListTile(
                    title: Text(ageGroups[4]),
                    onTap: () {
                      controller.goToItemsage(controller.categories, 4);

                      // Handle tap for the third child
                      //Get.back();
                    },
                  ),
                  ListTile(
                    title: Text(ageGroups[1]),
                    onTap: () {
                      // Handle tap for the third child
                      controller.goToItemsage(controller.categories, 1);
                    },
                  ),
                  ListTile(
                    title: Text(ageGroups[3]),
                    onTap: () {
                      controller.goToItemsage(controller.categories, 3);

                      // Handle tap for the third child
                      // Get.back();
                    },
                  ),
                  ListTile(
                    title: Text(ageGroups[5]),
                    onTap: () {
                      controller.goToItemsage(controller.categories, 5);

                      // Handle tap for the third child
                      //  Get.back();
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('93'.tr,
                    style: const TextStyle(color: AppColor.primaryColor2)),
                //leading: const Icon(Icons.category,color:AppColor.primaryColor2),
                children: controller.categories.isNotEmpty
                    ? controller.categories.map<Widget>((category) {
                        final categoryModel =
                            CategoriesModel.fromJson(category);
                        return ListTile(
                          title:
                              Text(categoryModel.categoriesName ?? 'No Name'),
                          onTap: () {
                            controller.goToItems(
                                controller.categories,
                                controller.categories.indexOf(category),
                                categoryModel.categoriesId!.toString()
                                // categoryModel.categoriesId! as String ,
                                );
                          },
                        );
                      }).toList()
                    : [
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
              ),
              //select by publisher/////////////////////////////////////////////////////
              ExpansionTile(
                title: Text('91'.tr,
                    style: const TextStyle(
                      color: AppColor.primaryColor2,
                    )),
                //leading: const Icon(Icons.book,color:AppColor.primaryColor2),
                children: controller.publishers.isNotEmpty
                    ? controller.publishers.map<Widget>((publisher) {
                        return ListTile(
                          title: Text(publisher),
                          onTap: () {
                            print("Selected publisher: $publisher");

                            controller.goToItemsByPublisher(
                                publisher, controller.categories);

                          },
                        );
                      }).toList()
                    : [
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
              ),

              //all books//////////////////////////////////////////////////////////////////////
              ExpansionTile(
                title: Text("94".tr,
                    style: const TextStyle(color: AppColor.primaryColor2)),
                children: [
                  ListTile(
                    title: Text("95".tr,
                        style: TextStyle(color: AppColor.primaryColor2)),
                    onTap: () {
                      Get.to(() => BooksListPage(items: controller.books));
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("107".tr,
                    style: const TextStyle(color: AppColor.primaryColor2)),
                children: [
                  ListTile(
                    title: Text("108".tr,
                        style: TextStyle(color: AppColor.primaryColor2)),
                      onTap: () {
                        List<ItemsModel> discountedBooks = controller.getDiscountedBooks();
                        print("📢 عدد الكتب المتاحة بخصومات: ${discountedBooks.length}");
                        Get.to(() => BooksListPageDisc(items: discountedBooks));
                      }


                  ),
                ],
              ),
              const SizedBox(height: 70),




            ],
          ),
        ),
        body: Container(
          //padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              CustomAppBar2(
                onPressedMenu: () {
                  // Open the end drawer when the menu button is pressed
                  _scaffoldKey.currentState?.openEndDrawer();
                },
                onPressedSearch: () {
                  // Handle search button press
                },
                logoPath:
                    'assets/images/logo.png', // Replace with your logo path
              ),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomCardHome(),
                          CustomTitleHome(title: '43'.tr),
                          //const ListItemsHome(),
                          const ListItemsHomeResponsive(),

                          // CustomTitleHome(title: '42'.tr,),
                          const ListAgeGroupRR(),
                          CustomTitleHome(title: '74'.tr),
                          const ListCategoriesHome(),
                        ],
                      )
                    : ListItemsSearch(listdatamodel: controller.listdata),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return GridView.builder(
          shrinkWrap: true, // ✅ يسمح بتحديد الارتفاع بناءً على العناصر
          physics: NeverScrollableScrollPhysics(), //
          itemCount: listdatamodel.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
            // عدد الأعمدة في الشبكة
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: MediaQuery.of(context).orientation == Orientation.portrait
                ? 0.7
                : 1.0,
          ),
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            final itemsModel = listdatamodel[index];


            return InkWell(

              onTap: () {
                Get.find<HomeControllerImp>().goToPageProductDetails(itemsModel);
              },
              child: Column(
                children: [
                  // Stack with Image and Background
                  Stack(
                    children: [
                      // Background Container with Rounded Corners
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColor.secondColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 120,
                        width: 130,
                      ),

                      // Image Positioned at the Center
                      Positioned(
                        top: 5,
                        left: 5,
                        right: 5,
                        child: CachedNetworkImage(
                          imageUrl: itemsModel.itemsImage != null
                              ? "${AppLink.imagesItems}/${itemsModel.itemsImage}"
                              : "https://via.placeholder.com/90", // صورة افتراضية
                          height: 90,
                          width: 90,
                          fit: BoxFit.contain,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),

                      // إظهار نسبة الخصم إذا كان هناك خصم


                      // زر إضافة إلى السلة
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor2,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: IconButton(
                            onPressed: () {
                              final CartController cartController = Get.find<CartController>();
                              if (itemsModel?.itemsId != null && itemsModel!.itemsCount! > 0) {
                                cartController.add(itemsModel!.itemsId!.toString());
                              } else {
                                // تنبيه المستخدم أن المنتج غير متوفر
                                Get.snackbar("تنبيه", "هذا المنتج غير متوفر حاليًا");
                              }
                            },
                            icon: const Icon(
                              Icons.shopping_cart_outlined,
                              size: 14,
                              color: AppColor.secondColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Text Below the Stack
                  Text(
                    itemsModel.itemsName ?? "اسم غير معروف",
                    style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 13,
                      fontFamily: "ttf",
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  // عرض السعر مع أو بدون خصم

                    Text(
                      "${double.parse(itemsModel.itemsPrice!).round()} درهم",
                      style: const TextStyle(
                        color: AppColor.primaryColor2,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "cairo",
                      ),
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
