
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/itemsmodel.dart';
import '../../screen/newitems.dart';
import 'listitemshome.dart';

class ListItemsHomeResponsive extends GetView<HomeControllerImp> {
  const ListItemsHomeResponsive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    final isWideScreen = MediaQuery.of(context).size.width > 600;

    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        if (controller.newitems.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        List<ItemsModel> items = controller.newitems.map((e) => ItemsModel.fromJson(e)).toList();

        if (isWideScreen) {
          // Grid with 3 items + more button inline
          final displayItems = items.length > 3 ? items.sublist(0, 3) : items;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Expanded Grid
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: displayItems.length,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: MediaQuery.of(context).orientation == Orientation.portrait
                          ? 0.7
                          : 1.0,
                    ),
                    itemBuilder: (context, index) {
                      return ItemsHome(itemsModel: displayItems[index]);
                    },
                  ),
                ),
                // More Button as Circle
                if (items.length > 3)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => NewItemsPage(items: []));
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor2.withOpacity(0.85),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        } else {
          // Horizontal list for small screens
          return SizedBox(
            height: 130,
            child: ListView.builder(
              itemCount: items.length > 9 ? 10 : items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                if (i == 9) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => NewItemsPage(items: []));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor2.withOpacity(0.8),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return ItemsHome(itemsModel: items[i]);
              },
            ),
          );
        }
      },
    );
  }
}
