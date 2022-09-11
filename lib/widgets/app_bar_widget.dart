import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tiktokmademebuyit/constants/app_styles.dart';

import '../constants/app_assets.dart';
import '../constants/app_colors.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  var isBasketHover = false;
  var basketSize = 30.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.only(left: 50.0, right: 20.0),
      child: ResponsiveRowColumn(
        rowMainAxisAlignment: MainAxisAlignment.spaceAround,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        layout: ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            child: ResponsiveVisibility(
              hiddenWhen: const [
                Condition.smallerThan(name: "XS"),
              ],
              child: SvgPicture.asset(
                AppAssets.pageTitle,
                height: ResponsiveValue(
                  context,
                  defaultValue: 25.0,
                  valueWhen: [
                    const Condition.smallerThan(
                      name: MOBILE,
                      value: 15.0,
                    ),
                  ],
                ).value,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const ResponsiveRowColumnItem(
            child: ResponsiveVisibility(
              hiddenWhen: [Condition.smallerThan(name: DESKTOP)],
              child: ResponsiveRowColumn(
                rowPadding: EdgeInsets.symmetric(horizontal: 50.0),
                layout: ResponsiveRowColumnType.ROW,
                children: [
                  ResponsiveRowColumnItem(
                    child: AppBarItemWidget(
                      title: 'Promocje',
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: AppBarItemWidget(
                        title: 'Nowości',
                      ),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: AppBarItemWidget(
                      title: 'Trendujące',
                    ),
                  ),
                ],
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            child: ResponsiveVisibility(
              hiddenWhen: [
                Condition.smallerThan(name: TABLET),
              ],
              child: ResponsiveRowColumn(
                layout: ResponsiveRowColumnType.ROW,
                children: [
                  const ResponsiveRowColumnItem(
                    child: AppBarItemWidget(
                      title: 'Zaloguj się',
                    ),
                  ),
                  const ResponsiveRowColumnItem(
                    child: SizedBox(
                      width: 20,
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: Stack(
                      children: [
                        /*  Image.asset(
                          "assets/images/bag.png",
                          scale: 0.1,
                        ),*/
                        InkWell(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                          onTap: () {},
                          onHover: (isHover) {
                            if (isHover) {
                              setState(() {
                                isBasketHover = true;
                                basketSize = 35;
                              });
                            } else {
                              setState(() {
                                isBasketHover = false;
                                basketSize = 30;
                              });
                            }
                          },
                          child: Stack(
                            children: [
                              Transform.translate(
                                offset: const Offset(-2, -1),
                                child: Visibility(
                                  visible: isBasketHover,
                                  child: Icon(
                                    Icons.shopping_basket_outlined,
                                    color: AppColors.blue,
                                    size: basketSize,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: isBasketHover,
                                child: Transform.translate(
                                  offset: const Offset(2, 1),
                                  child: Icon(
                                    Icons.shopping_basket_outlined,
                                    color: AppColors.red,
                                    size: basketSize,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.shopping_basket_outlined,
                                color: Colors.white,
                                size: basketSize,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarItemWidget extends StatefulWidget {
  const AppBarItemWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<AppBarItemWidget> createState() => _AppBarItemWidgetState();
}

class _AppBarItemWidgetState extends State<AppBarItemWidget> {
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
            fontSize =
                AppStyles.appBarItemStyle.copyWith(fontSize: 25.0).fontSize;
          });
        } else {
          setState(() {
            isSelected = false;
            fontSize =
                AppStyles.appBarItemStyle.copyWith(fontSize: 22.0).fontSize;
          });
        }
      },
      child: Padding(
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
    );
  }
}
