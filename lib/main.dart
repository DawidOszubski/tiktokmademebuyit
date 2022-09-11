import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tiktokmademebuyit/widgets/app_bar_drawer_widget.dart';
import 'package:tiktokmademebuyit/widgets/app_bar_widget.dart';

import 'constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: const [
          ResponsiveBreakpoint.autoScale(350, name: "XS"),
          ResponsiveBreakpoint.resize(600, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1600, name: "XL"),
        ],
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return TooltipVisibility(
      visible: false,
      child: Scaffold(
        drawer: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? const AppBarDrawerWidget()
            : null,
        appBar: AppBar(
          elevation: 20,
          toolbarHeight: 70,
          backgroundColor: AppColors.black,
          flexibleSpace: const AppBarWidget(),
        ),
        body: Container(
          width: double.infinity,
          color: AppColors.black,
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
