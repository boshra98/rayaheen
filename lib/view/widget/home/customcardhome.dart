
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  const CustomCardHome({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),

    margin: const EdgeInsets.symmetric(vertical: 3),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            // Adjust the radius as needed
            child: Container(
              alignment: Alignment.center,
              height: 170,
              width: double.infinity, // Make the container span the full width
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/card.jpg'),
                  fit: BoxFit
                      .cover, // Ensures the image covers the entire container
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
