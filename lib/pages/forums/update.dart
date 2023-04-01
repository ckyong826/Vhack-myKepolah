import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mykepolah/tools/updateCard.dart';
import '../../tools/SizeConfig.dart';
import '../../tools/component.dart';
import '../../tools/constants.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import '../../utils/reports_components.dart';
import '../../utils/dummy_data.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final database = DummyData().database;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(children: [
      Container(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.05),
              Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  IconButton(
                    padding: const EdgeInsets.only(top: 3),
                    onPressed: () {
                      context.pop();
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.arrowLeft,
                      color: pricolor,
                      size: size.height * 0.04,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Pot Hole',
                    style: GoogleFonts.openSans(
                        fontSize: SizeConfig.blockSizeHorizontal! * 8.5,
                        fontWeight: FontWeight.bold,
                        color: pricolor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal! * 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: SizeConfig.blockSizeHorizontal! * 8),
              child: SlideBar(
                  categories: ['Reported', 'Fixed'],
                  onCountChanged: (int num) {
                    print(num);
                    setState(() {
                      selectedIndex = num;
                    });
                  }),
            ),
            ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: database[selectedIndex].length,
              itemBuilder: (context, index) {
                return UpdateCard(
                  image: database[selectedIndex][index]["image"]!,
                  title: database[selectedIndex][index]["title"]!,
                  location: database[selectedIndex][index]["location"]!,
                  like: database[selectedIndex][index]["like"]!,
                  comment: database[selectedIndex][index]["comment"]!,
                  iconType: database[selectedIndex][index]["iconType"]!,
                  onTapPage: database[selectedIndex][index]["onTapPage"]!,
                );
              },
            )
          ],
        ),
      )
    ]));
  }
}
