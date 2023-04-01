import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../tools/SizeConfig.dart';
import '../../tools/forumCard.dart';

class Selangor extends StatelessWidget {
  const Selangor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ForumCard(image: 'assets/selangor/huluselangor.png', name: 'Hulu Selangor'),
            ForumCard(image: 'assets/selangor/klang.jpeg', name: 'Klang')
          ],
        ),
        SizedBox(height: SizeConfig.blockSizeHorizontal! * 3 ,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ForumCard(image: 'assets/selangor/ampangjaya.png', name: 'Ampang Jaya'),
            ForumCard(image: 'assets/selangor/kualaLangat.png', name: 'Kuala Langat')
          ],
        ),
        SizedBox(height: SizeConfig.blockSizeHorizontal! * 3 ,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ForumCard(image: 'assets/selangor/petalingJaya.png', name: 'Petaling Jaya'),
            ForumCard(image: 'assets/selangor/shahAlam.png', name: 'Shah Alam')
          ],
        )
      ],
    );
  }
}

class Johor extends StatelessWidget {
  const Johor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ForumCard(image: 'assets/johor/batuPahat.png', name: 'Batu Pahat'),
            ForumCard(image: 'assets/johor/iskandarPuteri.png', name: 'Iskandar Puteri')
          ],
        ),
        SizedBox(height: SizeConfig.blockSizeHorizontal! * 3 ,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ForumCard(image: 'assets/johor/kulai.png', name: 'Kulai'),
            ForumCard(image: 'assets/johor/Muar.png', name: 'Muar')
          ],
        ),
        SizedBox(height: SizeConfig.blockSizeHorizontal! * 3 ,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ForumCard(image: 'assets/johor/pasirGudang.png', name: 'Pasir Gudang'),
            ForumCard(image: 'assets/johor/johorBahru1.png', name: 'Johor Bahru')
          ],
        )
      ],
    );
  }
}

class Penang extends StatelessWidget {
  const Penang({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ForumCard(image: 'assets/penang/sebarangPerai.png', name: 'Sebarang Perai'),
            ForumCard(image: 'assets/penang/penangIsland.png', name: 'Penang Island')
          ],
        ),
        SizedBox(height: SizeConfig.blockSizeHorizontal! * 3 ,),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     ForumCard(image: 'assets/selangor/huluselangor.png', name: 'Hulu Selangor'),
        //     ForumCard(image: 'assets/selangor/huluselangor.png', name: 'Hulu Selangor')
        //   ],
        // ),
        // SizedBox(height: SizeConfig.blockSizeHorizontal! * 3 ,),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     ForumCard(image: 'assets/selangor/huluselangor.png', name: 'Hulu Selangor'),
        //     ForumCard(image: 'assets/selangor/huluselangor.png', name: 'Hulu Selangor')
        //   ],
        // )
      ],
    );
  }
}