// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:testzone/ctab_item.dart';

part 'ctabview_state.g.dart';

class CTabViewState = _CTabViewState with _$CTabViewState;

abstract class _CTabViewState with Store {
  late TabController controller;

  @observable
  int activeIndex = 0;

  @observable
  bool tabsHidden = false;

  List<CTabItem>? tabs = [];

  void setTabIndex(int index) {
    var oldIndex = activeIndex;
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;
    if (index < 0) {
      activeIndex = 0;
    } else if (index >= tabs!.length) {
      activeIndex = tabs!.length - 1;
    } else {
      activeIndex = index;
    }

    if (oldIndex != activeIndex) {
      if (!tabs![activeIndex].state.isEnabled || !tabs![activeIndex].state.isVisible) {
        activeIndex = oldIndex;
        return;
      }
    }
    controller.animateTo(activeIndex);
  }

  void _moveIndexByOne(bool loop, int dir) {
    if (tabs == null) return;
    if (tabs?.isEmpty ?? true) return;

    // Check wether a selectable tab is present in tab list
    bool noValidFound = tabs?.any((t) => !t.state.isEnabled || !t.state.isVisible) ?? false;
    if (noValidFound) return;
    if (loop) {
      while (true) {
        activeIndex += dir;
        if (activeIndex >= tabs!.length) {
          activeIndex = 0;
        }
        if (activeIndex < 0) {
          activeIndex = tabs!.length - 1;
        }
        if (!tabs![activeIndex].state.isEnabled || !tabs![activeIndex].state.isVisible) {
          continue;
        }
        setTabIndex((activeIndex) % tabs!.length);
        return;
      }
    } else {
      var oldIndex = activeIndex;
      while (true) {
        activeIndex += dir;
        if (activeIndex >= tabs!.length) {
          activeIndex = oldIndex;
        }
        if (activeIndex < 0) {
          activeIndex = oldIndex;
        }

        if (!tabs![activeIndex].state.isEnabled || !tabs![activeIndex].state.isVisible) {
          continue;
        }

        setTabIndex((activeIndex) % tabs!.length);
        return;
      }
    }
  }

  void nextIndex({bool loop = true}) {
    _moveIndexByOne(loop, 1);
  }

  void prevIndex({bool loop = true}) {
    _moveIndexByOne(loop, -1);
  }

  void toggleTabs() {
    tabsHidden = !tabsHidden;
  }

  void enableAll() {
    tabs!.forEach((item) {
      item.state.enable();
    });
  }

  void disableAll() {
    tabs!.forEach((item) {
      item.state.disable();
    });
  }

  void hideAll() {
    tabs!.forEach((item) {
      item.state.hide();
    });
  }

  void showAll() {
    tabs!.forEach((item) {
      item.state.show();
    });
  }

  void showItem(int index) {
    if (index < 0) return;
    if (index >= tabs!.length) return;
    tabs![index].state.show();
  }

  void hideItem(int index) {
    if (index < 0) return;
    if (index >= tabs!.length) return;
    tabs![index].state.hide();
  }

  void enableItem(int index) {
    if (index < 0) return;
    if (index >= tabs!.length) return;
    tabs![index].state.enable();
  }

  void disableItem(int index) {
    if (index < 0) return;
    if (index >= tabs!.length) return;
    tabs![index].state.disable();
  }
}
