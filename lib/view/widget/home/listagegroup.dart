import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import 'customtitlehome.dart';

// class ListAgeGroup extends GetView<HomeControllerImp>  {
//   const ListAgeGroup({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // List of fixed age group names
//     final List<String> ageGroups = [
//       "0-3 سنوات",
//       "9-12 سنوات",
//       "3-6 سنوات",
//       "12+ سنوات",
//       "6-9 سنوات",
//       "للأهل والمربين",
//     ];
//     final List<int> displayOrder = [0, 2, 4, 1, 3, 5];
//
//     return Container(
//        color: AppColor.secondColor,
//        padding: EdgeInsets.zero, // Remove any padding
//       // margin: EdgeInsets.zero, // Remove any margin
// // Ensure it takes the full width
// // Set the background color
//       child: SizedBox(
//
//         height: 200, // Keep the same height restriction
//         child: GridView.builder(
//
//           itemCount: ageGroups.length, // Use the fixed age group count
//           physics: const NeverScrollableScrollPhysics(), // Disable scrolling
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3, // 3 items per row for symmetry
//             crossAxisSpacing: 50, // Equal horizontal spacing between circles
//             mainAxisSpacing: 20, // Equal vertical spacing between circles
//             childAspectRatio: 1, // Ensure items are square
//           ),
//           itemBuilder: (context, index) {
//             // Add conditional padding for the first row
//             final int originalIndex = displayOrder[index];
//
//             bool isFirstRow = index < 3; // First row items
//             return Padding(
//               padding: EdgeInsets.only(top: isFirstRow ? 20.0 : 0.0), // Add extra space to first-row items
//               child: AgeGroupWidget(
//                 i: originalIndex,
//                 ageGroupName: ageGroups[originalIndex], // Pass the fixed age group name
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
// }
class ListAgeGroup extends GetView<HomeControllerImp> {
  const ListAgeGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of fixed age group names
    final List<String> ageGroups = [
      "0-3 سنوات",
      "9-12 سنوات",
      "3-6 سنوات",
      "لليافعين",
      "6-9 سنوات",
      "للأهل والمربين",
    ];
    final List<int> displayOrder = [0, 2, 4, 1, 3, 5];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // Ensure no extra vertical space
      children: [

        // Title widget above the grid
        Container(
            color: AppColor.secondColor, // Set background color
            child: CustomTitleHome(title: '42'.tr)),

        // Container wrapping the grid
        Container(
          color: AppColor.secondColor, // Set background color
          padding: EdgeInsets.zero,    // Remove padding
          child: SizedBox(
            height: 200, // Keep the same height restriction
            child: GridView.builder(
              itemCount: ageGroups.length, // Use the fixed age group count
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 3,
                crossAxisSpacing: 30,
                mainAxisSpacing: 20,
                childAspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height * 1.1,
              ),

              itemBuilder: (context, index) {
                // Add conditional padding for the first row
                final int originalIndex = displayOrder[index];

                bool isFirstRow = index < 3; // First row items
                return Padding(
                  padding: EdgeInsets.only(top: isFirstRow ? 20.0 : 0.0), // Add extra space to first-row items
                  child: AgeGroupWidget(
                    i: originalIndex,
                    ageGroupName: ageGroups[originalIndex], // Pass the fixed age group name
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}


// class AgeGroupWidget extends GetView<HomeControllerImp> {
//   final String ageGroupName;
//   final int? i;
//   const AgeGroupWidget({Key? key, required this.ageGroupName, required this.i}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // List of image paths (replace with your actual image paths)
//     final List<String> imagePaths = [
//       'assets/images/image1.jpg',
//       'assets/images/image4.jpg',
//       'assets/images/image2.jpg',
//       'assets/images/image5.jpg',
//       'assets/images/image3.jpg',
//       'assets/images/image6.jpg',
//     ];
//
//     // Use modulo to cycle through images if the index exceeds the image list length
//     final String imagePath = imagePaths[i! % imagePaths.length];
//
//     return InkWell(
//       onTap: () {
//         print("Selected Age Group: $i ");
//         controller.goToItemsage(controller.categories, i!);
//       },
//       child: Column(
//         children: [
//           // Circular container for the age group with an image
//           Container(
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,  // Makes the container a circle
//             ),
//             height: 80,
//             width: 80,
//             alignment: Alignment.center,  // Centers the image inside the circle
//             child: ClipOval(  // Ensures the image is clipped to a circle
//               child: Image.asset(
//                 imagePath,  // Dynamic image path
//                 fit: BoxFit.cover,  // Ensures the image covers the entire circle
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class AgeGroupWidget extends GetView<HomeControllerImp> {
  final String ageGroupName;
  final int? i;
  const AgeGroupWidget({Key? key, required this.ageGroupName, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of image paths (replace with your actual image paths)
    final List<String> imagePaths = [
      'assets/images/image1.jpg',
      'assets/images/image4.jpg',
      'assets/images/image2.jpg',
      'assets/images/image5.jpg',
      'assets/images/image3.jpg',
      'assets/images/image6.jpg',
    ];

    // Use modulo to cycle through images if the index exceeds the image list length
    final String imagePath = imagePaths[i! % imagePaths.length];

    return InkWell(
      onTap: () {
        print("Selected Age Group: $i ");
        controller.goToItemsage(controller.categories, i!);
      },
      child: Column(

        children: [

          // Circular container for the age group with an image
          Container(

            decoration: const BoxDecoration(
              shape: BoxShape.circle, // Makes the container a circle
              color: AppColor.secondColor, // Background color
            ),
            height: 70, // Adjust circle size (smaller than 80)
            width: 70,  // Adjust circle size (smaller than 80)
            alignment: Alignment.center, // Centers the image inside the circle
            child: ClipOval( // Ensures the image is clipped to a circle
              child: Image.asset(
                imagePath, // Dynamic image path
                fit: BoxFit.cover, // Ensures the image covers the entire circle
              ),
            ),
          ),
        ],
      ),
    );
  }
}
