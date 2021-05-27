import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mimi_project/Widgets/custom_LoginSignup_button.dart';
import 'package:mimi_project/resources/SizeConfig.dart';
import 'package:mimi_project/resources/constants.dart';
import 'package:intl/intl.dart';

import 'Custom_Text_Field.dart';

class IssueBook extends StatefulWidget {
  @override
  _IssueBookState createState() => _IssueBookState();
  final String bookName;
  final String authorName;
  final String publisherName;

  IssueBook(this.bookName, this.authorName, this.publisherName);
}

class _IssueBookState extends State<IssueBook> {
  final userName = TextEditingController();

  final rollNo = TextEditingController();

  final div = TextEditingController();

  final branch = TextEditingController();

  final year = TextEditingController();

  final address = TextEditingController();

  bool _showSecond = false;

  DateTime submissionDate() {
    var currentDate = DateTime.now();
    var submissionDate = currentDate.add(Duration(days: 7));
    
    return submissionDate;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: double.infinity,
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
                      "Enter the Details.",
                      style: kBodyText2,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                MyTextField(
                  controller: userName,
                  hintText: 'Name',
                  inputType: TextInputType.name,
                ),
                MyTextField(
                  controller: rollNo,
                  hintText: 'Roll No',
                  inputType: TextInputType.name,
                ),
                MyTextField(
                  controller: div,
                  hintText: 'Div:',
                  inputType: TextInputType.name,
                ),
                MyTextField(
                  controller: branch,
                  hintText: 'Branch',
                  inputType: TextInputType.text,
                ),
                MyTextField(
                  controller: address,
                  hintText: 'Address',
                  inputType: TextInputType.text,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width:double.infinity,
                  child: Icon(
                    FontAwesomeIcons.checkCircle,
                    size: 170,
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 4,
                ),
                SizedBox(
                  width: double.infinity,
                  child: FittedBox(
                    child: Text(
                      "Order Successful !",
                      style: kBodyText2.copyWith(
                          fontSize: SizeConfig.textMultiplier * 5),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 4,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Details:",
                      style: kBodyText2.copyWith(
                        fontSize: SizeConfig.textMultiplier * 2,
                      ),
                    ),
                    SizedBox(height:5),
                    Text(
                      "Name : ${userName.text}",
                      style: kBodyText2.copyWith(
                        color: Colors.grey,
                        fontSize: SizeConfig.textMultiplier * 2,
                      ),
                    ),
                    Text(
                      "Roll No. : ${rollNo.text}",
                      style: kBodyText2.copyWith(
                        color: Colors.grey,
                        fontSize: SizeConfig.textMultiplier * 2,
                      ),
                    ),
                    Text(
                      "Division : ${div.text}",
                      style: kBodyText2.copyWith(
                          fontSize: SizeConfig.textMultiplier * 2,
                          color: Colors.grey),
                    ),
                    Text(
                      "Branch : ${branch.text}",
                      style: kBodyText2.copyWith(
                          fontSize: SizeConfig.textMultiplier * 2,
                          color: Colors.grey),
                    ),
                    Text(
                      "Book Name : ${widget.bookName}",
                      style: kBodyText2.copyWith(
                          fontSize: SizeConfig.textMultiplier * 2,
                          color: Colors.grey),
                    ),
                    Text(
                      "Author : ${widget.authorName}",
                      style: kBodyText2.copyWith(
                          fontSize: SizeConfig.textMultiplier * 2,
                          color: Colors.grey),
                    ),
                    Text(
                      "Publisher : ${widget.publisherName}",
                      style: kBodyText2.copyWith(
                          fontSize: SizeConfig.textMultiplier * 2,
                          color: Colors.grey),
                    ),
                    Text(
                      "Delivery Address : ${address.text}",
                      style: kBodyText2.copyWith(
                          fontSize: SizeConfig.textMultiplier * 2,
                          color: Colors.grey),
                    ),
                    Text(
                      "Submission Date : ${DateFormat.yMd().format(submissionDate())}",
                      style: kBodyText2.copyWith(
                        fontSize: SizeConfig.textMultiplier * 2,
                        color: Colors.red.withOpacity(0.8),
                      ),
                    ),
                    SizedBox(height:20)
                  ],
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
