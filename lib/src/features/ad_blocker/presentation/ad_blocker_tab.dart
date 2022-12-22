import 'package:flutter/material.dart';

class AdBlockerTab extends StatefulWidget {
  const AdBlockerTab({super.key});

  @override
  State<AdBlockerTab> createState() => _AdBlockerTabState();
}

class _AdBlockerTabState extends State<AdBlockerTab>
    with SingleTickerProviderStateMixin {
  static const tabDecoration = BoxDecoration(
      color: Color(0xFFDEDCDC),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)));

  final List<Tab> tabs = <Tab>[
    Tab(
      child: Container(
          decoration: tabDecoration,
          child: Align(
            alignment: Alignment.center,
            child: Text('24時間'),
          )),
    ),
    Tab(
      child: Container(
          decoration: tabDecoration,
          child: Center(
            child: Text('前日'),
          )),
    )
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(controller: _tabController, tabs: tabs),
        TabBarView(children: [])
      ],
    );
  }
}
