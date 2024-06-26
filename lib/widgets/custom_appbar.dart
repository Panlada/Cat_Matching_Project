import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/screens.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasActions;
  final List<IconData> actionsIcons;
  final List<String> actionsRoutes;

  const CustomAppBar({
    super.key,
    required this.title,
    this.hasActions = true,
    this.actionsIcons = const [Icons.message, Icons.person],
    this.actionsRoutes = const [
      MatchesScreen.routeName,
      ProfileScreen.routeName,
    ],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: Theme.of(context).primaryColor.withAlpha(30),
      // backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.popAndPushNamed(context, '/');
              },
              child: const Image(
                height: 60,
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/logo.png'),
              ),

              // child: SvgPicture.asset(
              //   'assets/logo.svg',
              //   height: 50,
              // ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
      actions: hasActions
          ? [
              IconButton(
                  icon: Icon(actionsIcons[0],
                      color: Theme.of(context).primaryColor),
                  onPressed: () {
                    Navigator.pushNamed(context, actionsRoutes[0]);
                  }),
              IconButton(
                  icon: Icon(actionsIcons[1],
                      color: Theme.of(context).primaryColor),
                  onPressed: () {
                    Navigator.pushNamed(context, actionsRoutes[1]);
                  }),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
