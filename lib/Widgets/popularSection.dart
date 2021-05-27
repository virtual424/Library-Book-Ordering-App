import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mimi_project/Screens/BookDetailScreen.dart';
import 'package:mimi_project/models/book.dart';
import 'package:mimi_project/resources/SizeConfig.dart';
import 'package:mimi_project/resources/constants.dart';


class PopularSectionList extends StatelessWidget {
  final List<BookModel> dummyBooks;
  final String userType;
  void onBookSelect(BuildContext ctx, String id, int index) {
    Navigator.of(ctx).pushNamed(
      BookDetailScreen.routeName,
      arguments: {
        "index": index,
        "booksList": dummyBooks,
        "userType" : userType,
      },
    );
  }

  PopularSectionList(this.dummyBooks,this.userType);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.heightMultiplier * 4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Books",
            style: kHeadline.copyWith(
              fontSize: SizeConfig.textMultiplier * 3,
              fontWeight: FontWeight.w500,
              color: kBackgroundColor,
            ),
          ),
          Container(
            child: ListView.builder(
              padding: EdgeInsets.only(
                top: SizeConfig.heightMultiplier * 2,
                right: SizeConfig.widthMultiplier * 4,
              ),
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: dummyBooks.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => onBookSelect(
                    context,
                    dummyBooks[index].id,
                    index,
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: SizeConfig.heightMultiplier * 2,
                    ),
                    height: SizeConfig.heightMultiplier * 15,
                    width: MediaQuery.of(context).size.width - 50,
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.heightMultiplier * 16,
                          width: SizeConfig.widthMultiplier * 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                dummyBooks[index].image,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Container(
                                width: SizeConfig.widthMultiplier * 60,
                                child: Text(
                                  dummyBooks[index].title,
                                  style: GoogleFonts.openSans(
                                    fontSize: SizeConfig.textMultiplier * 2.5,
                                    fontWeight: FontWeight.w600,
                                    color: kBackgroundColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.heightMultiplier * 0.5),
                            Text(
                              dummyBooks[index].authorName,
                              style: GoogleFonts.openSans(
                                fontSize: SizeConfig.textMultiplier * 1.8,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * 0.5,
                            ),
                            Text(
                              dummyBooks[index].publisher,
                              style: GoogleFonts.openSans(
                                fontSize: SizeConfig.textMultiplier * 1.8,
                                fontWeight: FontWeight.w600,
                                color: kBackgroundColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
