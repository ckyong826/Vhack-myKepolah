import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import '../utils/size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/forum_components.dart';
import '../utils/homepage_components.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressPageAppBar extends StatelessWidget {
  const ProgressPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: const Color(0xff47466D),
            size: ScreenSize.horizontal! * 8,
          ),
        ),
        SizedBox(
          width: ScreenSize.horizontal! * 2,
        ),
        Text(
          "Progress",
          style: GoogleFonts.openSans(
            color: const Color(0xff47466D),
            fontSize: ScreenSize.horizontal! * 8,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class LocationDetailsCard extends StatelessWidget {
  final String reportCategory;
  final String imageNetwork;
  final String address;
  const LocationDetailsCard(
      {super.key,
      required this.reportCategory,
      required this.imageNetwork,
      required this.address});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.horizontal! * 7),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              const BoxShadow(
                color: Color.fromARGB(255, 175, 174, 174),
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ]),
        child: Row(
          children: [
            Container(
              width: ScreenSize.horizontal! * 45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image(
                    image: AssetImage("assets/mapProgress.png"),
                    fit: BoxFit.fill, // use this
                  ),
                ),
              ),
            ),
            SizedBox(
              width: ScreenSize.horizontal! * 2,
            ),
            Container(
              height: ScreenSize.vertical! * 20,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: ScreenSize.vertical! * 4,
                    width: ScreenSize.horizontal! * 38,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          reportCategory,
                          style: TextStyle(
                            fontSize: ScreenSize.horizontal! * 6,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff47466D),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert_sharp),
                          padding: const EdgeInsets.all(0),
                          iconSize: ScreenSize.horizontal! * 5,
                          constraints: const BoxConstraints(),
                        )
                      ],
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0.0, -5.0, 0.0),
                    width: ScreenSize.horizontal! * 35,
                    child: Text(
                      "Jalan Tun Razak,Puchong",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenSize.horizontal! * 3.2,
                      ),
                      softWrap: false,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Container(
                    width: ScreenSize.horizontal! * 37,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Image(
                          image: NetworkImage(imageNetwork),
                          fit: BoxFit.fill, // use this
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProgressPageIndicator extends StatelessWidget {
  final String dateDay;
  final String month;
  final String reportCategory;
  const ProgressPageIndicator({
    super.key,
    required this.dateDay,
    required this.month,
    required this.reportCategory,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Positioned(
          left: ScreenSize.horizontal! * 22,
          bottom: 0,
          child: Container(
            width: ScreenSize.horizontal! * 1,
            height: ScreenSize.vertical! * 66,
            decoration: const BoxDecoration(
              color: Color(0xffB6B6B6),
            ),
          ),
        ),
        Column(
          children: [
            const SingleProgressSection(
              active: true,
              date: "25 JAN",
              time: "12:23",
              title: "Issue is fixed!",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const SingleProgressSection(
              active: false,
              date: "24 FEB",
              time: "14:12",
              title: "Local authorities received your report! ",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const SingleProgressSection(
              active: false,
              date: "23 FEB",
              time: "9:43",
              title: "The report is verified",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const SingleProgressSection(
              active: false,
              date: "21 FEB",
              time: "20:55",
              title: "The report is sent successfully",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            ),
          ],
        )
      ],
    );
  }
}

class SingleProgressSection extends StatelessWidget {
  final bool active;
  final String date;
  final String time;
  final String title;
  final String description;
  const SingleProgressSection({
    super.key,
    required this.active,
    required this.date,
    required this.time,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.vertical! * 10,
      child: Column(children: [
        Container(
          child: Row(
            children: [
              active
                  ? Container()
                  : SizedBox(
                      width: ScreenSize.horizontal! * 6.5,
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    date,
                    style: active
                        ? GoogleFonts.nunitoSans(
                            color: const Color(0xff47466D),
                            fontWeight: FontWeight.w800,
                            fontSize: ScreenSize.horizontal! * 5)
                        : GoogleFonts.nunitoSans(
                            color: const Color(0xffB6B6B6),
                            fontWeight: FontWeight.w800,
                            fontSize: ScreenSize.horizontal! * 3),
                  ),
                  Text(
                    time,
                    style: active
                        ? GoogleFonts.nunitoSans(
                            color: const Color(0xff47466D),
                            fontWeight: FontWeight.w800,
                            fontSize: ScreenSize.horizontal! * 3)
                        : GoogleFonts.nunitoSans(
                            color: const Color(0xffB6B6B6),
                            fontWeight: FontWeight.w800,
                            fontSize: ScreenSize.horizontal! * 3),
                  ),
                ],
              ),
              active
                  ? SizedBox(
                      width: ScreenSize.horizontal! * 1,
                    )
                  : SizedBox(
                      width: ScreenSize.horizontal! * 3,
                    ),
              Container(
                height: ScreenSize.horizontal! * 10,
                width: ScreenSize.horizontal! * 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: active
                      ? const Color(0xffF6F6F6)
                      : const Color(0xffB6B6B6),
                ),
                child: active
                    ? Icon(
                        Icons.check_circle,
                        size: ScreenSize.horizontal! * 10,
                        color: const Color(0xffABEDD8),
                      )
                    : Container(),
              ),
              SizedBox(
                width: ScreenSize.horizontal! * 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  active
                      ? GreenUnderlinedText(
                          text: title,
                          top: ScreenSize.vertical! * 2.5,
                          left: ScreenSize.horizontal! * 2.5,
                          height: ScreenSize.vertical! * 1.5,
                          width: ScreenSize.horizontal! * 53,
                          fontSize: ScreenSize.horizontal! * 7,
                        )
                      : Container(
                          width: ScreenSize.horizontal! * 60,
                          child: Text(
                            title,
                            style: TextStyle(
                                color: const Color(0xffB6B6B6),
                                fontSize: ScreenSize.horizontal! * 3.5,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                  Container(
                    width: ScreenSize.horizontal! * 55,
                    child: Text(
                      description,
                      style: TextStyle(
                        color: const Color(0xffB6B6B6),
                        fontSize: ScreenSize.horizontal! * 3,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
    ;
  }
}

class SlideBar extends StatefulWidget {
  final List<String> categories;
  final Function(int) onTapIndex;
  const SlideBar(
      {super.key, required this.categories, required this.onTapIndex});

  @override
  State<SlideBar> createState() => _SlideBarState();
}

class _SlideBarState extends State<SlideBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: size.width * 0.05),
      width: size.width,
      height: size.height * 0.05,
      child: Expanded(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.categories.length,
            itemBuilder: (context, index) {
              Size size = MediaQuery.of(context).size;

              final String text = widget.categories[index];
              final TextStyle textStyle = GoogleFonts.nunitoSans(
                fontWeight: FontWeight.w700,
                fontSize: size.height * 0.025,
                textStyle: TextStyle(
                  color: selectedIndex == index
                      ? const Color(0xff47466D)
                      : Colors.grey,
                ),
              );
              Size _textSize(String text, TextStyle style) {
                final TextPainter textPainter = TextPainter(
                    text: TextSpan(text: text, style: style),
                    maxLines: 1,
                    textDirection: TextDirection.ltr)
                  ..layout(minWidth: 0, maxWidth: double.infinity);
                return textPainter.size;
              }

              final Size txtSize = _textSize(text, textStyle);

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      widget.onTapIndex(index);
                    });
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? const Color(0xffABEDD8)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(15)),
                        margin: const EdgeInsets.only(top: 15, left: 8),
                        height: txtSize.height * 0.45,
                        width: txtSize.width,
                      ),
                      Text(text, style: textStyle),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
