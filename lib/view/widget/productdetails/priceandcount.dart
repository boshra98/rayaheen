import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
   final String count;



  const PriceAndCountItems(
      {Key? key,
        required this.onAdd,
        required this.onRemove,
        required this.price,
        required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,

        // Price and Count in a Column
        Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //const SizedBox(height: 8,),
            //padding: const EdgeInsets.only(top: 4),

            Text(
              "$price درهم\ ",
              style: const TextStyle(
                  color: AppColor.primaryColor2, fontSize: 16, fontWeight: FontWeight.w300,                      // fontWeight: FontWeight.w300,

                 ),
            ),
            const SizedBox(height: 15),

            Row(
              children: [
                IconButton(
                  onPressed: onAdd,
                  icon: const Icon(Icons.add_circle, color: AppColor.primaryColor2),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                 //padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    count,

                    style: const TextStyle(
                        fontSize: 20, height: 1.1, color: AppColor.primaryColor),
                  ),
                ),
                IconButton(
                  onPressed: onRemove,
                  icon: const Icon(Icons.remove_circle, color: AppColor.primaryColor2),
                ),
              ],
            ),

          ],

    );



  }
}