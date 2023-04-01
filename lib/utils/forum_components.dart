import 'package:flutter/material.dart';
import '../utils/size_config.dart';

class CommentCard extends StatelessWidget {
  final String name;
  final String comment;
  final String networkImage;
  final int likes;
  const CommentCard(
      {super.key,
      required this.name,
      required this.comment,
      required this.networkImage,
      required this.likes});

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Container(
      height: ScreenSize.vertical! * 13,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 197, 195, 195),
              offset: Offset(0, 4),
              blurRadius: 5,
              spreadRadius: 0,
            )
          ]),
      child: Container(
        margin: EdgeInsets.all(ScreenSize.horizontal! * 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: ScreenSize.horizontal! * 4.5,
              backgroundImage: NetworkImage(networkImage),
            ),
            SizedBox(
              width: ScreenSize.horizontal! * 2.5,
            ),
            Container(
              width: ScreenSize.horizontal! * 55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: ScreenSize.horizontal! * 4,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff47466D),
                    ),
                  ),
                  Text(
                    comment,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: ScreenSize.vertical! * 2,
                ),
                Image(
                  image: const AssetImage('assets/fire.png'),
                  width: ScreenSize.horizontal! * 6,
                ),
                Text(
                  "${likes}",
                  style: TextStyle(
                    fontSize: ScreenSize.horizontal! * 3,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
