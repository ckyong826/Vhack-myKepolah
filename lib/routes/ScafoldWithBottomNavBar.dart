import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';
import '../tools/SizeConfig.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar(
      {Key? key, required this.child, required this.tabs})
      : super(key: key);
  final Widget child;
  final List<ScaffoldWithNavBarTabItem> tabs;

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {

  int _locationToTabIndex(String location) {
    final index =
        widget.tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  void _onItemTapped(BuildContext context, int tabIndex) {
    // Only navigate if the tab index has changed
    if (tabIndex != _currentIndex) {
      context.go(widget.tabs[tabIndex].initialLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: widget.child,
      floatingActionButton:SizedBox(
        height: SizeConfig.blockSizeHorizontal! * 18,
        child: FittedBox(
          child: FloatingActionButton( //Floating action button on Scaffold
          backgroundColor: Color(0XFF47466D),
          onPressed: (){
              context.go('/report');
          },
          child: SizedBox(
            height: SizeConfig.blockSizeHorizontal! * 10,
            child: FittedBox(
              child: Icon(
                Icons.add,
                
              ),
            ),
          ), //icon inside button
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:  Container(
          decoration: const BoxDecoration(                                                   
            borderRadius: BorderRadius.only(                                           
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),            
            boxShadow: [                                                               
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),       
            ],
          ),        
        child: ClipRRect(
          borderRadius: const BorderRadius.only(                                           
            topLeft: Radius.circular(30.0),                                            
            topRight: Radius.circular(30.0),                                           
            ),  
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Color(0XFFABEDD8),
            unselectedItemColor: Color(0XFF47466D),
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            items: widget.tabs,
            iconSize: SizeConfig.safeBlockHorizontal! * 8,
            onTap: (index) => _onItemTapped(context, index),
            
          ),
        ),
      ),
    );
  }
}