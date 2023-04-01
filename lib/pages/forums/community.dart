import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mykepolah/pages/forumsState/category.dart';
import 'package:mykepolah/tools/communityCard.dart';

import '../../components/sizeConfig.dart';
import '../../tools/SizeConfig.dart';
import '../../tools/component.dart';
import '../../tools/constants.dart';
import '../../utils/homepage_components.dart';
import 'package:google_fonts/google_fonts.dart';

class Community extends StatefulWidget {
  final String area;

  Community({super.key, required this.area});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  int num = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSize().init(context);
    final String area = widget.area;
    SizeConfig().init(context);
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(children: [
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
                      '$area',
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
              SlideBar(
                  categories: ['Infastracture', 'Wildlife', 'Pollution'],
                  onCountChanged: (index) {
                    setState(() {
                      num = index;
                    });
                  }),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 1.5,
              ),
              Container(
                height: SizeConfig.blockSizeVertical! * 30,
                child: (num == 0)
                    ? Infastracture(area: '$area')
                    : (num == 1)
                        ? Wildlife(area: '$area')
                        : (num == 2)
                            ? PollutionCards(area: '$area')
                            : Text("not found"),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
              GreenUnderlinedText(
                  text: "Hots",
                  top: ScreenSize.vertical! * 2.2,
                  left: ScreenSize.horizontal! * 3,
                  height: ScreenSize.vertical! * 3,
                  width: ScreenSize.horizontal! * 20,
                  fontSize: ScreenSize.horizontal! * 8),
              SizedBox(
                height: ScreenSize.vertical! * 4,
              ),
              ForumPostCard(
                name: "CGay Yonz",
                address: "Kuala Kangsar, Kelantan",
                networkImagePerson:
                    "https://scontent-kul3-1.xx.fbcdn.net/v/t31.18172-8/12339515_10153417110783650_3413788825013236803_o.jpg?_nc_cat=104&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=vewv1-H8cvkAX8B1se8&_nc_ht=scontent-kul3-1.xx&oh=00_AfDjDPok-IENLtiVajRqR9zRGUhTXvh1BtenQ4kMkb4eyA&oe=64463FB2",
                networkImagePlace:
                    "https://da4dkroembtou.cloudfront.net/wp-content/uploads/2020/12/main_1512_P4a_sf_1.jpg",
                title: "So many potholes here...",
                description: "Please fix this ASAP bruh",
                likes: 243,
                onTap: () {
                  context
                      .go('/forum/community/Hulu Selangor/update/discussion');
                },
              ),
              SizedBox(height: ScreenSize.vertical! * 3),
              ForumPostCard(
                name: "Mango Tan",
                address: "Kepong, Kuala Lumpur",
                networkImagePerson:
                    "https://scontent-kut2-1.xx.fbcdn.net/v/t1.6435-9/31817390_1448910555255518_2611503638257860608_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=174925&_nc_ohc=FJmDTPCc04cAX-4uQa-&_nc_oc=AQnyaeoZgOOU4-pFJuaImO63lKRjKISBDjM2aYM_017u6lrawlR2IgJqzHYV0WTQb-Y&_nc_ht=scontent-kut2-1.xx&oh=00_AfCGjqahPk6DlQ--0g3lq9fTlnw3zRN-T_dA1XX39l_i2g&oe=644660E8",
                networkImagePlace:
                    "https://cleanmalaysia.com/wp-content/uploads/2017/08/maxresdefault-2.jpg",
                title: "Elephants on da road again grapee",
                description: "This happened for the 5th time this month",
                likes: 129,
                onTap: () {
                  context
                      .go('/forum/community/Hulu Selangor/update/discussion');
                },
              ),
              SizedBox(height: ScreenSize.vertical! * 3),
              ForumPostCard(
                name: "Lai the reporter",
                address: "Tawau, Sabah",
                networkImagePerson:
                    "https://scontent-kul3-1.xx.fbcdn.net/v/t1.18169-9/26904213_1947314435284491_6168116030566342632_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=7gtFN7IckncAX8oSi-I&_nc_ht=scontent-kul3-1.xx&oh=00_AfA2sdkV19kQR02j7vICvodzIhFqGJKfX1umREJx3-W-QA&oe=64466B97",
                networkImagePlace:
                    "https://thesmartlocal.my/wp-content/uploads/2021/12/pothole-in-Sabah-3.jpg",
                title: "Slightly bigger pothole...",
                description: "Luckily I noticed it before driving into it",
                likes: 69,
                onTap: () {
                  context
                      .go('/forum/community/Hulu Selangor/update/discussion');
                },
              ),
              SizedBox(height: ScreenSize.vertical! * 3),
            ],
          ),
        ),
      ]),
    ));
  }
}
