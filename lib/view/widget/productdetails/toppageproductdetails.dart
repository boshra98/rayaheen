import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../../../controller/productdetails_controller.dart';
import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if there's only one image
    final bool hasSingleImage =
        (controller.itemsModel.itemsImages?.length ?? 0) <= 1;

    // Get the image URL
    final String imageUrl = controller.itemsModel.itemsImage != null
        ? "${AppLink.imagesItems}/${controller.itemsModel.itemsImage}"
        : "https://via.placeholder.com/250";

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            color: AppColor.secondColor,
          ),
        ),
        Positioned(
          top: 30.0,
          right: Get.width / 20,
          left: Get.width / 20,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: SizedBox(
              height: 250,
              child: Row(
                children: [
                  // Left Arrow
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: AppColor.primaryColor),
                    onPressed: hasSingleImage
                        ? null // Disable arrow if there's only one image
                        : () {
                      // Implement navigation logic
                      controller.scrollController.animateTo(
                        controller.scrollController.offset - 300,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),

                  // Main Image
                  Expanded(
                    child: Center(
                      child: hasSingleImage
                          ? // If there's only one image, render it directly
                      GestureDetector(
                        onTap: () {
                          // Show fullscreen image on tap
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.black,
                                insetPadding: const EdgeInsets.all(0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl: imageUrl,
                                    fit: BoxFit.contain,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error, color: Colors.white),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: CachedNetworkImage(
                              imageUrl: imageUrl,
                              height: 300, // Larger size for single image
                              width: Get.width * 0.9, // Larger size for single image
                              fit: BoxFit.contain, // Show full image
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          ),
                        ),
                      )
                          : // If there are multiple images, use ListView.builder
                      ListView.builder(
                        controller: controller.scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: (controller.itemsModel.itemsImages?.length ?? 0) + 1,
                        itemBuilder: (context, index) {
                          final imageUrl = index == 0
                              ? "${AppLink.imagesItems}/${controller.itemsModel.itemsImage}"
                              : "${AppLink.imagesItems}/${controller.itemsModel.itemsImages![index - 1].path}";

                          return GestureDetector(
                            onTap: () {
                              // Show fullscreen image on tap
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    backgroundColor: Colors.black,
                                    insetPadding: const EdgeInsets.all(0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context); // Close dialog on tap
                                      },
                                      child: InteractiveViewer(
                                        panEnabled: true, // Enable panning
                                        minScale: 1.0, // Minimum zoom scale
                                        maxScale: 5.0, // Maximum zoom scale
                                        child: CachedNetworkImage(
                                          imageUrl: imageUrl,
                                          fit: BoxFit.contain,
                                          placeholder: (context, url) => const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                          const Icon(Icons.error, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );

                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: CachedNetworkImage(
                                  imageUrl: imageUrl,
                                  height: 250, // Smaller size for multiple images
                                  width: Get.width * 0.7, // Smaller size for multiple images
                                  fit: BoxFit.contain, // Show full image
                                  placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Right Arrow
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, color: AppColor.primaryColor),
                    onPressed: hasSingleImage
                        ? null // Disable arrow if there's only one image
                        : () {
                      // Implement navigation logic
                      controller.scrollController.animateTo(
                        controller.scrollController.offset + 300,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}