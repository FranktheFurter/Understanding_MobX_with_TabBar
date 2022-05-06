// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
  const MyHomePage({super.key});
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
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              OutlinedButton(
                onPressed: () {},
                child: Text("<"),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text("Hide Tabbar"),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text(">"),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class CTabView extends StatefulWidget {
  final int initialIndex;
  List<CTabItem> tabs;
  CTabView({super.key, required this.tabs, required this.initialIndex});

  @override
  State<CTabView> createState() => _CTabViewState();
}

class _CTabViewState extends State<CTabView> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      vsync: this,
      length: widget.tabs.length,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      if (_controller.indexIsChanging) {
        setState(() {
          _activeIndex = _controller.index;
        });
      }
    });

    return Column(
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.tabs[_activeIndex].body,
        ),
      ],
    );
  }
}

class CTabItem extends StatelessWidget {
  String text;
  Widget body;
  CTabItem({super.key, required this.text, required this.body});

  @override
  Widget build(BuildContext context) {
    return Tab(text: text);
  }
}

// State


// Logic and UI

