// class User {
//   final String imagePath;
//   final String name;
//   final String email;
//  // final String about;
//   //final bool isDarkMode;
//
//   const User({
//     required this.imagePath,
//     required this.name,
//     required this.email,
//     //required this.about,
//    // required this.isDarkMode,
//   });
// }

// class UserModel {
//   final String id;
//   String name;
//   String phone;
//   String address;
//
//   UserModel({
//     required this.id,
//     required this.name,
//     required this.phone,
//     required this.address,
//   });
//
//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//     id: json['id'].toString(),
//     name: json['name'],
//     phone: json['phone'],
//     address: json['address'] ?? '',
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "phone": phone,
//     "address": address,
//   };
// }


class UserModel {
  final String? id; // يمكن أن يكون null إذا لم يُرسل
  String name;
  String phone;
  String? email;

  UserModel({
    this.id,
    required this.name,
    required this.phone,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString(), // قد لا يكون موجود
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email']?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) "id": id,
      "name": name,
      "phone": phone,
      "email": email,
    };
  }
}
