import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'SizeConfig.dart';
import 'constants.dart';

class CommunityCard extends StatelessWidget {
  CommunityCard({
    super.key,
    required this.image,
    required this.area,
    required this.title,
    required this.issue,
    required this.colour,
  });
  String image;
  String area;
  String title;
  String issue;
  Color colour;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/forum/community/$area/update');
      },
      child: Container(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical! * 1,
            left: SizeConfig.blockSizeHorizontal! * 2,
            right: SizeConfig.blockSizeHorizontal! * 2),
        height: SizeConfig.blockSizeVertical! * 25,
        width: SizeConfig.blockSizeHorizontal! * 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: colour,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            transform: Matrix4.translationValues(4, 0.0, 0.0),
            height: SizeConfig.blockSizeVertical! * 21,
            width: SizeConfig.blockSizeHorizontal! * 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: pricolor,
                image: DecorationImage(
                  image: AssetImage('$image'),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      '$title',
                      style: GoogleFonts.nunitoSans(
                        fontSize: SizeConfig.blockSizeVertical! * 2.6,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Container(
                      transform: Matrix4.translationValues(0, -5, 0.0),
                      child: Text(
                        '$issue',
                        style: GoogleFonts.openSans(
                          fontSize: SizeConfig.blockSizeVertical! * 1.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    transform: Matrix4.translationValues(-2, 0, 0.0),
                    child: Icon(Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: SizeConfig.blockSizeVertical! * 3.5),
                  ),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
