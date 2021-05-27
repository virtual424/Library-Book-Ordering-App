import 'package:flutter/material.dart';
import 'package:mimi_project/Screens/SignInPage.dart';
import 'package:mimi_project/Widgets/newBook.dart';
import 'package:mimi_project/models/userModel.dart';

import 'package:mimi_project/resources/constants.dart';

import 'package:mimi_project/DummyData/FourthYearData.dart';
import 'package:mimi_project/DummyData/SecondYearData.dart';
import 'package:mimi_project/DummyData/ThirdYearData.dart';
import 'package:mimi_project/Widgets/search_bar.dart';
import 'package:mimi_project/Widgets/popularSection.dart';
import 'package:mimi_project/DummyData/FirstYearData.dart';
import 'package:mimi_project/models/book.dart';

import '../resources/SizeConfig.dart';
import '../Widgets/navigationTab.dart';

class HomeScreen extends StatelessWidget {
  List<UserModel> registeredUsers;
  final String currentUserName;
  final String currentUserType;
  HomeScreen(this.registeredUsers, this.currentUserName, this.currentUserType);

  final List<String> tabsSectionNames = [
    "First Year",
    "Second Year",
    "Third Year",
    "Fourth Year",
  ];

  static const branchNames = [
    {
      "Branch": "Computer Science",
      "icon": Icons.code,
    },
    {
      "Branch": "EXTC",
      "icon": Icons.bubble_chart,
    },
    {
      "Branch": "IT",
      "icon": Icons.computer_rounded,
    }
  ];

  void choiceAction(String choice) {
    print(choice);
  }

  void startAddingNewBook(BuildContext context) {
    showModalBottomSheet(
    
      
      backgroundColor: Colors.transparent,
      
      context: context,
      builder: (buildercontext) {
        return NewBook();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              SizeConfig.heightMultiplier * 24,
            ),
            child: Container(
              color: kBackgroundColor,
              width: SizeConfig.widthMultiplier,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: SizeConfig.heightMultiplier * 2,
                      right: SizeConfig.heightMultiplier * 2,
                      top: SizeConfig.heightMultiplier,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, $currentUserName",
                              style: kHeadline.copyWith(
                                  fontSize: SizeConfig.textMultiplier * 1.5,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            Text(
                              "Discover Latest Books",
                              style: kHeadline.copyWith(
                                  fontSize: SizeConfig.textMultiplier * 2.5,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInPage(
                                    registeredUsers, currentUserType),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.logout,
                            color: Colors.redAccent,
                            size: SizeConfig.textMultiplier * 3.5,
                          ),
                        ),
                        PopupMenuButton<String>(
                          icon: Icon(
                            Icons.sort,
                            color: Colors.white,
                          ),
                          onSelected: choiceAction,
                          itemBuilder: (BuildContext context) {
                            return branchNames.map(
                              (names) {
                                return PopupMenuItem<String>(
                                  value: names["Branch"],
                                  child: buildPopupMenuItem(
                                    names["Branch"],
                                    names["icon"],
                                  ),
                                );
                              },
                            ).toList();
                          },
                        )
                      ],
                    ),
                  ),
                  CustomSearchBar(),
                  Container(
                    height: SizeConfig.heightMultiplier * 4,
                    margin: EdgeInsets.only(
                      top: SizeConfig.heightMultiplier * 3.5,
                      left: SizeConfig.widthMultiplier * 2,
                      right: SizeConfig.widthMultiplier * 2,
                    ),
                    child: CustomNavigationTabs(
                      indicatorColor: Colors.white,
                      indicatorlabelcolor: Colors.white,
                      tabsList: tabsSectionNames,
                      tabMargin: SizeConfig.widthMultiplier * 6,
                      indicatorWidth: SizeConfig.widthMultiplier * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              buildYearSection(First_DUMMY_BOOKS),
              buildYearSection(Second_DUMMY_BOOKS),
              buildYearSection(Third_DUMMY_BOOKS),
              buildYearSection(Fourth_DUMMY_BOOKS),
            ],
          ),
          floatingActionButton: buildFloatingActionButton(context),
        ),
      ),
    );
  }

  Container buildFloatingActionButton(BuildContext context) {
    if (currentUserType == "UserType.Admin") {
      return Container(
        margin: EdgeInsets.only(
          right: SizeConfig.widthMultiplier,
          bottom: SizeConfig.heightMultiplier,
        ),
        child: FloatingActionButton.extended(
          tooltip: "Add a new Book",
          label: Text(
            "Add Book",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: kBackgroundColor,
          onPressed: () {
            startAddingNewBook(context);
          },
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      );
    }
    return null;
  }

  Widget buildPopupMenuItem(String name, IconData icon) {
    return Container(
      child: Row(
        children: [
          Icon(
            icon,
            color: kBackgroundColor,
          ),
          SizedBox(
            width: SizeConfig.widthMultiplier * 5,
          ),
          FittedBox(
            child: SizedBox(
              height: SizeConfig.heightMultiplier * 4,
              width: SizeConfig.widthMultiplier * 40,
              child: Text(name),
            ),
          ),
        ],
      ),
    );
  }

  Container buildYearSection(List<BookModel> booksList) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.widthMultiplier * 7,
          top: SizeConfig.heightMultiplier * 4,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHorizontalListContainer(booksList),
              PopularSectionList(booksList,currentUserType),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHorizontalListContainer(List<BookModel> booksList) {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.heightMultiplier * 2.3,
      ),
      height: SizeConfig.heightMultiplier * 28,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: booksList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: SizeConfig.widthMultiplier * 4.8),
            height: SizeConfig.heightMultiplier * 20,
            width: SizeConfig.widthMultiplier * 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(
                  booksList[index].image,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
