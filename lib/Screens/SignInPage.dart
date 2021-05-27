import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:mimi_project/Screens/BranchScreen.dart';
import 'package:mimi_project/Screens/register_page.dart';
import 'package:mimi_project/Widgets/Custom_Text_Field.dart';
import 'package:mimi_project/Widgets/custom_LoginSignup_button.dart';
import 'package:mimi_project/Widgets/custom_password_field.dart';
import 'package:mimi_project/models/userModel.dart';
import 'package:mimi_project/resources/SizeConfig.dart';
import 'package:mimi_project/resources/constants.dart';

class SignInPage extends StatefulWidget {
  SignInPage(this.registeredUsers,this.userType);

  static const routeName = "Sign-In";

  final List<UserModel> registeredUsers;
  final String userType;

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isPasswordVisible = true;
  final userName = TextEditingController();
  final userPassword = TextEditingController();
  bool valid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image(
            width: SizeConfig.widthMultiplier * 5.5,
            color: Colors.white,
            image: Svg('lib/assets/images/back_arrow.svg'),
          ),
        ),
      ),
      body: SafeArea(
        //to make page scrollable
        child: CustomScrollView(
          reverse: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 4.7,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome back.",
                              style: kHeadline,
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier,
                            ),
                            Text(
                              "Please sign in to proceed.",
                              style: kBodyText2,
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 8,
                            ),
                            MyTextField(
                              controller: userName,
                              hintText: 'Phone, email or username',
                              inputType: TextInputType.text,
                            ),
                            MyPasswordField(
                              controller: userPassword,
                              isPasswordVisible: isPasswordVisible,
                              onTap: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                            if(!valid) Container(
                                margin: EdgeInsets.only(
                                  top: SizeConfig.heightMultiplier * 0.5,
                                  bottom: SizeConfig.heightMultiplier * 0.5,
                                ),
                                child: Text(
                                  "Invalid Credintials. Try Again!",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dont't have an account? ",
                            style: kBodyText,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Register',
                              style: kBodyText.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      ),
                      MyTextButton(
                        buttonName: 'Sign In',
                        onTap: () {
                          var currentValid = false;

                          for (var user in registeredUsers) {
                            if (user.userName == userName.text &&
                                userPassword.text == user.userPassword) {
                              currentValid = true;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HomeScreen(registeredUsers,userName.text,widget.userType.toString()),
                                ),
                              );
                              break;
                            }
                          }

                          if (currentValid == false) {
                            setState(() {
                              valid = currentValid;
                            });
                          }
                        },
                        bgColor: Colors.white,
                        textColor: Colors.black87,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
