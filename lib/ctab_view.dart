// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'ctab_item.dart';
import 'ctabview_state.dart';

class CTabView extends StatefulWidget {
  final CTabViewState state;
  final int initialIndex;
  Function? onPopScope;
  CTabView({Key? key, required List<CTabItem> tabs, required this.initialIndex, required this.state, this.onPopScope}) : super(key: key) {
    state.tabs = tabs;
  }

  @override
  State<CTabView> createState() => _CTabViewState();
}

class _CTabViewState extends State<CTabView> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    widget.state.activeIndex = widget.initialIndex;
    widget.state.controller = TabController(
      vsync: this,
      length: widget.state.tabs?.length ?? 0,
      initialIndex: widget.state.activeIndex,
    )..addListener(_onTabChange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.state.tabs?[widget.state.activeIndex].onPopScope?.call();
        widget.onPopScope?.call();
        return true;
      },
      child: Observer(
        builder: (context) => Column(
          children: [
            Center(
              child: widget.state.tabsHidden
                  ? Container()
                  : TabBar(
                      controller: widget.state.controller,
                      isScrollable: true,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      labelPadding: EdgeInsets.all(0),
                      tabs: [
                        //for (var tab in widget.state.tabs ?? []) Tab(text: tab.text),
                        for (int i = 0; i < widget.state.tabs!.length; i++) _makeTab(i, widget.state.tabs![i]),
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget.state.tabs?[widget.state.activeIndex].body,
            ),
          ],
        ),
      ),
    );
  }

  void _onTabChange() {
    widget.state.tabs?[widget.state.activeIndex].onPopScope?.call();

    bool tabEnabled = widget.state.tabs![widget.state.controller.index].state.isEnabled;
    bool tabVisible = widget.state.tabs![widget.state.controller.index].state.isVisible;

    if (tabEnabled && tabVisible) {
      //animate to Tab
      widget.state.activeIndex = widget.state.controller.index;
    } else {
      //restore previous active tab
      widget.state.controller.index = widget.state.activeIndex;
    }
  }

  _makeTab(int i, CTabItem cTabItem) {
    if (!widget.state.tabs![i].state.isVisible) {
      return Container();
    } else if (!widget.state.tabs![i].state.isEnabled) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Tab(
          child: Text(cTabItem.text, style: TextStyle(color: Colors.grey.withOpacity(0.33))),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Tab(
          text: cTabItem.text,
        ),
      );
    }
  }
}
