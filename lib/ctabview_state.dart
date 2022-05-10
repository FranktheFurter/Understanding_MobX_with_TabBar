import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'ctabview_state.g.dart';

class CTabViewState = _CTabViewState with _$CTabViewState;

abstract class _CTabViewState with Store {
  late TabController controller;

  @observable
  int activeIndex = 0;

  @observable
  bool isVisible = true;

  @observable
  bool isEnabled = true;

  late TabController _controller;

  void nextIndex() {
    activeIndex++;
    controller.animateTo(activeIndex);
  }
}
