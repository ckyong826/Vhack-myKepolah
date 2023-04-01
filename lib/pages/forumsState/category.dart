import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../tools/SizeConfig.dart';
import '../../tools/communityCard.dart';
import '../../tools/constants.dart';

class Infastracture extends StatelessWidget {
  Infastracture({super.key, required this.area});
  final String area;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        CommunityCard(
            image: 'assets/pothole/pothole.jpeg',
            area: '$area',
            title: 'Pot Hole',
            issue: 'Road Issue',
            colour: pricolor),
        SizedBox(
          width: SizeConfig.blockSizeHorizontal! * 3,
        ),
        CommunityCard(
            image: 'assets/pothole/download.jpeg',
            area: '$area',
            title: 'Streetlight',
            issue: 'Road Issue',
            colour: seccolor),
      ],
    );
  }
}

class Wildlife extends StatelessWidget {
  Wildlife({super.key, required this.area});
  final String area;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        CommunityCard(
            image: 'assets/pothole/pest.jpg',
            area: '$area',
            title: 'Pest Control',
            issue: 'Wildlife',
            colour: pricolor),
        SizedBox(
          width: SizeConfig.blockSizeHorizontal! * 3,
        ),
        CommunityCard(
            image: 'assets/pothole/dog_control.jpg',
            area: '$area',
            title: 'Wild Dogs',
            issue: 'Wildlife',
            colour: Colors.black),
      ],
    );
  }
}

class PollutionCards extends StatelessWidget {
  PollutionCards({super.key, required this.area});
  final String area;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        CommunityCard(
            image: 'assets/pothole/open_burning.jpg',
            area: '$area',
            title: 'Burning',
            issue: 'Pollution',
            colour: pricolor),
        SizedBox(
          width: SizeConfig.blockSizeHorizontal! * 3,
        ),
        CommunityCard(
            image: 'assets/images/smoking.jpg',
            area: '$area',
            title: 'Smoking',
            issue: 'Pollution',
            colour: Colors.black),
      ],
    );
  }
}
