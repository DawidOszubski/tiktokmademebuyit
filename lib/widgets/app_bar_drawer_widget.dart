import 'package:flutter/material.dart';

import '../constants/app_styles.dart';

class AppBarDrawerWidget extends StatefulWidget {
  const AppBarDrawerWidget({Key? key}) : super(key: key);

  @override
  State<AppBarDrawerWidget> createState() => _AppBarDrawerWidgetState();
}

class _AppBarDrawerWidgetState extends State<AppBarDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: Drawer(
        elevation: 10,
        semanticLabel: "Menu",
        child: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 12.0,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: [
                      ListTile(
                        title: const Text(
                          'Menu',
                          style: AppStyles.appBarItemStyle,
                        ),
                        onTap: () {
                          // Update the state of the app.
                          // ...
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'Menu',
                          style: AppStyles.appBarItemStyle,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text(
                          'Menu',
                          style: AppStyles.appBarItemStyle,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Icon(
                  Icons.shopping_basket_outlined,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width / 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
