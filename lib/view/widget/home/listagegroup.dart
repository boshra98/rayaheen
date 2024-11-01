import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';

class ListAgeGroup extends GetView<HomeControllerImp>  {
  const ListAgeGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of fixed age group names
    final List<String> ageGroups = [
      "0-3  سنوات",
      "9-12 سنوات",
      " 3-6 سنوات",
      "12+ سنوات",

      "6-9  سنوات",

      "لليافعين",
    ];

    return SizedBox(
      height: 200,  // Keep the same height restriction
      child: GridView.builder(
        itemCount: ageGroups.length,  // Use the fixed age group count
        scrollDirection: Axis.horizontal,  // Horizontal scrolling
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,  // Two rows due to height limit
          crossAxisSpacing: 20,  // Horizontal spacing between items
          mainAxisSpacing: 40,  // Vertical spacing between items
          childAspectRatio: 1,  // Adjust aspect ratio if necessary
        ),
        itemBuilder: (context, index) {
          return AgeGroupWidget(
            i: index,
            ageGroupName: ageGroups[index],  // Pass the fixed age group name
          );
        },
      ),
    );
  }
}

class AgeGroupWidget extends GetView<HomeControllerImp> {
  final String ageGroupName;
  final int? i;
  const AgeGroupWidget({Key? key, required this.ageGroupName, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of circle colors
    final List<Color> circleColors = [
      AppColor.primaryColor,
      AppColor.secondColor,
      AppColor.thirdColor,
      AppColor.fourthColor,
    ];

    // Cycle through the colors if the index exceeds the list length
    final Color circleColor = circleColors[i! % circleColors.length];

    return InkWell(
      onTap: () {
        print("Selected Age Group: $i ");
        //controller.goToItemsage( i!);
        controller.goToItemsage(controller.categories , i!);

        // Handle age group selection logic here (if necessary)

      },
      child: Column(
        children: [
          // Circular container for the age group
          Container(
            decoration: BoxDecoration(
              color: circleColor,  // Dynamic circle color
              shape: BoxShape.circle,  // Makes the container a circle
            ),
            height: 80,
            width: 80,
            alignment: Alignment.center,  // Centers the text inside the circle
            child: Text(
              ageGroupName,  // Display the fixed age group name
              style: const TextStyle(
                color: Colors.white,  // Text color
                fontWeight: FontWeight.bold,  // Bold text style
                fontSize: 16,  // Adjust text size if needed
              ),
              textAlign: TextAlign.center,  // Center the text
            ),
          ),
        ],
      ),
    );
  }
}
