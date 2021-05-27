import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mimi_project/Widgets/custom_tab_indicator.dart';
import 'package:mimi_project/resources/colors.dart';
import 'package:mimi_project/resources/SizeConfig.dart';
import 'package:mimi_project/resources/constants.dart';

class CustomNavigationTabs extends StatelessWidget {
  final List<String> tabsList;
  final double tabMargin;
  final double indicatorWidth;
  final Color indicatorlabelcolor;
  final Color indicatorColor;

  CustomNavigationTabs({
    this.tabsList,
    this.tabMargin,
    this.indicatorWidth,
    this.indicatorlabelcolor,
    this.indicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      physics: BouncingScrollPhysics(),
      labelPadding: EdgeInsets.all(0),
      indicatorPadding: EdgeInsets.all(0),
      isScrollable: true,
      labelColor: colors.primaryTextColor,
      unselectedLabelColor: Colors.grey,
      labelStyle: GoogleFonts.openSans(
        fontSize: SizeConfig.textMultiplier * 1.9,
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelStyle: GoogleFonts.openSans(
        fontSize: SizeConfig.textMultiplier * 1.9,
        fontWeight: FontWeight.w600,
      ),
      indicator: RoundedRectangleTabIndicator(
        color: indicatorColor,
        weight: 2,
        width: indicatorWidth,
      ),
      tabs: tabsList.map(
        (names) {
          return Tab(
            child: Container(
              margin: EdgeInsets.only(
                right: tabMargin,
              ),
              child: Text(
                names,
                style: kHeadline.copyWith(
                  color: indicatorlabelcolor,
                  fontSize: SizeConfig.textMultiplier * 1.6,
                  fontWeight: FontWeight.w100,
                  letterSpacing: 1,
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
