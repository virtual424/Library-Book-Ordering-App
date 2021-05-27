import 'package:flutter/material.dart';
import 'package:mimi_project/resources/SizeConfig.dart';
import 'package:mimi_project/resources/constants.dart';

class MyPasswordField extends StatelessWidget {
  const MyPasswordField({
    Key key,
    @required this.isPasswordVisible,
    @required this.onTap,
    @required this.controller,
  }) : super(key: key);

  final bool isPasswordVisible;
  final Function onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 1.3),
      child: TextField(
        controller: controller,
        style: kBodyText.copyWith(
          color: Colors.white,
        ),
        obscureText: isPasswordVisible,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 1.5,
            ),
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: onTap,
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
            ),
          ),
          contentPadding: EdgeInsets.all(SizeConfig.textMultiplier * 2.4),
          hintText: 'Password',
          hintStyle: kBodyText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: SizeConfig.textMultiplier*0.1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: SizeConfig.textMultiplier*0.1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
