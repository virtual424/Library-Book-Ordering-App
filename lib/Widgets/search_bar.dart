import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mimi_project/resources/colors.dart';
import 'package:mimi_project/resources/SizeConfig.dart';
import 'package:mimi_project/resources/constants.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left:SizeConfig.widthMultiplier * 2,
        right: SizeConfig.widthMultiplier * 2,
        top: SizeConfig.widthMultiplier * 4,
      ),
      height: SizeConfig.heightMultiplier * 4.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.textMultiplier),
        color: colors.searchBarBackgroundColor,
      ),
      child: Stack(
        children: [
          TextField(
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            style: GoogleFonts.openSans(
              fontSize: SizeConfig.textMultiplier * 1.5,
              fontWeight: FontWeight.w600,
              color: colors.primaryTextColor,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: SizeConfig.widthMultiplier * 4.1,
                right: SizeConfig.widthMultiplier * 7,
                bottom: SizeConfig.heightMultiplier,
              ),
              border: InputBorder.none,
              hintText: "Search Book",
              hintStyle: GoogleFonts.openSans(
                fontSize: SizeConfig.textMultiplier * 1.5,
                fontWeight: FontWeight.w600,
                color: colors.secondaryTextColor,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              height: SizeConfig.heightMultiplier * 4.9,
              padding: EdgeInsets.all(SizeConfig.heightMultiplier * 1.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.textMultiplier),
                color: colors.searchIconColor.withOpacity(0.8),
              ),
              child: Icon(
                
                FontAwesomeIcons.search,
                color:kBackgroundColor,
                size: SizeConfig.heightMultiplier * 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
