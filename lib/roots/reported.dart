import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykepolah/utils/progress_components.dart';
import 'package:mykepolah/utils/reports_components.dart';
import '../utils/size_config.dart';
import 'package:iconsax/iconsax.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  List<List<Map<String, String>>> database = [
    [
      {
        "image":
            "https://d3avoj45mekucs.cloudfront.net/rojakdaily/media/suganya/expedition%20asia/untitled-design-2021-01-05t163203-797.jpg?ext=.jpg",
        "title": "Pothole",
        "location": "Jalan Tun Razak, ",
        "like": "230",
        "comment": "10",
        "iconType": "info",
        "onTapPage": '/reported/progress',
      },
      {
        "image":
            "https://apicms.thestar.com.my/uploads/images/2021/03/03/1064195.jpg",
        "title": "Open Burning",
        "location": "Jalan Tun Razak, Puchong",
        "like": "200",
        "comment": "12",
        "iconType": "info",
        "onTapPage": '/reported/progress',
      }
    ],
    [
      {
        "image":
            "https://live.staticflickr.com/2325/2129108973_650474f5db_b.jpg",
        "title": "Streetlight",
        "location": "Jalan Tun Razak, ",
        "like": "123",
        "comment": "15",
        "iconType": "info",
        "onTapPage": '/reported/progress',
      },
    ],
    [
      {
        "image": "https://i.ytimg.com/vi/ozhp2XT14Nk/maxresdefault.jpg",
        "title": "Wildlife control",
        "location": "Tawau, Sabah",
        "like": "500",
        "comment": "",
        "iconType": "info",
        "onTapPage": '/reported/progress',
      },
      {
        "image":
            "https://thesmartlocal.my/wp-content/uploads/2021/12/pothole-in-Sabah-3.jpg",
        "title": "Pothole",
        "location": "Jalan Tun Razak, Puchong",
        "like": "523",
        "comment": "64",
        "iconType": "fixing",
        "onTapPage": '/reported/progress',
      },
      {
        "image":
            "https://media.freemalaysiatoday.com/wp-content/uploads/2022/09/jalan-berlubang-pothole-fmt-010419-1.jpg",
        "title": "Pothole",
        "location": "Jalan Tun Razak, Puchong",
        "like": "120",
        "comment": "1",
        "iconType": "fixing",
        "onTapPage": '/reported/progress',
      }
    ],
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: ScreenSize.horizontal! * 7,
              vertical: ScreenSize.vertical! * 5),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Reports",
                  style: GoogleFonts.openSans(
                    color: Color(0xff47466D),
                    fontSize: ScreenSize.horizontal! * 9,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -4.0, 0.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Iconsax.filter_search5,
                      size: ScreenSize.horizontal! * 8.5,
                      color: Color(0xff47466D),
                    ),
                    constraints: BoxConstraints(),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ScreenSize.vertical! * 1,
            ),
            Text(
              "2023",
              style: GoogleFonts.nunitoSans(
                color: Color(0xff47466D),
                fontSize: ScreenSize.horizontal! * 10,
                fontWeight: FontWeight.w900,
                letterSpacing: ScreenSize.horizontal! * 0.3,
              ),
            ),
            SlideBar(
              categories: ["JAN", "FEB", "MARCH", "APRIL", "MAY"],
              onTapIndex: (int index) {
                setState(() {
                  selectedIndex = index;
                  print(selectedIndex);
                  print(database[selectedIndex].length);
                });
              },
            ),
            SizedBox(
              height: ScreenSize.vertical! * 2,
            ),
            ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: (database[selectedIndex].isNotEmpty)
                  ? database[selectedIndex].length
                  : 1,
              itemBuilder: (context, index) {
                return (database[selectedIndex].isNotEmpty)
                    ? Padding(
                        padding:
                            EdgeInsets.only(bottom: ScreenSize.vertical! * 1.5),
                        child: UpdateCard(
                          image: database[selectedIndex][index]["image"]!,
                          title: database[selectedIndex][index]["title"]!,
                          location: database[selectedIndex][index]["location"]!,
                          like: database[selectedIndex][index]["like"]!,
                          comment: database[selectedIndex][index]["comment"]!,
                          iconType: database[selectedIndex][index]["iconType"]!,
                          onTapPage: database[selectedIndex][index]
                              ["onTapPage"]!,
                        ),
                      )
                    : Text("No reports yet..");
              },
            )
          ]),
        ),
      ),
    );
  }
}
