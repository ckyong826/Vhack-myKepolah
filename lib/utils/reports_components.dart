import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

class UpdateCard extends StatelessWidget {
  UpdateCard(
      {super.key,
      required this.image,
      required this.title,
      required this.location,
      required this.like,
      required this.comment,
      required this.iconType,
      required this.onTapPage});
  String image;
  String title;
  String location;
  String like;
  String comment;
  String iconType;
  String onTapPage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSize().init(context);
    return GestureDetector(
      onTap: () {
        context.go(onTapPage);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: ScreenSize.vertical! * 1,
            horizontal: ScreenSize.horizontal! * 3),
        height: ScreenSize.vertical! * 12,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: ScreenSize.vertical! * 10,
                  width: ScreenSize.horizontal! * 22.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: NetworkImage('$image'),
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  width: ScreenSize.horizontal! * 3,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenSize.vertical! * 0.5,
                    ),
                    Text(
                      '$title',
                      style: GoogleFonts.openSans(
                          color: Color(0xff47466D),
                          fontSize: ScreenSize.vertical! * 2.8,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      transform: Matrix4.translationValues(0.0, -5.0, 0.0),
                      child: Text(
                        '$location',
                        style: GoogleFonts.nunitoSans(
                            color: Color(0XFFCACACA),
                            fontSize: ScreenSize.vertical! * 1.5,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      height: ScreenSize.vertical! * 0.8,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenSize.horizontal! * 1,
                        ),
                        Image(
                          image: const AssetImage('assets/images/fire.png'),
                          width: size.height * 0.023,
                        ),
                        SizedBox(
                          width: ScreenSize.horizontal! * 1,
                        ),
                        Text(
                          '$like',
                          style: TextStyle(
                              color: Color(0XFF47466D),
                              fontSize: ScreenSize.vertical! * 1.5,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: ScreenSize.horizontal! * 6,
                        ),
                        Icon(
                          Iconsax.messages_2,
                          size: ScreenSize.vertical! * 2.5,
                          color: Color(0xff47466D),
                        ),
                        SizedBox(
                          width: ScreenSize.horizontal! * 1,
                        ),
                        Text(
                          '$comment',
                          style: TextStyle(
                              color: Color(0XFF47466D),
                              fontSize: ScreenSize.vertical! * 1.5,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Image(
              image: AssetImage("assets/$iconType.png"),
              width: ScreenSize.horizontal! * 8,
            ),
          ],
        ),
      ),
    );
  }
}
