import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../data/model/itemsmodel.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../data/model/itemsmodel.dart';
import '../widget/home/listitemshome.dart';
import '../widget/home/listitemshome2.dart';
import '../widget/items/customlistitems.dart'; // Assuming you're using this widget for grid items

class BooksListPage extends StatelessWidget {
  final List items; // List of books for the selected category

  const BooksListPage({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("96".tr)),
      body: items.isNotEmpty
          ? GridView.builder(
        shrinkWrap: true, // Ensures it does not take up excess space
        physics: AlwaysScrollableScrollPhysics(), // Allow scrolling in all cases
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          childAspectRatio: MediaQuery.of(context).orientation == Orientation.portrait
              ? 0.7
              : 1.0,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,  // Space between columns (horizontally)
// Space between rows (vertically)
// Aspect ratio for items in grid
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final itemsModel = items[index]; // ✅ استخدم العنصر مباشرةً دون `fromJson()`
          return ItemsHome2(itemsModel: itemsModel);
        },
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}


