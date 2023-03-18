import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:med_o_care/Constant/colors.dart';
import 'package:med_o_care/Constant/constants.dart';
import 'package:med_o_care/View/Medicines/medicines_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List<Widget> _navigationScreens = [
    MedicinesPage(),
  ];

  List<NavigationItem> items = [
    NavigationItem(
        icon: SvgPicture.asset("assets/icons/icon _home_.svg"), title: "Home"),
    NavigationItem(
        icon: SvgPicture.asset("assets/icons/icon _clock_.svg"),
        title: "Reminder"),
    NavigationItem(
        icon: SvgPicture.asset("assets/icons/icon _document_.svg"),
        title: "Uploads"),
    NavigationItem(
        icon: SvgPicture.asset("assets/icons/icon _bar chart alt_.svg"),
        title: "Scores"),
    NavigationItem(
        icon: SvgPicture.asset("assets/icons/icon _user_.svg"),
        title: "My Profile"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/med-o-care.png",
                  height: 65,
                  width: 65,
                ),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/icon _menu_.svg"))
              ],
            ),
          ),
          Expanded(
            child: _navigationScreens[0],
          )
        ]),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 70.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(10)),
            color: ResourceColors.colorTertiaryLightTheme),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            var itemIndex = items.indexOf(item);
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = itemIndex;
                });
              },
              child: _buildItem(item, selectedIndex == itemIndex),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class NavigationItem {
  final Widget icon;
  final String title;

  NavigationItem({required this.icon, required this.title});
}

Widget _buildItem(NavigationItem item, bool isSelected) {
  return Container(
    height: 60.0,
    width: 60.0,
    child: Column(
      children: [
        if (isSelected)
          Card(
            borderOnForeground: false,
            elevation: 5,
            shadowColor: ResourceColors.colorPrimaryLightTheme,
            margin: EdgeInsets.zero,
            color: ResourceColors.colorPrimaryLightTheme,
            child: SizedBox(
              height: 5,
              width: 45,
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: item.icon,
        ),
        Text(
          item.title,
          style: TextStyle(fontSize: 10),
        )
      ],
    ),
  );
}
