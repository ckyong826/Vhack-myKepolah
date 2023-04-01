import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';

//Top Bar
class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.1,
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(top: 3),
              child: FaIcon(
                FontAwesomeIcons.arrowLeft,
                color: pricolor,
                size: size.height * 0.04,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            'Report',
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.05,
              textStyle: const TextStyle(color: pricolor),
            ),
          ),
          SizedBox(
            width: (size.width * 0.45),
          ),
          const Icon(
            Iconsax.filter_search5,
            color: pricolor,
            size: 30,
          ),
        ],
      ),
    );
  }
}

//Sliding List View
class SlideBar extends StatefulWidget {
  SlideBar({super.key, required this.categories, required this.onCountChanged});
  List<String> categories;
  final Function(int) onCountChanged;

  @override
  State<SlideBar> createState() => _SlideBarState();
}

class _SlideBarState extends State<SlideBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.05,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) => buildCategory(index),
      ),
    );
  }

  Widget buildCategory(int index) {
    Size size = MediaQuery.of(context).size;

    final String text = widget.categories[index];
    final TextStyle textStyle = GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w700,
      fontSize: size.height * 0.03,
      textStyle: TextStyle(
        color: selectedIndex == index ? pricolor : color1,
      ),
    );
    final Size txtSize = _textSize(text, textStyle);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
            widget.onCountChanged(selectedIndex);
          });
        },
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: selectedIndex == index ? seccolor : Colors.transparent,
                  borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.only(top: 17, left: 8),
              height: txtSize.height * 0.45,
              width: txtSize.width,
            ),
            Text(text, style: textStyle),
          ],
        ),
      ),
    );
  }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
