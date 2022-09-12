import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tiktokmademebuyit/constants/app_colors.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.black,
      child: Center(
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(
                  top: 300,
                  bottom: 100,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black87,
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(
                        6,
                        6,
                      ),
                    ),
                    BoxShadow(
                      color: Colors.grey.shade900,
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(
                        -2,
                        -4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Center(
              child: SliderWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  List sliderItems = [];

  @override
  void initState() {
    sliderItems = [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Image.asset('assets/images/1.png', fit: BoxFit.fitHeight),
      ),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Image.asset('assets/images/1.png', fit: BoxFit.fitHeight),
      ),
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Image.asset('assets/images/2.png', fit: BoxFit.fitHeight),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      columnPadding: const EdgeInsets.symmetric(
        vertical: 80,
      ),
      columnCrossAxisAlignment: CrossAxisAlignment.center,
      layout: ResponsiveRowColumnType.COLUMN,
      children: [
        ResponsiveRowColumnItem(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.blue,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(-1, -2),
                ),
                BoxShadow(
                  color: AppColors.red,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(5, 1),
                ),
                BoxShadow(
                  color: AppColors.red,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(2, 2),
                ),
                BoxShadow(
                  color: AppColors.blue,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(-4, -4),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.6,
            height: 400,
            child: CarouselSlider.builder(
              itemCount: sliderItems.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      sliderItems[itemIndex],
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: ResponsiveValue(context,
                    defaultValue: 0.5,
                    valueWhen: const [
                      Condition.smallerThan(name: TABLET, value: 0.7),
                      Condition.smallerThan(name: MOBILE, value: 1.0),
                    ]).value!,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                onPageChanged: (_, CarouselPageChangedReason) {},
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
