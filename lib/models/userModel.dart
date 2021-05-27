import 'package:flutter/foundation.dart';

enum UserType {
  Admin,
  Student,
}

class UserModel {
  final String userId;
  final String userName;
  final String userPassword;
  final String email;
  final String phoneNo;
  final bool hasRegistered;
  final UserType userType;

  UserModel({
    @required this.userId,
    @required this.userName,
    @required this.userPassword,
    @required this.email,
    @required this.phoneNo,
    this.hasRegistered = false,
    @required this.userType,
  });


}
