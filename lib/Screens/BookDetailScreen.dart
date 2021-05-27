import 'package:flutter/material.dart';
import 'package:mimi_project/Widgets/issueBook.dart';

import 'package:mimi_project/Widgets/navigationTab.dart';
import 'package:mimi_project/models/book.dart';
import 'package:mimi_project/resources/SizeConfig.dart';
import 'package:mimi_project/resources/constants.dart';
import '../resources/colors.dart';

class BookDetailScreen extends StatelessWidget {
  static const routeName = "Book-Detail_screen";

  String currentUser;
  String name;
  String author;
  String publisherName;
  bool showSecond = false;

  final List<String> tabsSectionNames = [
    "Description",
    "Details",
  ];

  void startAddingNewBook(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: kBackgroundColor,
      context: context,
      builder: (buildercontext) {
        return IssueBook(
          name,
          author,
          publisherName,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final int index = routeArguments["index"];
    final List<BookModel> booksList = routeArguments["booksList"];
    final bookName = booksList[index].title;
    name = bookName;
    final authorName = booksList[index].authorName;
    author = authorName;
    final publisher = booksList[index].publisher;
    publisherName = publisher;
    final currentUserType = routeArguments["userType"];
    currentUser = currentUserType;

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: buildBottomNavigationBar(context),
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(SizeConfig.heightMultiplier * 70),
            child: Container(
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(top: SizeConfig.heightMultiplier * 4),
                    color: kBackgroundColor.withOpacity(0.8),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(
                              bottom: SizeConfig.heightMultiplier * 4,
                            ),
                            height: SizeConfig.heightMultiplier * 40,
                            width: SizeConfig.heightMultiplier * 23,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  booksList[index].image,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  buildTitles(
                    booksList[index].title,
                    kBackgroundColor,
                    SizeConfig.textMultiplier * 4,
                    FontWeight.w600,
                    SizeConfig.heightMultiplier * 1,
                  ),
                  buildTitles(
                    booksList[index].authorName,
                    colors.secondaryTextColor,
                    SizeConfig.textMultiplier * 1.8,
                    FontWeight.w600,
                    SizeConfig.heightMultiplier,
                  ),
                  buildTitles(
                    booksList[index].publisher,
                    colors.secondaryTextColor,
                    SizeConfig.textMultiplier * 1.8,
                    FontWeight.w600,
                    SizeConfig.heightMultiplier * 0.5,
                  ),
                  Container(
                    height: SizeConfig.heightMultiplier * 3,
                    margin: EdgeInsets.only(
                      top: SizeConfig.heightMultiplier * 2,
                      bottom: SizeConfig.heightMultiplier * 3,
                    ),
                    padding: EdgeInsets.only(
                      left: SizeConfig.widthMultiplier * 5.7,
                    ),
                    child: CustomNavigationTabs(
                      indicatorlabelcolor: kBackgroundColor,
                      indicatorColor: kBackgroundColor,
                      tabsList: tabsSectionNames,
                      tabMargin: SizeConfig.widthMultiplier * 11,
                      indicatorWidth: SizeConfig.widthMultiplier * 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(children: [
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.widthMultiplier * 4,
                right: SizeConfig.widthMultiplier * 4,
              ),
              child: FittedBox(
                child: Container(
                  width: SizeConfig.widthMultiplier * 105,
                  height: SizeConfig.heightMultiplier * 23,
                  child: Text(
                    booksList[index].bookDescription,
                    style: kBodyText,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.widthMultiplier * 4,
                right: SizeConfig.widthMultiplier * 4,
              ),
              child: Text(
                "Book Name: ${booksList[index].title}\nAuthor: ${booksList[index].authorName}\nPublisher: ${booksList[index].publisher}\nQuantity: ${booksList[index].qunatity}\nAvailability Date: -",
                style: kBodyText.copyWith(
                  fontSize: SizeConfig.textMultiplier * 1.5,
                  height: 2,
                  letterSpacing: 1,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Container buildBottomNavigationBar(BuildContext context) {
    if (!(currentUser == "UserType.Admin")) {
      return Container(
        margin: EdgeInsets.only(
          left: SizeConfig.heightMultiplier * 2.5,
          right: SizeConfig.heightMultiplier * 2.5,
          bottom: SizeConfig.heightMultiplier,
        ),
        height: SizeConfig.heightMultiplier * 7,
        color: Colors.transparent,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kBackgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          onPressed: () {
            startAddingNewBook(context);
          },
          child: Text(
            "Issue Book",
            style: kHeadline.copyWith(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return null;
  }

  Padding buildTitles(String title, Color color, double size, FontWeight weight,
      double padding) {
    return Padding(
      padding: EdgeInsets.only(
        top: padding,
        left: SizeConfig.widthMultiplier * 5.7,
      ),
      child: FittedBox(
        child: Container(
          width: SizeConfig.widthMultiplier * 110,
          child: Text(
            title,
            style: kHeadline.copyWith(
              fontSize: size,
              fontWeight: weight,
              color: color,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}
