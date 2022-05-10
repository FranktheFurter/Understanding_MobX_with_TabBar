// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'ctabview_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CTabView(initialIndex: 0, tabs: [
            CTabItem(text: "Tab 1", body: Text("Body 1")),
            CTabItem(text: "Tab 2", body: Text("Body 2")),
            CTabItem(text: "Tab 3", body: Text("Body 3")),
            CTabItem(text: "Tab 4", body: Text("Body 4")),
            CTabItem(text: "Tab 5", body: Text("Body 5")),
            CTabItem(text: "Tab 6", body: Text("Body 6")),
            CTabItem(text: "Tab 7", body: Text("Body 7")),
            CTabItem(text: "Tab 8", body: Text("Body 8")),
            CTabItem(text: "Tab 9", body: Text("Body 9")),
          ]),
        ],
      ),
    );
  }
}

class CTabView extends StatefulWidget {
  final CTabViewState state = CTabViewState();
  final int initialIndex;
  List<CTabItem> tabs;
  CTabView({Key? key, required this.tabs, required this.initialIndex}) : super(key: key);

  @override
  State<CTabView> createState() => _CTabViewState();
}

class _CTabViewState extends State<CTabView> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    widget.state.activeIndex = widget.initialIndex;
    _controller = TabController(
      vsync: this,
      length: widget.tabs.length,
    )..addListener(_onTabChange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Column(
        children: [
          Center(
            child: TabBar(
              controller: _controller,
              isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: [
                for (var tab in widget.tabs) Tab(text: tab.text),
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    widget.state.activeIndex++;
                  },
                  child: Text("Next")),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget.tabs[widget.state.activeIndex].body,
          ),
        ],
      ),
    );
  }

  void _onTabChange() {
    widget.state.activeIndex = _controller.index;
  }
}

class CTabItem extends StatelessWidget {
  String text;
  Widget body;
  CTabItem({Key? key, required this.text, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(text: text);
  }
}
