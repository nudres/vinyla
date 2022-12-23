import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:vinyla/config/l10n/l10n.dart';
import 'package:vinyla/presenter/app/route/app_route.dart';

enum HomeTab { vinyls, library, profile }

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.selectedTab,
    required this.child,
    Key? key,
  }) : super(key: key);

  final HomeTab selectedTab;
  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AdaptiveNavigationScaffold(
          selectedIndex: selectedTab.index,
          body: child,
          onDestinationSelected: (int index) {
            switch (HomeTab.values[index]) {
              case HomeTab.vinyls:
                context.goNamed(AppRoute.allVinyl);
                break;
              case HomeTab.library:
                context.goNamed(AppRoute.myLibrary);
                break;
              case HomeTab.profile:
                context.goNamed(AppRoute.myProfile);
                break;
            }
          },
          destinations: <AdaptiveScaffoldDestination>[
            AdaptiveScaffoldDestination(
              title: context.l10n.tab_title_vinyls,
              icon: Icons.music_note,
            ),
            AdaptiveScaffoldDestination(
              title: context.l10n.tab_title_my_library,
              icon: Icons.library_music_rounded,
            ),
            AdaptiveScaffoldDestination(
              title: context.l10n.tab_title_profile,
              icon: Icons.person,
            ),
          ],
        ),
      );
}
