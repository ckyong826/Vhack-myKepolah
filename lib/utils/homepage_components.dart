import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykepolah/utils/size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';

class ProgressUpdateCard extends StatefulWidget {
  const ProgressUpdateCard({super.key});

  @override
  State<ProgressUpdateCard> createState() => ProgressUpdateCardState();
}

class ProgressUpdateCardState extends State<ProgressUpdateCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(134, 171, 237, 216),
              spreadRadius: 0,
              blurRadius: 30,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(ScreenSize.horizontal! * 5,
                      ScreenSize.vertical! * 1.2, 0, 0),
                  child: Text(
                    "Progress update",
                    style: GoogleFonts.openSans(
                        color: Color(0xff47466D),
                        fontSize: ScreenSize.horizontal! * 6,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ScreenSize.vertical! * 2,
            ),
            Row(
              children: [
                Icon(
                  Icons.arrow_circle_left,
                  color: Color(0xffABEDD8),
                  size: ScreenSize.horizontal! * 7,
                ),
                SizedBox(
                  width: ScreenSize.horizontal! * 1,
                ),
                ProgressOfReportCard(),
                SizedBox(
                  width: ScreenSize.horizontal! * 0,
                ),
                Icon(
                  Icons.arrow_circle_right,
                  color: Color(0xffABEDD8),
                  size: ScreenSize.horizontal! * 7,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: ScreenSize.vertical! * 1.5,
              ),
              child: Container(
                width: ScreenSize.horizontal! * 75,
                height: ScreenSize.vertical! * 5,
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/reported/progress');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff47466D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Check Report",
                    style: TextStyle(
                        fontSize: ScreenSize.horizontal! * 4.5,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class ProgressOfReportCard extends StatefulWidget {
  const ProgressOfReportCard({super.key});

  @override
  State<ProgressOfReportCard> createState() => _ProgressOfReportCardState();
}

class _ProgressOfReportCardState extends State<ProgressOfReportCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: ScreenSize.horizontal! * 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const AspectRatio(
                aspectRatio: 4 / 3,
                child: Image(
                  image: NetworkImage(
                      "https://media.thestar.com.my/Prod/2D4FCEDB-FEA9-4C19-B0FF-C58EC1AB0DF6"),
                  fit: BoxFit.fill, // use this
                ),
              ),
            ),
          ),
          SizedBox(
            width: ScreenSize.horizontal! * 3,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GreenUnderlinedText(
                  text: "Under maintenance...",
                  top: ScreenSize.vertical! * 0.9,
                  left: ScreenSize.horizontal! * 2,
                  height: ScreenSize.vertical! * 1.2,
                  width: ScreenSize.horizontal! * 28,
                  fontSize: ScreenSize.vertical! * 1.5,
                ),
                SizedBox(
                  height: ScreenSize.vertical! * 1,
                ),
                Container(
                  width: ScreenSize.horizontal! * 35,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const AspectRatio(
                      aspectRatio: 20 / 9,
                      child: Image(
                        image: AssetImage("assets/map.png"),
                        fit: BoxFit.fill, // use this
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GreenUnderlinedText extends StatelessWidget {
  final String text;
  final double top;
  final double left;
  final double height;
  final double width;
  final double fontSize;
  const GreenUnderlinedText({
    super.key,
    required this.text,
    required this.top,
    required this.left,
    required this.height,
    required this.width,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Color(0xffABEDD8),
              borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.only(top: top, left: left),
          height: height,
          width: width,
        ),
        Text(
          text,
          style: TextStyle(
              color: Color(0xff47466D),
              fontSize: fontSize,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class ForumPostCard extends StatelessWidget {
  final String name;
  final String address;
  final String networkImagePerson;
  final String networkImagePlace;
  final String title;
  final String description;
  final int likes;
  final Function() onTap;
  const ForumPostCard({
    super.key,
    required this.name,
    required this.address,
    required this.networkImagePerson,
    required this.networkImagePlace,
    required this.title,
    required this.description,
    required this.likes,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 175, 174, 174),
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
            )
          ]),
      child: Column(children: [
        ListTile(
          leading: CircleAvatar(
            radius: ScreenSize.horizontal! * 6,
            backgroundImage: NetworkImage(networkImagePerson),
          ),
          title: Text(
            name,
            style: TextStyle(
                color: Color(0xff47466D),
                fontWeight: FontWeight.w700,
                fontSize: ScreenSize.horizontal! * 5),
          ),
          subtitle: Text(address),
          trailing: const FaIcon(
            FontAwesomeIcons.hourglassHalf,
            color: Color(0xff47466D),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            child: AspectRatio(
              aspectRatio: 5 / 3,
              child: Image(
                image: NetworkImage(networkImagePlace),
                fit: BoxFit.fill, // use this
              ),
            ),
          ),
        ),
        ListTile(
            onTap: onTap,
            title: Text(
              title,
              style: TextStyle(
                  color: const Color(0xff47466D),
                  fontWeight: FontWeight.w700,
                  fontSize: ScreenSize.horizontal! * 4),
            ),
            subtitle: Text(description),
            trailing: Column(
              children: [
                SizedBox(
                  height: ScreenSize.vertical! * 1,
                ),
                Image(
                  image: const AssetImage('assets/fire.png'),
                  width: ScreenSize.horizontal! * 6,
                ),
                Text(
                  "$likes",
                  style: TextStyle(
                    fontSize: ScreenSize.horizontal! * 3,
                    color: Colors.grey,
                  ),
                ),
              ],
            )),
      ]),
    );
  }
}
