import 'dart:async';
import 'package:go_router/go_router.dart';

import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'sizeConfig.dart';
import 'location_services.dart';

//Top Bar
class TopBar extends StatelessWidget {
  final IconData iconright;
  final String text;
  const TopBar({super.key, required this.iconright, required this.text});

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
            onTap: () {
              // Navigator.pop(context);
            },
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
            text,
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.05,
              textStyle: const TextStyle(color: pricolor),
            ),
          ),
          SizedBox(
            width: (size.width * 0.33),
          ),
          Icon(
            iconright,
            color: pricolor,
            size: 35,
          ),
        ],
      ),
    );
  }
}

//Sliding List View
class SlideBar extends StatefulWidget {
  final List<String> categories;
  final Function(int) onTapChangePage;
  const SlideBar({
    super.key,
    required this.categories,
    required this.onTapChangePage,
  });

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
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.categories.length,
            itemBuilder: (context, index) {
              Size size = MediaQuery.of(context).size;

              final String text = widget.categories[index];
              final TextStyle textStyle = GoogleFonts.nunitoSans(
                fontWeight: FontWeight.bold,
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
                      widget.onTapChangePage(selectedIndex);
                    });
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? seccolor
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

  // Widget buildCategory(int index) {
  //   Size size = MediaQuery.of(context).size;

  //   final String text = widget.categories[index];
  //   final TextStyle textStyle = GoogleFonts.nunitoSans(
  //     fontWeight: FontWeight.bold,
  //     fontSize: size.height * 0.03,
  //     textStyle: TextStyle(
  //       color: selectedIndex == index ? pricolor : color1,
  //     ),
  //   );
  //   final Size txtSize = _textSize(text, textStyle);

  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
  //     child: GestureDetector(
  //       onTap: () {
  //         setState(() {
  //           selectedIndex = index;
  //           print(selectedIndex);
  //         });
  //       },
  //       child: Stack(
  //         children: <Widget>[
  //           Container(
  //             decoration: BoxDecoration(
  //                 color: selectedIndex == index ? seccolor : Colors.transparent,
  //                 borderRadius: BorderRadius.circular(15)),
  //             margin: const EdgeInsets.only(top: 15, left: 8),
  //             height: txtSize.height * 0.45,
  //             width: txtSize.width,
  //           ),
  //           Text(text, style: textStyle),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}

//Category Cards
class Categoryreport extends StatefulWidget {
  final List<String> cards;
  final List images;
  final List colors;
  const Categoryreport(
      {super.key,
      required this.cards,
      required this.images,
      required this.colors});

