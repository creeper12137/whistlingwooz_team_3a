import 'package:flutter/foundation.dart';

class UserModel {
  final String uid;
  final String fullName;
  // String password;
  final String email;
  // String phoneNo;
  // String gender;
  // DateTime birth;

 const UserModel(    
    {
    required this.uid,
    required this.fullName,
    // required this.password,
    required this.email,
    // required this.phoneNo,
    // required this.gender,
    // required this.birth,
    }
  );

  toJson() {
    return {
      "uid": uid,
      "fullName": fullName,
      // "password": password,
      "email": email,
      // "phoneNo": phoneNo,
      // "gender": gender,
      // "birth": birth,
    };
  }

  // int get id {
  //   return uid;
  // }

  String get name {
    return fullName;
  }

  // void setName(String newName) {
  //   if (newName.length < 3 || newName.length > 50) {
  //     //throw error
  //     debugPrint('Name must be between 3 and 50 characters long.');
  //     return;
  //   }
  //   fullName = newName;
  // }

  // String get userPassword {
  //   return password;
  // }

  // void setPassword(String newPassword) {
  //   if (newPassword.length < 8 || newPassword.length > 16) {
  //     debugPrint('Password must be between 8 and 16 characters long.');
  //     return;
  //   }
  //   password = newPassword;
  // }

  // String get userEmail {
  //   return email;
  // }

  // void setEmail(String newEmail) {
  //   if (!newEmail.contains('@')) {
  //     debugPrint('Invalid email address.');
  //     return;
  //   }
  //   email = newEmail;
  // }

  // String get userPhoneNo {
  //   return phoneNo;
  // }

  // void setPhoneNo(String newPhoneNo) {
  //   if (newPhoneNo.length != 10) {
  //     debugPrint('Phone number must be 10 digits long.');
  //     return;
  //   }
  //   phoneNo = newPhoneNo;
  // }

  // String get userGender {
  //   return gender;
  // }

  // void setGender(String newGender) {}

  // String get userBirth {
  //   return birth.toString();
  // }

  // void setBirth(DateTime newBirth) {}

  // void login() {}
  // void logout() {
  //   debugPrint('Successfully logged out.');
  // }
}
