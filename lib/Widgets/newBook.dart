import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mimi_project/Widgets/custom_LoginSignup_button.dart';
import 'package:mimi_project/resources/SizeConfig.dart';
import 'package:mimi_project/resources/constants.dart';

import 'Custom_Text_Field.dart';

class NewBook extends StatefulWidget {
  @override
  _NewBookState createState() => _NewBookState();
}

class _NewBookState extends State<NewBook> {
  final bookName = TextEditingController();

  final authorName = TextEditingController();

  final publisher = TextEditingController();

  final quantity = TextEditingController();

  final description = TextEditingController();

  bool _showSecond = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      child: AnimatedCrossFade(
        firstChild: Container(
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          padding: EdgeInsets.only(
            left: SizeConfig.heightMultiplier * 4,
            right: SizeConfig.heightMultiplier * 4,
            top: SizeConfig.heightMultiplier * 4,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.book,
                      color: Colors.red,
                      size: SizeConfig.textMultiplier * 4,
                    ),
                    Text(
                      "Enter the Book Details.",
                      style: kBodyText2,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                MyTextField(
                  controller: bookName,
                  hintText: 'Book Name',
                  inputType: TextInputType.name,
                ),
                MyTextField(
                  controller: authorName,
                  hintText: 'Author',
                  inputType: TextInputType.name,
                ),
                MyTextField(
                  controller: publisher,
                  hintText: 'Publisher',
                  inputType: TextInputType.name,
                ),
                MyTextField(
                  controller: quantity,
                  hintText: 'Quantity',
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 0.3,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.heightMultiplier * 1.2,
                    ),
                    child: TextField(
                      controller: description,
                      style: kBodyText.copyWith(
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.all(SizeConfig.heightMultiplier * 2.4),
                        hintText: "Enter book Description",
                        hintStyle: kBodyText,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: SizeConfig.textMultiplier * 0.1,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: SizeConfig.textMultiplier * 0.1,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      setState(() {
                        _showSecond = true;
                      });
                    },
                    label: Text(
                      "Add Book",
                      style: kHeadline.copyWith(
                        fontSize: SizeConfig.heightMultiplier * 2,
                        color: kBackgroundColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    foregroundColor: kBackgroundColor,
                    backgroundColor: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        secondChild: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          padding: EdgeInsets.only(
            left: SizeConfig.heightMultiplier * 4,
            right: SizeConfig.heightMultiplier * 4,
            top: SizeConfig.heightMultiplier * 3,
          ),
          height: SizeConfig.heightMultiplier * 47,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.checkCircle,
                size: 150,
                color: Colors.green,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
              ),
              Text(
                "Book Added !",
                style: kBodyText2.copyWith(
                    fontSize: SizeConfig.textMultiplier * 5),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
              ),
              MyTextButton(
                buttonName: "ok",
                onTap: () {
                  Navigator.pop(context);
                },
                bgColor: Colors.white,
                textColor: kBackgroundColor,
              )
            ],
          ),
        ),
        crossFadeState:
            _showSecond ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: Duration(
          milliseconds: 400,
        ),
      ),
      duration: Duration(milliseconds: 400),
    );
  }

  //
}
