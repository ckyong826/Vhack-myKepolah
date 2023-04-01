import 'package:flutter/material.dart';
import 'package:mykepolah/utils/profile_components.dart';
import 'package:mykepolah/utils/size_config.dart';
import 'package:iconsax/iconsax.dart';
import '../utils/homepage_components.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
        body: Container(
      color: const Color(0xffF6F6F6),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: ScreenSize.vertical! * 5,
              horizontal: ScreenSize.horizontal! * 7,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfilePageHeader(),
                SizedBox(
                  height: ScreenSize.vertical! * 3,
                ),
                const UserProfileCard(),
                SizedBox(
                  height: ScreenSize.vertical! * 5,
                ),
                GreenUnderlinedText(
                    text: "Overview",
                    top: ScreenSize.vertical! * 2.5,
                    left: ScreenSize.horizontal! * 3.5,
                    height: ScreenSize.vertical! * 2,
                    width: ScreenSize.horizontal! * 35,
                    fontSize: ScreenSize.horizontal! * 8),
                SizedBox(
                  height: ScreenSize.vertical! * 3,
                ),
                const EditDetailsCard(
                  leadingIcon: Iconsax.sms,
                  textContent: "hihi@gmail.com",
                  trailingIcon: Iconsax.lock_circle5,
                ),
                SizedBox(
                  height: ScreenSize.vertical! * 2,
                ),
                const EditDetailsCard(
                  leadingIcon: Iconsax.key,
                  textContent: "************",
                  trailingIcon: Iconsax.lock_circle5,
                ),
                SizedBox(
                  height: ScreenSize.vertical! * 2,
                ),
                const EditDetailsCard(
                  leadingIcon: Iconsax.location,
                  textContent: "Klang",
                  trailingIcon: Iconsax.edit,
                ),
                SizedBox(
                  height: ScreenSize.vertical! * 2,
                ),
                const EditDetailsCard(
                  leadingIcon: Iconsax.profile_circle,
                  textContent: "LaiZM",
                  trailingIcon: Iconsax.edit,
                ),
                SizedBox(
                  height: ScreenSize.vertical! * 10,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
