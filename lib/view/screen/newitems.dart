import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../controller/items_controller.dart';
import '../../core/constant/routes.dart';
import '../../data/model/itemsmodel.dart';
import '../widget/home/listitemshome.dart';
import '../widget/home/listitemshome2.dart';
import '../widget/items/customlistitems.dart'; // Assuming you're using this widget for grid items



class NewItemsPage extends StatelessWidget {
  final List items;

  const NewItemsPage({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        // Ensure that items are available before building the UI
        if (controller.newitems.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(), // Show loading indicator if no items
          );
        }

        return Scaffold(
          appBar: AppBar(title: Text("98".tr)),
          body: GridView.builder(
            shrinkWrap: true, // Ensures it does not take up excess space
            physics: AlwaysScrollableScrollPhysics(), // Allow scrolling in all cases
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              childAspectRatio: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 0.8
                  : 1.0,              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,  // Space between columns (horizontally)
// Space between rows (vertically)
// Aspect ratio for items in grid
            ),
            itemCount: controller.newitems.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, i) {
              
              final itemsModel = ItemsModel.fromJson(controller.newitems[i]);
              return ItemsHome2(itemsModel: itemsModel);
            },
          ),
        );
      },
    );
  }
}
