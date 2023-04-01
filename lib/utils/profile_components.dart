import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mykepolah/utils/homepage_components.dart';
import '../utils/size_config.dart';

class ProfilePageHeader extends StatelessWidget {
  const ProfilePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Profile",
            style: GoogleFonts.openSans(
              color: Color(0xff47466D),
              fontSize: ScreenSize.horizontal! * 8,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0.0, -5.0, 0.0),
            child: Icon(
              Iconsax.edit5,
              color: Color(0xff47466D),
              size: ScreenSize.horizontal! * 9,
            ),
          )
        ]);
  }
}

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Container(
      width: double.infinity,
      height: ScreenSize.vertical! * 28,
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
        SizedBox(
          height: ScreenSize.vertical! * 3,
        ),
        CircleAvatar(
          radius: ScreenSize.horizontal! * 10,
          backgroundImage: NetworkImage(
              "https://news.microsoft.com/wp-content/uploads/prod/sites/430/2021/06/Portrait-of-a-young-Malay-man-in-a-modern-office.png"),
        ),
        SizedBox(
          height: ScreenSize.vertical! * 1,
        ),
        GreenUnderlinedText(
            text: "LaiZM ",
            top: ScreenSize.vertical! * 1.5,
            left: ScreenSize.horizontal! * 3,
            height: ScreenSize.vertical! * 2,
            width: ScreenSize.horizontal! * 16,
            fontSize: ScreenSize.horizontal! * 6),
        SizedBox(
          height: ScreenSize.vertical! * 1,
        ),
        Container(
          width: ScreenSize.horizontal! * 70,
          child: const Text(
            "Passionate in making the world a better place",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(
          height: ScreenSize.vertical! * 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Report
            Column(
              children: [
                Text(
                  "12",
                  style: TextStyle(
                    color: Color(0xff47466D),
                    fontSize: ScreenSize.horizontal! * 4.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "REPORT",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: ScreenSize.horizontal! * 2.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: ScreenSize.horizontal! * 4,
            ),
            Container(
              color: Color.fromARGB(255, 190, 190, 190),
              width: ScreenSize.horizontal! * 0.2,
              height: ScreenSize.vertical! * 4,
            ),
            SizedBox(
              width: ScreenSize.horizontal! * 4,
            ),
            Column(
              children: [
                Text(
                  "34",
                  style: TextStyle(
                    color: Color(0xff47466D),
                    fontSize: ScreenSize.horizontal! * 4.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "COMMENTS",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: ScreenSize.horizontal! * 2.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: ScreenSize.horizontal! * 4,
            ),
            Container(
              color: Color.fromARGB(255, 201, 200, 200),
              width: ScreenSize.horizontal! * 0.2,
              height: ScreenSize.vertical! * 4,
            ),
            SizedBox(
              width: ScreenSize.horizontal! * 4,
            ),
            Column(
              children: [
                Text(
                  "92",
                  style: TextStyle(
                    color: Color(0xff47466D),
                    fontSize: ScreenSize.horizontal! * 4.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "LIKES",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: ScreenSize.horizontal! * 2.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }
}

class EditDetailsCard extends StatelessWidget {
  final IconData leadingIcon;
  final String textContent;
  final IconData trailingIcon;
  const EditDetailsCard({
    super.key,
    required this.leadingIcon,
    required this.textContent,
    required this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: ScreenSize.vertical! * 1.5,
          horizontal: ScreenSize.horizontal! * 4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 200, 199, 199),
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
            )
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Icon(
              leadingIcon,
              size: ScreenSize.horizontal! * 8.5,
              color: Color(0xff47466D),
            ),
            SizedBox(
              width: ScreenSize.horizontal! * 3,
            ),
            Text(
              textContent,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Icon(
          trailingIcon,
          color: Color(0xff47466D),
        ),
      ]),
    );
  }
}
