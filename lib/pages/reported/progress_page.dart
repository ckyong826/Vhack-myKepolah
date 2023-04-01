import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mykepolah/utils/progress_components.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/size_config.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  List<String> dateOfReport = ["25 JAN", "13 FEB", "21 FEB", "1 MARCH"];
  List<Map<String, String>> database = [
    {
      "dateDay": "25",
      "month": "JAN",
      "reportCategory": "Pothole",
      "imageNetwork":
          "https://cdn.weirdkaya.com/wp-content/uploads/Sim-Choon-Siang-state-assemblyman-fix-potholes-by-himself-4.jpg",
      "address": "Jalan Tun Razak Puchong",
    },
    {
      "dateDay": "25",
      "month": "FEB",
      "reportCategory": "Pollution",
      "imageNetwork":
          "https://apicms.thestar.com.my/uploads/images/2021/03/03/1064195.jpg",
      "address": "Pahang",
    },
    {
      "dateDay": "25",
      "month": "FEB",
      "reportCategory": "Water Pipe",
      "imageNetwork":
          "https://images.says.com/uploads/story_source/source_image/755671/289b.jpg",
      "address": "Jalan Tun Razak Puchong",
    },
    {
      "dateDay": "25",
      "month": "MARCH",
      "reportCategory": "Streetlight",
      "imageNetwork":
          "https://live.staticflickr.com/2325/2129108973_650474f5db_b.jpg",
      "address": "Jalan Tun Razak Puchong",
    },
  ];
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: ScreenSize.vertical! * 15,
        backgroundColor: Color(0xffF6F6F6),
        elevation: 0,
        title: ProgressPageAppBar(),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: ScreenSize.horizontal! * 7),
            child: Icon(
              Iconsax.filter_search5,
              color: Color(0xff47466D),
              size: ScreenSize.horizontal! * 7,
            ),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: const Color(0xffF6F6F6),
        height: double.infinity,
        child: Column(children: [
          Expanded(
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                LocationDetailsCard(
                  address: database[selectedIndex]["address"]!,
                  imageNetwork: database[selectedIndex]["imageNetwork"]!,
                  reportCategory: database[selectedIndex]["reportCategory"]!,
                ),
                Container(
                    margin: EdgeInsets.only(
                      left: ScreenSize.horizontal! * 7,
                      top: ScreenSize.vertical! * 3,
                    ),
                    height: ScreenSize.vertical! * 70,
                    child: ProgressPageIndicator(
                      dateDay: database[selectedIndex]["dateDay"]!,
                      month: database[selectedIndex]["month"]!,
                      reportCategory: database[selectedIndex]
                          ["reportCategory"]!,
                    )),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
