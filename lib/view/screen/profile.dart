import 'package:flutter/material.dart';
import '../../data/model/user.dart';
import '../../utils/user_preference.dart';
import '../widget/customappbar.dart';
import '../widget/profile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
     //customAppbar(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          //EdgeInsets.symmetric(horizontal: 15),
          const SizedBox(height: 80),

          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 50),
          buildName(user),
          const SizedBox(height: 50),

        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  // Widget buildUpgradeButton() => ButtonWidget(
  //   text: 'Upgrade To PRO',
  //   onClicked: () {},
  // );

//   Widget buildAbout(User user) => Container(
//     padding: EdgeInsets.symmetric(horizontal: 48),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'About',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 16),
//         Text(
//           user.about,
//           style: TextStyle(fontSize: 16, height: 1.4),
//         ),
//       ],
//     ),
//   );
 }