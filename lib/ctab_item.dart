// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'ctab_item_state.dart';

class CTabItem extends StatelessWidget {
  String text;
  Widget body;
  Function? onPopScope;
  CTabItemState state = CTabItemState();
  CTabItem({Key? key, required this.text, required this.body, this.onPopScope}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(text: text);
  }
}
