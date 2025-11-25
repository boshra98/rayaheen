
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import 'customtitlehome.dart';

class ListAgeGroupRR extends GetView<HomeControllerImp> {
  const ListAgeGroupRR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            color: AppColor.secondColor,
            child: CustomTitleHome(title: '42'.tr)),
        Container(
          color: AppColor.secondColor,
          padding: EdgeInsets.zero,
          child: LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 600 ? 4 : 3;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: displayOrder.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  int realIndex = displayOrder[index];
                  return AgeGroupWidget(
                    i: realIndex,
                    ageGroupName: ageGroups[realIndex],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class AgeGroupWidget extends GetView<HomeControllerImp> {
  final String ageGroupName;
  final int? i;
  const AgeGroupWidget({Key? key, required this.ageGroupName, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/images/image1.jpg',
      'assets/images/image4.jpg',
      'assets/images/image2.jpg',
      'assets/images/image5.jpg',
      'assets/images/image3.jpg',
      'assets/images/image6.jpg',
    ];

    final String imagePath = imagePaths[i! % imagePaths.length];

    return InkWell(
      onTap: () {
        controller.goToItemsage(controller.categories, i!);
      },
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.secondColor,
            ),
            height: 70,
            width: 70,
            alignment: Alignment.center,
            child: ClipOval(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
