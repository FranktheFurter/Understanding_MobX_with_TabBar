import 'package:mobx/mobx.dart';

part 'ctabview_state.g.dart';

class CTabViewState = _CTabViewState with _$CTabViewState;

abstract class _CTabViewState with Store {
  @observable
  int activeIndex = 0;
}
