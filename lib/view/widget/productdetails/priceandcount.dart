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
    var c=0;
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed:

            onAdd, icon: const Icon(Icons.add)),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 2),
                width: 50,
                // height: 30,
                decoration:
                BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(
                  c.toString(),
                  style: const TextStyle(fontSize: 20, height: 1.1),
                )),
            IconButton(onPressed: (){
            c++;
            }

            , icon: const Icon(Icons.remove)),
          ],
        ),
        const Spacer(),
        Text(
          "$price \$",
          style: const TextStyle(
              color: AppColor.primaryColor, fontSize: 30, height: 1.1),
        )
      ],
    );
  }
}