import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'SizeConfig.dart';
import 'constants.dart';

class OldUpdateCard extends StatelessWidget {
  OldUpdateCard(
      {super.key,
      required this.image,
      required this.title,
      required this.location,
      required this.like,
      required this.comment});
  String image;
  String title;
  String location;
  String like;
  String comment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/forum/community/Hulu Selangor/update/discussion');
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.blockSizeVertical! * 1,
            horizontal: SizeConfig.blockSizeHorizontal! * 3),
        height: SizeConfig.blockSizeVertical! * 12,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white),
        child: Row(
          children: [
            Container(
              height: SizeConfig.blockSizeVertical! * 10,
              width: SizeConfig.blockSizeHorizontal! * 22.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage('$image'),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 3,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 0.5,
                ),
                Text(
                  '$title',
                  style: TextStyle(
                      color: pricolor,
                      fontSize: SizeConfig.blockSizeVertical! * 2.5,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '$location',
                  style: TextStyle(
                      color: Color(0XFFCACACA),
                      fontSize: SizeConfig.blockSizeVertical! * 1.2,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 2,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 1,
                    ),
                    Icon(
                      CupertinoIcons.flame,
                      size: SizeConfig.blockSizeVertical! * 2.2,
                      color: pricolor,
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 1,
                    ),
                    Text(
                      '$like',
                      style: TextStyle(
                          color: Color(0XFF47466D),
                          fontSize: SizeConfig.blockSizeVertical! * 1.2,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 6,
                    ),
                    Icon(
                      Iconsax.messages_2,
                      size: SizeConfig.blockSizeVertical! * 2.2,
                      color: pricolor,
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 1,
                    ),
                    Text(
                      '$comment',
                      style: TextStyle(
                          color: Color(0XFF47466D),
                          fontSize: SizeConfig.blockSizeVertical! * 1.2,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 3,
            ),
            Icon(CupertinoIcons.wrench)
          ],
        ),
      ),
    );
  }
}
