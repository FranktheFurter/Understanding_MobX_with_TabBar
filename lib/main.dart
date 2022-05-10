// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testzone/ctab_item_state.dart';

import 'ctab_item.dart';
import 'ctab_view.dart';
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
  final cTabViewState = CTabViewState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CTabView(initialIndex: 0, state: cTabViewState, tabs: [
            CTabItem(text: "Tab 1", body: Column(children: [Text("Body 1")])),
            CTabItem(text: "Tab 2", body: Column(children: [Text("Body 2")])),
            CTabItem(text: "Tab 3", body: Text("Body 3")),
            CTabItem(text: "Tab 4", body: Text("Body 4")),
            CTabItem(text: "Tab 5", body: Text("Body 5")),
            CTabItem(text: "Tab 6", body: Text("Body 6")),
            CTabItem(text: "Tab 7", body: Text("Body 7")),
            CTabItem(text: "Tab 8", body: Text("Body 8")),
            CTabItem(text: "Tab 9", body: Text("Body 9")),
            //todo
            CTabItem(text: "Tab hidden", body: Text("Body 10")),
          ]),
          Spacer(),
          ButtonBar(alignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: () {
                cTabViewState.prevIndex();
              },
              child: Text("<="),
            ),
            ElevatedButton(
              onPressed: () {
                cTabViewState.nextIndex();
              },
              child: Text("=>"),
            ),
            ElevatedButton(
              onPressed: () {
                cTabViewState.setTabIndex(3);
              },
              child: Text("goto 4"),
            ),
            //todo
            ElevatedButton(
              onPressed: () {
                cTabViewState.toggleTabs();
              },
              child: Text("toggle"),
            ),
            ElevatedButton(
              onPressed: () {
                cTabViewState.disableItem(1);
              },
              child: Text("dis 2"),
            ),
            ElevatedButton(
              onPressed: () {
                cTabViewState.enableItem(1);
              },
              child: Text("en 2"),
            ),
            ElevatedButton(
              onPressed: () {
                cTabViewState.hideItem(3);
              },
              child: Text("hide 4"),
            ),
            ElevatedButton(
              onPressed: () {
                cTabViewState.showItem(3);
              },
              child: Text("hide 4"),
            ),
          ]),
        ],
      ),
    );
  }
}
