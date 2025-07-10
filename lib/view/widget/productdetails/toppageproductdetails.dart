import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../../../controller/productdetails_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';

// class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
//   const TopProductPageDetails({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Check if there's only one image
//     final bool hasSingleImage =
//         (controller.itemsModel.itemsImages?.length ?? 0) <= 1;
//
//     // Get the image URL
//     final String imageUrl = controller.itemsModel.itemsImage != null
//         ? "${AppLink.imagesItems}/${controller.itemsModel.itemsImage}"
//         : "https://via.placeholder.com/250";
//
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         Container(
//           height: 180,
//           decoration: const BoxDecoration(
//             color: AppColor.secondColor,
//           ),
//         ),
//         Positioned(
//           top: 30.0,
//           right: Get.width / 20,
//           left: Get.width / 20,
//           child: Hero(
//             tag: "${controller.itemsModel.itemsId}",
//             child: SizedBox(
//               height: 250,
//               child: Row(
//                 children: [
//                   // Left Arrow
//                   IconButton(
//                     icon: const Icon(Icons.arrow_back_ios, color: AppColor.primaryColor),
//                     onPressed: () {
//                       if (controller.pageController.hasClients) {
//                         controller.pageController.previousPage(
//                           duration: Duration(milliseconds: 300),
//                           curve: Curves.easeInOut,
//                         );
//                       }
//                     },
//                   ),
//
//
//                   // Main Image
//                   Expanded(
//                     child: Center(
//                       child: hasSingleImage
//                           ? // If there's only one image, render it directly
//                       GestureDetector(
//                         onTap: () {
//                           // Show fullscreen image on tap
//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return Dialog(
//                                 backgroundColor: Colors.black,
//                                 insetPadding: const EdgeInsets.all(0),
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     Navigator.pop(context);
//                                   },
//                                   child: CachedNetworkImage(
//                                     imageUrl: imageUrl,
//                                     fit: BoxFit.contain,
//                                     placeholder: (context, url) => const Center(
//                                       child: CircularProgressIndicator(),
//                                     ),
//                                     errorWidget: (context, url, error) =>
//                                         const Icon(Icons.error, color: Colors.white),
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(10.0),
//                             child: CachedNetworkImage(
//                               imageUrl: imageUrl,
//                               height: 300, // Larger size for single image
//                               width: Get.width * 0.9, // Larger size for single image
//                               fit: BoxFit.contain, // Show full image
//                               placeholder: (context, url) => CircularProgressIndicator(),
//                               errorWidget: (context, url, error) => Icon(Icons.error),
//                             ),
//                           ),
//                         ),
//                       )
//                           : // If there are multiple images, use ListView.builder
//                       PageView.builder(
//                         controller: controller.pageController, // Use PageController here
//                         itemCount: (controller.itemsModel.itemsImages?.length ?? 0) + 1,
//                         itemBuilder: (context, index) {
//                           final imageUrl = index == 0
//                               ? "${AppLink.imagesItems}/${controller.itemsModel.itemsImage}"
//                               : "${AppLink.imagesItems}/${controller.itemsModel.itemsImages![index - 1].path}";
//
//                           return GestureDetector(
//                             onTap: () {
//                               showDialog(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return Dialog(
//                                     backgroundColor: Colors.black,
//                                     insetPadding: const EdgeInsets.all(0),
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         Navigator.pop(context);
//                                       },
//                                       child: InteractiveViewer(
//                                         panEnabled: true,
//                                         minScale: 1.0,
//                                         maxScale: 5.0,
//                                         child: CachedNetworkImage(
//                                           imageUrl: imageUrl,
//                                           fit: BoxFit.contain,
//                                           placeholder: (context, url) => const Center(
//                                             child: CircularProgressIndicator(),
//                                           ),
//                                           errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               );
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 child: CachedNetworkImage(
//                                   imageUrl: imageUrl,
//                                   height: 250,
//                                   width: Get.width * 0.8,
//                                   fit: BoxFit.contain,
//                                   placeholder: (context, url) => CircularProgressIndicator(),
//                                   errorWidget: (context, url, error) => Icon(Icons.error),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//
//
//                     ),
//                   ),
//
//                   // Right Arrow
//                   IconButton(
//                     icon: const Icon(Icons.arrow_forward_ios, color: AppColor.primaryColor),
//                     onPressed: () {
//                       if (controller.pageController.hasClients) {
//                         controller.pageController.nextPage(
//                           duration: Duration(milliseconds: 300),
//                           curve: Curves.easeInOut,
//                         );
//                       }
//                     },
//                   ),
//
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


class TopProductPageDetails extends StatefulWidget {
  final ItemsModel item;

  const TopProductPageDetails({Key? key, required this.item}) : super(key: key);

  @override
  State<TopProductPageDetails> createState() => _TopProductPageDetailsState();
}

class _TopProductPageDetailsState extends State<TopProductPageDetails> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < (widget.item.itemsImages?.length ?? 0)) {
      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
      setState(() => _currentPage++);
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
      setState(() => _currentPage--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool hasMultipleImages = (widget.item.itemsImages?.length ?? 0) > 0;
    final totalImages = 1 + (widget.item.itemsImages?.length ?? 0); // 1 للصورة الأساسية

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(height: 180, decoration: const BoxDecoration(color: AppColor.secondColor)),
        Positioned(
          top: 30.0,
          right: Get.width / 20,
          left: Get.width / 20,
          child: Hero(
            tag: "${widget.item.itemsId}",
            child: SizedBox(
              height: 250,
              child: Row(
                children: [
                  if (hasMultipleImages)
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: AppColor.primaryColor),
                      onPressed: _previousPage,
                    ),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: totalImages,
                      onPageChanged: (index) => setState(() => _currentPage = index),
                      itemBuilder: (context, index) {
                        final imageUrl = index == 0
                            ? "${AppLink.imagesItems}/${widget.item.itemsImage}"
                            : "${AppLink.imagesItems}/${widget.item.itemsImages![index - 1].path}";

                        return GestureDetector(
                          // onTap: () => showDialog(
                          //   context: context,
                          //   builder: (_) => Dialog(
                          //     backgroundColor: Colors.black,
                          //     child: InteractiveViewer(
                          //       child: CachedNetworkImage(
                          //         imageUrl: imageUrl,
                          //         fit: BoxFit.contain,
                          //         placeholder: (_, __) =>
                          //         const Center(child: CircularProgressIndicator()),
                          //         errorWidget: (_, __, ___) =>
                          //         const Icon(Icons.error, color: Colors.white),
                          //       ),
                          //     ),
                          //   ),

                          onTap: () {
                            final allImages = [
                              "${AppLink.imagesItems}/${widget.item
                                  .itemsImage!}",
                              ...?widget.item.itemsImages?.map((e) => "${AppLink
                                  .imagesItems}/${e.path}")
                            ];

                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (_) {
                                PageController dialogController = PageController(
                                    initialPage: index);

                                return Dialog(
                                  backgroundColor: Colors.black,
                                  insetPadding: EdgeInsets.zero,
                                  child: Stack(
                                    children: [
                                      PageView.builder(
                                        controller: dialogController,
                                        itemCount: allImages.length,
                                        itemBuilder: (context, i) {
                                          return InteractiveViewer(
                                            child: Center(
                                              child: CachedNetworkImage(
                                                imageUrl: allImages[i],
                                                fit: BoxFit.contain,
                                                placeholder: (_,
                                                    __) => const CircularProgressIndicator(),
                                                errorWidget: (_, __,
                                                    ___) => const Icon(
                                                    Icons.error,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      Positioned(
                                        top: 40,
                                        right: 20,
                                        child: IconButton(
                                          icon: const Icon(
                                              Icons.close, size: 30,
                                              color: Colors.white),
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: CachedNetworkImage(
                                imageUrl: imageUrl,
                                height: 250,
                                width: Get.width * 0.8,
                                fit: BoxFit.contain,
                                placeholder: (_, __) => CircularProgressIndicator(),
                                errorWidget: (_, __, ___) => Icon(Icons.error),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (hasMultipleImages)
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, color: AppColor.primaryColor),
                      onPressed: _nextPage,
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

