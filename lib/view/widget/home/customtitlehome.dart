import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

import '../../../core/constant/color.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;

  const CustomTitleHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Total available width for the row
          double totalWidth = constraints.maxWidth;

          // TextPainter to calculate the exact width of the title
          final TextPainter textPainter = TextPainter(
            text: TextSpan(
              text: title,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: "playfairDisplay",
                color: AppColor.primaryColor2,
              ),
            ),
            textDirection: TextDirection.ltr,
          )..layout();

          double textWidth = textPainter.width;
          double remainingWidth = totalWidth - textWidth - 32; // Account for padding around the text

          // Divide remaining width equally for the left and right Dash
          double dashWidth = remainingWidth > 0 ? remainingWidth / 2 : 0;

          return Row(
            children: [
              // Left Dash
              SizedBox(
                width: dashWidth,
                child: Dash(
                  direction: Axis.horizontal,
                  length: dashWidth,
                  dashLength: 4,
                  dashGap: 2,
                  dashBorderRadius: 2,

                  dashColor: AppColor.extraColor,
                  dashThickness: 4,
                ),
              ),
              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7,vertical:0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "playfairDisplay",
                    color: AppColor.primaryColor2,
                  ),
                ),
              ),
              // Right Dash
              SizedBox(
                width: dashWidth,
                child: Dash(
                  direction: Axis.horizontal,
                  length: dashWidth,
                  dashLength: 4,
                  dashGap: 2,
                  dashBorderRadius: 2,

                  dashColor: AppColor.extraColor,
                  dashThickness: 4,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
