import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mykepolah/pages/forums/community.dart';

import 'package:iconsax/iconsax.dart';
import 'package:mykepolah/pages/forums/forum_page.dart';
import 'package:mykepolah/pages/forums/update.dart';
import 'package:mykepolah/pages/reported/progress_page.dart';
import 'package:mykepolah/roots/forum.dart';
import 'package:mykepolah/roots/home_page.dart';
import 'package:mykepolah/roots/profile.dart';
import 'package:mykepolah/roots/report.dart';
import 'package:mykepolah/roots/reported.dart';
import 'package:mykepolah/routes/ScafoldWithBottomNavBar.dart';
import 'package:mykepolah/tools/SizeConfig.dart';
import 'package:mykepolah/tools/forumCard.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final tabs = [
      ScaffoldWithNavBarTabItem(
        initialLocation: '/home',
        icon: Container(child: Icon(Iconsax.home_25)),
        label: 'Home',
      ),
      ScaffoldWithNavBarTabItem(
        initialLocation: '/forum',
        icon: Container(
            padding:
                EdgeInsets.only(right: SizeConfig.safeBlockHorizontal! * 13),
            child: Icon(Iconsax.people5)),
        label: 'Forum',
      ),
      ScaffoldWithNavBarTabItem(
        initialLocation: '/reported',
        icon: Container(
            padding:
                EdgeInsets.only(left: SizeConfig.safeBlockHorizontal! * 13),
            child: FaIcon(
              FontAwesomeIcons.hourglassHalf,
              size: 33,
            )),
        label: 'Reported',
      ),
      ScaffoldWithNavBarTabItem(
        initialLocation: '/profile',
        icon: Container(
            child: FaIcon(
          FontAwesomeIcons.solidUser,
          size: 33,
        )),
        label: 'Profile',
      ),
    ];
    final GoRouter goRouter = GoRouter(
        initialLocation: '/home',
        navigatorKey: _rootNavigatorKey,
        debugLogDiagnostics: true,
        routes: [
          ShellRoute(
              // navigatorKey: _shellNavigatorKey,
              builder: (context, state, child) {
                return ScaffoldWithBottomNavBar(tabs: tabs, child: child);
              },
              routes: [
                //Home page
                GoRoute(
                  path: '/home',
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const HomePage(),
                  ),
                ),
                //Sessions page
                GoRoute(
                    path: '/forum',
                    pageBuilder: (context, state) => NoTransitionPage(
                          key: state.pageKey,
                          child: Forum(),
                        ),
                    routes: [
                      GoRoute(
                          path: 'community/:area',
                          builder: (context, state) =>
                              Community(area: state.params["area"]!),
                          routes: [
                            GoRoute(
                                path: 'update',
                                builder: (context, state) => const Update(),
                                routes: [
                                  GoRoute(
                                    path: 'discussion',
                                    builder: (context, state) =>
                                        const ForumPage(),
                                  )
                                ])
                          ])
                    ]),

                //Resources page
                GoRoute(
                    path: '/reported',
                    pageBuilder: (context, state) => NoTransitionPage(
                          key: state.pageKey,
                          child: const ReportsPage(),
                        ),
                    routes: [
                      GoRoute(
                        path: 'progress',
                        builder: (context, state) => const ProgressPage(),
                      )
                    ]),
                //Profile page
                GoRoute(
                  path: '/profile',
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const ProfilePage(),
                  ),
                ),
                GoRoute(
                    path: '/report',
                    pageBuilder: (context, state) => NoTransitionPage(
                          key: state.pageKey,
                          child: const CategoryReport(),
                        ),
                    routes: [
                      GoRoute(
                        path: 'makeReport',
                        builder: (context, state) => const MakingReport(),
                      )
                    ]),
              ])
        ]);

    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}

class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  /// Constructs an [ScaffoldWithNavBarTabItem].
  const ScaffoldWithNavBarTabItem(
      {required this.initialLocation, required Widget icon, String? label})
      : super(icon: icon, label: label);

  /// The initial location/path
  final String initialLocation;
}
