//import 'package:flutter/material.dart';

// class CustomAppBar extends StatelessWidget {
//   final String titleappbar;
//   final void Function()? onPressedIconFavorite;
//   final void Function(String)? onPressedSearch;
//   final void Function(String)? onChanged;
//   final TextEditingController mycontroller;
//   final IconData iconData ;
//   const CustomAppBar(
//       {Key? key,
//       required this.titleappbar,
//         required this.onPressedSearch,
//       required this.onPressedIconFavorite,
//       this.onChanged,
//       required this.mycontroller,
//         this.iconData =   Icons.favorite_border_outlined,
//       //  required AppBar appBar
//       })
//       : super(key: key);
//
//   @override
//
//   Widget build(BuildContext context) {
//     return Container(
//
//     margin: EdgeInsets.only(top: 10),
//       child: Row(children: [
//         Expanded(
//             child: TextFormField(
//           controller: mycontroller,
//           onChanged: onChanged,
//           decoration: InputDecoration(
//               prefixIcon: IconButton(
//                   icon: Icon(Icons.search),
//                 onPressed: () {
//                 onPressedSearch!(mycontroller.text); // Pass search text here
//               },),
//               hintText: titleappbar,
//               hintStyle: TextStyle(fontSize: 18),
//               border: OutlineInputBorder(
//                   borderSide: BorderSide.none,
//                   borderRadius: BorderRadius.circular(10)),
//               filled: true,
//              // fillColor: Colors.grey[200],
//
//               fillColor: Theme.of(context).searchBarTheme.backgroundColor?.resolve({}),
//
//       ),
//         )),
//         SizedBox(width: 10),
//         Container(
//
//           decoration: BoxDecoration(
//               color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
//           width: 60,
//
//           padding: EdgeInsets.symmetric(vertical: 8),
//           child: IconButton(
//               onPressed: onPressedIconFavorite,
//               icon: Icon(
//               iconData,
//                 size: 30,
//                 color: Colors.grey[600],
//               )),
//         )
//       ]),
//     );
//   }
// }




import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function(String)? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;

  const CustomAppBar({
    Key? key,
    required this.titleappbar,
    required this.onPressedSearch,
    this.onChanged,
    required this.mycontroller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 44,
              child: TextFormField(
                controller: mycontroller,
                onChanged: onChanged, // Handles real-time changes if needed
                onFieldSubmitted: (value) {
                  onPressedSearch?.call(value); // Trigger search on "Enter"
                },
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      onPressedSearch?.call(mycontroller.text); // Trigger search on button press
                    },
                  ),
                  hintText: titleappbar,
                  hintStyle: const TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: AppColor.secondColor,
                ),
              ),
            ),
          ),
         // const SizedBox(width: 8),
          // SizedBox(
          //   height: 44,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: AppColor.secondColor,
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     width: 50,
          //     child: IconButton(
          //       onPressed: () {
          //         Navigator.pop(context); // Navigate back to the previous page
          //         // Alternatively, to navigate to a specific route:
          //         // Navigator.pushNamed(context, '/homepage');
          //       },
          //       icon: const Icon(
          //         Icons.home, // Change icon to 'home' for clarity
          //         size: 30,
          //         color: AppColor.primaryColor2,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

