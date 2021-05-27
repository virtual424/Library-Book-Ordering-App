import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:mimi_project/Screens/SignInPage.dart';
import 'package:mimi_project/Widgets/Custom_Text_Field.dart';
import 'package:mimi_project/Widgets/custom_LoginSignup_button.dart';
import 'package:mimi_project/Widgets/custom_password_field.dart';
import 'package:mimi_project/models/userModel.dart';
import 'package:mimi_project/resources/SizeConfig.dart';
import 'package:mimi_project/resources/constants.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

final _userName = TextEditingController();
final _userEmail = TextEditingController();
final _userPassWord = TextEditingController();
final _userPhoneNo = TextEditingController();
final List<UserModel> registeredUsers = [];

class _RegisterPageState extends State<RegisterPage> {
  String userType;
  bool passwordVisibility = true;

  void register(BuildContext context) {
    var newUser = UserModel(
      userId: "1",
      userName: _userName.text,
      userPassword: _userPassWord.text,
      email: _userEmail.text,
      phoneNo: _userPhoneNo.text,
      userType: userType == "student" ? UserType.Student : UserType.Admin,
    );
    print(newUser.userType);
    registeredUsers.add(newUser);

    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => SignInPage(registeredUsers,newUser.userType.toString()),
      ),
    );
  }

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
            width: SizeConfig.widthMultiplier * 6,
            color: Colors.white,
            image: Svg(
              'lib/assets/images/back_arrow.svg',
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 4.8,
                ),
                child: Column(
                  children: [
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Register",
                              style: kHeadline,
                            ),
                            Text(
                              "Create new account to get started.",
                              style: kBodyText2,
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 6,
                            ),
                            MyTextField(
                              controller: _userName,
                              hintText: 'Name',
                              inputType: TextInputType.name,
                            ),
                            MyTextField(
                              controller: _userEmail,
                              hintText: 'Email',
                              inputType: TextInputType.emailAddress,
                            ),
                            MyTextField(
                              controller: _userPhoneNo,
                              hintText: 'Phone',
                              inputType: TextInputType.phone,
                            ),
                            SizedBox(height: SizeConfig.heightMultiplier),
                            Container(
                              margin: EdgeInsets.only(
                                  left: SizeConfig.widthMultiplier * 1.3),
                              child: Text(
                                "Choose User Type:",
                                style: TextStyle(
                                  color: Colors.grey,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.heightMultiplier * 0.3),
                            Container(
                              margin: EdgeInsets.only(
                                left: SizeConfig.widthMultiplier,
                                right: SizeConfig.widthMultiplier,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  buildRadio("student", "I am a Student"),
                                  SizedBox(width: 0.5),
                                  buildRadio("Admin", "I am a Admin"),
                                ],
                              ),
                            ),
                            MyPasswordField(
                              controller: _userPassWord,
                              isPasswordVisible: passwordVisibility,
                              onTap: () {
                                setState(() {
                                  passwordVisibility = !passwordVisibility;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: kBodyText,
                        ),
                        Text(
                          "Sign In",
                          style: kBodyText.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3,
                    ),
                    MyTextButton(
                      buttonName: 'Register',
                      onTap: () {
                        register(context);
                      },
                      bgColor: Colors.white,
                      textColor: Colors.black87,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRadio(String value, String user) {
    return Row(
      children: [
        Text(
          user,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        SizedBox(width: 0.5),
        Radio(
            fillColor: MaterialStateProperty.all(Colors.white),
            value: value,
            groupValue: userType,
            onChanged: (val) {
              userType = val;
              setState(() {});
            }),
      ],
    );
  }
}
