// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rayaheen_bookstore/view/screen/productdetails.dart';
//
// import '../../data/model/itemsmodel.dart';
//
// class CustomProductCardFromLink extends StatelessWidget {
//   final ItemsModel item;
//
//   const CustomProductCardFromLink({Key? key, required this.item}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       margin: const EdgeInsets.symmetric(vertical: 3),
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: ListTile(
//           leading: ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.network(
//               item.itemsImage!,
//               width: 60,
//               height: 60,
//               fit: BoxFit.cover,
//             ),
//           ),
//           title: Text(item.itemsName!, style: const TextStyle(fontWeight: FontWeight.bold)),
//           subtitle: Text("${item.itemsPrice} درهم"),
//           trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//           onTap: () {
//             Get.to(() => ProductDetails(item: item));
//           },
//         ),
//       ),
//     );
//   }
// }