  @override
  State<Categoryreport> createState() => _CategoryreportState();
}

class _CategoryreportState extends State<Categoryreport> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: size.width * 0.8,
        height: size.height * 0.6,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: widget.cards.length,
          itemBuilder: (context, index) => buildCards(index),
        ),
      ),
    );
  }

  Widget buildCards(int index) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
      child: GestureDetector(
        onTap: () {
          context.go('/report/makeReport');
        },
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: widget.colors[index],
                  borderRadius: BorderRadius.circular(20)),
              height: size.height * 0.12,
              width: size.width * 0.8,
              child: Container(
                transform: Matrix4.translationValues(190.0, -50.0, 0.0),
                child: const FaIcon(
                  FontAwesomeIcons.anglesRight,
                  color: Color.fromARGB(100, 255, 255, 255),
                  size: 200,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 20, top: 8),
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.cards[index],
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w900,
                          fontSize: size.height * 0.035,
                          textStyle: const TextStyle(color: maincolor),
                        ),
                      ),
                      Container(
                        transform: Matrix4.translationValues(0, -10.0, 0.0),
                        height: 15,
                        child: Text(
                          'Road Issues',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                            textStyle: const TextStyle(color: maincolor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        transform: Matrix4.translationValues(0, -10.0, 0.0),
                        height: size.height * 0.03,
                        width: size.width * 0.4,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: maincolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          onPressed: () {
                            context.go('/report/makeReport');
                          },
                          child: Text(
                            textAlign: TextAlign.center,
                            'Make Report',
                            style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w800,
                              fontSize: 18.0,
                              textStyle: const TextStyle(color: pricolor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(10, 0, 0.0),
                  height: 80,
                  width: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: FractionalOffset.centerRight,
                          image: AssetImage(widget.images[index]))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//Track Location
class LocationTrack extends StatefulWidget {
  const LocationTrack({super.key});

  @override
  State<LocationTrack> createState() => _LocationTrackState();
}

class _LocationTrackState extends State<LocationTrack> {
  final Completer<GoogleMapController> _controller =
      Completer(); //contrller for Google map
  //markers for google map
  TextEditingController _searchController = TextEditingController();
  LocationData? currentLocation;
  Set<Marker> _markers = Set<Marker>();
  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then((location) {
      currentLocation = location;
      setState(() {});
    });

    GoogleMapController googleMapController = await _controller.future;

    // location.onLocationChanged.listen((newLoc) {
    //   currentLocation = newLoc;
    //   googleMapController.animateCamera(CameraUpdate.newCameraPosition(
    //       CameraPosition(
    //           zoom: 20.5,
    //           target: LatLng(newLoc.latitude!, newLoc.longitude!))));
    //   setState(() {});
    // });
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12)));
    _setMarker(LatLng(lat, lng));
    setState(() {});
  }

  @override
  void initState() {
    getCurrentLocation();
    _setMarker(LatLng(37.42, -122.085749));
    super.initState();
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('marker'),
        position: point,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return currentLocation == null
        ? Text(
            "Loading",
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.027,
              textStyle: const TextStyle(color: pricolor),
            ),
          )
        : Container(
            transform: Matrix4.translationValues(0, 0.0, 0.0),
            height: size.height * 0.6,
            width: size.width,
            child: Stack(
              children: [
                Expanded(
                  child: GoogleMap(
                    onTap: (LatLng latLng) {
                      _setMarker(latLng);
                      setState(() {});
                    },
                    zoomGesturesEnabled: true,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(currentLocation!.latitude!,
                            currentLocation!.longitude!),
                        zoom: 20.5),
                    markers: {
                      Marker(
                        markerId: const MarkerId("currentLocation"),
                        position: LatLng(currentLocation!.latitude!,
                            currentLocation!.longitude!),
                      )
                    },
                    onMapCreated: (GoogleMapController Controller) {
                      _controller.complete(Controller);
                    },
                  ),
                ),
                Positioned(
                  top: 20,
                  left: size.width / 10,
                  child: Container(
                    width: size.width * 0.8,
                    height: size.height * 0.055,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: color2,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 7),
                          child: TextFormField(
                            controller: _searchController,
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                                hintText: 'Search by City'),
                            onChanged: (value) {
                              print(value);
                            },
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: IconButton(
                              onPressed: () async {
                                var place = await LocationService()
                                    .getPlace(_searchController.text);
                                _goToPlace(place);
                              },
                              icon: const Icon(Icons.search)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

class BottomBar extends StatefulWidget {
  final String categories;
  const BottomBar({super.key, required this.categories});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return showBottombarMakeReport();
  }

  Widget showBottombarMakeReport() {
    Size size = MediaQuery.of(context).size;
    final String text = widget.categories;
    final TextStyle textStyle = GoogleFonts.openSans(
      fontWeight: FontWeight.bold,
      fontSize: size.height * 0.04,
      textStyle: const TextStyle(
        color: pricolor,
      ),
    );
    final Size txtSize = _textSize(text, textStyle);
    return Container(
      transform: Matrix4.translationValues(0, -20.0, 0.0),
      height: size.height * 0.08,
      width: size.width * 0.8,
      child: ElevatedButton(
        // ignore: sort_child_properties_last
        child: Text(
          textAlign: TextAlign.center,
          'Choose Location',
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w900,
            fontSize: 23.0,
            textStyle: const TextStyle(color: maincolor),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: pricolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: () {
          //show bottom sheet
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              builder: ((context) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Container(
                    height: size.height * 0.65,
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      //divider bar
                      Container(
                        height: size.height * 0.02,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                            color: color2,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      //Title
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.1,
                          ),
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: seccolor,
                                    borderRadius: BorderRadius.circular(15)),
                                margin:
                                    const EdgeInsets.only(top: 25, left: 18),
                                height: txtSize.height * 0.45,
                                width: txtSize.width,
                              ),
                              Text(text, style: textStyle),
                            ],
                          ),
                          SizedBox(
                            width: size.width * 0.28,
                          ),
                          Container(
                            transform: Matrix4.translationValues(0, 2.0, 0.0),
                            child: FaIcon(
                              FontAwesomeIcons.ellipsisVertical,
                              color: pricolor,
                              size: size.height * 0.04,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      //Location
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.09,
                          ),
                          Icon(
                            Iconsax.location5,
                            color: pricolor,
                            size: size.height * 0.07,
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lorong 4/47a",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.027,
                                  textStyle: const TextStyle(color: pricolor),
                                ),
                              ),
                              Text(
                                "Jalan Penchala, Subang, Malaysia",
                                style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.normal,
                                  fontSize: size.height * 0.02,
                                  textStyle: const TextStyle(color: color3),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      //title description
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.1,
                          ),
                          Text(
                            "Description",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height * 0.027,
                              textStyle: const TextStyle(color: pricolor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      //Photo upload and description upload
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.1,
                          ),
                          //Photo
                          Container(
                            height: size.height * 0.18,
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: color2),
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: maincolor,
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                const FaIcon(
                                  FontAwesomeIcons.camera,
                                  color: pricolor,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          //Description Upload
                          Container(
                            height: size.height * 0.15,
                            width: size.width * 0.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: color2),
                            child: Column(
                              children: [
                                TextFormField(
                                    style: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      textStyle: const TextStyle(
                                          color: Color(0xFF777777)),
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 20),
                                      hintText: "TITLE",
                                    )),
                                Container(
                                  transform:
                                      Matrix4.translationValues(0, -20, 0.0),
                                  child: Divider(
                                    indent: size.width * 0.04,
                                    endIndent: size.width * 0.04,
                                    thickness: 2,
                                    color: color3,
                                  ),
                                ),
                                Container(
                                  transform:
                                      Matrix4.translationValues(0, -40, 0.0),
                                  child: TextFormField(
                                      style: GoogleFonts.nunitoSans(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        textStyle:
                                            const TextStyle(color: color3),
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(left: 20),
                                        hintText: "Write Something...",
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      //Button(MakeReport)
                      showBottombarPosting(),
                    ]),
                  ),
                );
              }));
        },
      ),
    );
  }

  Widget showBottombarPosting() {
    Size size = MediaQuery.of(context).size;
    final String text = widget.categories;
    final TextStyle textStyle = GoogleFonts.openSans(
      fontWeight: FontWeight.bold,
      fontSize: size.height * 0.04,
      textStyle: const TextStyle(
        color: pricolor,
      ),
    );
    final Size txtSize = _textSize(text, textStyle);
    return Container(
      height: size.height * 0.07,
      width: size.width * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: pricolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: () {
          //show bottom sheet
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              builder: ((context) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Container(
                    height: size.height * 0.7,
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      //divider bar
                      Container(
                        height: size.height * 0.02,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                            color: color2,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        "Duplicate report found",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          textStyle: const TextStyle(color: pricolor),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
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
                        onTap: () {},
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      //Button(MakeReport)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: size.height * 0.07,
                            width: size.height * 0.07,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: maincolor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                side:
                                    const BorderSide(color: seccolor, width: 4),
                              ),
                              onPressed: () {
                                context.go('/home');
                              },
                              child: Image.asset("assets/images/return.png"),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Container(
                            height: size.height * 0.07,
                            width: size.width * 0.55,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: pricolor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              onPressed: () {
                                context.go('/home');
                              },
                              child: Text(
                                "Submit anyway",
                                style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22.0,
                                  textStyle: const TextStyle(color: maincolor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                );
              }));
        },
        child: Text(
          textAlign: TextAlign.center,
          'Make Report',
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w900,
            fontSize: 23.0,
            textStyle: const TextStyle(color: maincolor),
          ),
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
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
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
            radius: size.height * 0.03,
            backgroundImage: NetworkImage(networkImagePerson),
          ),
          title: Text(
            name,
            style: TextStyle(
                color: Color(0xff47466D),
                fontWeight: FontWeight.w700,
                fontSize: size.height * 0.025),
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
                  fontSize: size.height * 0.02),
            ),
            subtitle: Text(description),
            trailing: Column(
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                Image(
                  image: const AssetImage('assets/images/fire.png'),
                  width: size.height * 0.028,
                ),
                Text(
                  "$likes",
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                    color: Colors.grey,
                  ),
                ),
              ],
            )),
      ]),
    );
  }
}
