import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykepolah/utils/homepage_components.dart';
import '../utils/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffF6F6F6),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Light green circle in background
              Positioned(
                top: ScreenSize.vertical! * -50,
                child: Container(
                    width: ScreenSize.horizontal! * 150,
                    height: ScreenSize.vertical! * 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffABEDD8),
                    )),
              ),
              SafeArea(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: ScreenSize.vertical! * 5,
                    horizontal: ScreenSize.horizontal! * 7,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Welcome header
                      Row(
                        children: [
                          Image(
                              image: const AssetImage('assets/menu.png'),
                              height: ScreenSize.horizontal! * 10),
                          SizedBox(
                            width: ScreenSize.horizontal! * 3,
                          ),
                          Text(
                            "Welcome!",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w700,
                              color: Color(0xff47466D),
                              fontSize: ScreenSize.horizontal! * 10,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize.vertical! * 2,
                      ),
                      // Progress update
                      ProgressUpdateCard(),
                      SizedBox(
                        height: ScreenSize.vertical! * 4,
                      ),

                      // My report section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GreenUnderlinedText(
                              text: "My Report",
                              top: ScreenSize.vertical! * 2,
                              left: ScreenSize.horizontal! * 3,
                              height: ScreenSize.vertical! * 3,
                              width: ScreenSize.horizontal! * 40,
                              fontSize: ScreenSize.horizontal! * 8),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "View All",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff47466D),
                                  fontSize: ScreenSize.horizontal! * 3.5,
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize.vertical! * 1.5,
                      ),
                      ForumPostCard(
                        name: "LaiZM",
                        address: "Jalan Tun Razak, Puchong",
                        networkImagePerson:
                            "https://news.microsoft.com/wp-content/uploads/prod/sites/430/2021/06/Portrait-of-a-young-Malay-man-in-a-modern-office.png",
                        networkImagePlace:
                            "https://da4dkroembtou.cloudfront.net/wp-content/uploads/2020/12/main_1512_P4a_sf_1.jpg",
                        title: "So many potholes here...",
                        description: "Please fix this ASAP bruh",
                        likes: 243,
                        onTap: () {
                          context.go(
                              '/forum/community/Hulu Selangor/update/discussion');
                        },
                      ),

                      SizedBox(height: ScreenSize.vertical! * 3),
                      ForumPostCard(
                        name: "LaiZM",
                        address: "Jalan Tun Razak, Puchong",
                        networkImagePerson:
                            "https://news.microsoft.com/wp-content/uploads/prod/sites/430/2021/06/Portrait-of-a-young-Malay-man-in-a-modern-office.png",
                        networkImagePlace:
                            "https://cleanmalaysia.com/wp-content/uploads/2017/08/maxresdefault-2.jpg",
                        title: "Elephants on da road again grapee",
                        description:
                            "This happened for the 5th time this month",
                        likes: 129,
                        onTap: () {
                          context.go(
                              '/forum/community/Hulu Selangor/update/discussion');
                        },
                      ),
                      SizedBox(height: ScreenSize.vertical! * 3),
                      ForumPostCard(
                        name: "LaiZM",
                        address: "Jalan Tun Razak, Puchong",
                        networkImagePerson:
                            "https://news.microsoft.com/wp-content/uploads/prod/sites/430/2021/06/Portrait-of-a-young-Malay-man-in-a-modern-office.png",
                        networkImagePlace:
                            "https://thesmartlocal.my/wp-content/uploads/2021/12/pothole-in-Sabah-3.jpg",
                        title: "Slightly bigger pothole...",
                        description:
                            "Luckily I noticed it before driving into it",
                        likes: 69,
                        onTap: () {
                          context.go(
                              '/forum/community/Hulu Selangor/update/discussion');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
