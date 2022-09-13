import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tiktokmademebuyit/constants/app_assets.dart';

import '../constants/app_colors.dart';
import '../constants/app_styles.dart';
import 'custom_divider_widget.dart';

class AppBarDrawerWidget extends StatefulWidget {
  const AppBarDrawerWidget({Key? key}) : super(key: key);

  @override
  State<AppBarDrawerWidget> createState() => _AppBarDrawerWidgetState();
}

class _AppBarDrawerWidgetState extends State<AppBarDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: AppColors.red, spreadRadius: 4, blurRadius: 10),
            BoxShadow(color: AppColors.blue, spreadRadius: 2, blurRadius: 5),
          ],
          color: Colors.black,
        ),
        child: SingleChildScrollView(
          child: ResponsiveRowColumn(
            columnMainAxisSize: MainAxisSize.max,
            columnCrossAxisAlignment: CrossAxisAlignment.center,
            layout: ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                child: ResponsiveRowColumn(
                  columnCrossAxisAlignment: CrossAxisAlignment.center,
                  layout: ResponsiveRowColumnType.COLUMN,
                  children: [
                    ResponsiveRowColumnItem(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 12.0,
                        ),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: AppColors.white,
                              ),
                            ),
                            const Center(
                              child: Text(
                                "Menu",
                                style: AppStyles.appBarItemStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const ResponsiveRowColumnItem(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: CustomDividerWidget(),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: ResponsiveVisibility(
                        visible: false,
                        visibleWhen: const [
                          Condition.smallerThan(name: TABLET),
                        ],
                        child: ResponsiveRowColumn(
                          columnCrossAxisAlignment: CrossAxisAlignment.center,
                          layout: ResponsiveRowColumnType.COLUMN,
                          children: [
                            ResponsiveRowColumnItem(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal: 10.0,
                                ),
                                child: AppBarDrawerItemWidget(
                                  title: "Zaloguj się",
                                  icon: Icons.person,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const ResponsiveRowColumnItem(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 10.0,
                        ),
                        child: AppBarDrawerSaleWidget(
                          title: "Promocje",
                          icon: AppAssets.saleIcon,
                        ),
                      ),
                    ),
                    const ResponsiveRowColumnItem(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 10.0,
                        ),
                        child: AppBarDrawerItemWidget(
                          title: "Nowości",
                          icon: Icons.local_fire_department,
                        ),
                      ),
                    ),
                    const ResponsiveRowColumnItem(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 10.0,
                        ),
                        child: AppBarDrawerItemWidget(
                          title: "Trendujące",
                          icon: Icons.trending_up,
                        ),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: ResponsiveVisibility(
                        visible: false,
                        visibleWhen: const [
                          Condition.smallerThan(name: TABLET),
                        ],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 10.0,
                          ),
                          child: AppBarDrawerItemWidget(
                            title: "Koszyk",
                            icon: Icons.shopping_basket_outlined,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarDrawerItemWidget extends StatefulWidget {
  const AppBarDrawerItemWidget({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;
  @override
  State<AppBarDrawerItemWidget> createState() => _AppBarDrawerItemWidgetState();
}

class _AppBarDrawerItemWidgetState extends State<AppBarDrawerItemWidget> {
  var iconSize = 30;
  var isSelected = false;
  var fontSize = AppStyles.appBarItemStyle.fontSize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor:
          MaterialStateColor.resolveWith((states) => Colors.transparent),
      onTap: () {},
      onHover: (isHover) {
        if (isHover) {
          setState(() {
            isSelected = true;
            iconSize = 35;
            fontSize =
                AppStyles.appBarItemStyle.copyWith(fontSize: 25.0).fontSize;
          });
        } else {
          setState(() {
            isSelected = false;
            iconSize = 30;
            fontSize =
                AppStyles.appBarItemStyle.copyWith(fontSize: 22.0).fontSize;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Visibility(
                  visible: isSelected,
                  child: Transform.translate(
                    offset: Offset(-2, -2),
                    child: Icon(
                      widget.icon,
                      color: AppColors.blue,
                      size: 30,
                    ),
                  ),
                ),
                Visibility(
                  visible: isSelected,
                  child: Transform.translate(
                    offset: Offset(2, 2),
                    child: Icon(
                      widget.icon,
                      color: AppColors.red,
                      size: 30,
                    ),
                  ),
                ),
                Icon(
                  widget.icon,
                  color: AppColors.white,
                  size: 30,
                ),
              ],
            ),
            SizedBox(
              width: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: [
                  Visibility(
                    visible: isSelected,
                    child: Transform.translate(
                      offset: const Offset(-2, -2),
                      child: Text(
                        widget.title,
                        style: AppStyles.appBarItemStyle.copyWith(
                          color: AppColors.blue,
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isSelected,
                    child: Transform.translate(
                      offset: Offset(2, 2),
                      child: Text(
                        widget.title,
                        style: AppStyles.appBarItemStyle.copyWith(
                          color: AppColors.red,
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    widget.title,
                    style: AppStyles.appBarItemStyle.copyWith(
                      fontSize: fontSize,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarDrawerSaleWidget extends StatefulWidget {
  const AppBarDrawerSaleWidget({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String icon;
  @override
  State<AppBarDrawerSaleWidget> createState() => _AppBarDrawerSaleWidgetState();
}

class _AppBarDrawerSaleWidgetState extends State<AppBarDrawerSaleWidget> {
  var iconSize = 30;
  var isSelected = false;
  var fontSize = AppStyles.appBarItemStyle.fontSize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor:
          MaterialStateColor.resolveWith((states) => Colors.transparent),
      onTap: () {},
      onHover: (isHover) {
        if (isHover) {
          setState(() {
            isSelected = true;
            iconSize = 35;
            fontSize =
                AppStyles.appBarItemStyle.copyWith(fontSize: 25.0).fontSize;
          });
        } else {
          setState(() {
            isSelected = false;
            iconSize = 30;
            fontSize =
                AppStyles.appBarItemStyle.copyWith(fontSize: 22.0).fontSize;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Visibility(
                  visible: isSelected,
                  child: Transform.translate(
                    offset: Offset(-2, -2),
                    child: Image.asset(
                      widget.icon,
                      color: AppColors.blue,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                Visibility(
                  visible: isSelected,
                  child: Transform.translate(
                    offset: Offset(2, 2),
                    child: Image.asset(
                      widget.icon,
                      color: AppColors.red,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                Image.asset(
                  widget.icon,
                  color: AppColors.white,
                  width: 30,
                  height: 30,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: [
                  Visibility(
                    visible: isSelected,
                    child: Transform.translate(
                      offset: const Offset(-2, -2),
                      child: Text(
                        widget.title,
                        style: AppStyles.appBarItemStyle.copyWith(
                          color: AppColors.blue,
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isSelected,
                    child: Transform.translate(
                      offset: Offset(2, 2),
                      child: Text(
                        widget.title,
                        style: AppStyles.appBarItemStyle.copyWith(
                          color: AppColors.red,
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    widget.title,
                    style: AppStyles.appBarItemStyle.copyWith(
                      fontSize: fontSize,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
