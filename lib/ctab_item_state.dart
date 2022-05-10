import 'package:mobx/mobx.dart';

part 'ctab_item_state.g.dart';

class CTabItemState = _CTabviewStateBase with _$CTabItemState;

abstract class _CTabviewStateBase with Store {
  @observable
  bool isEnabled = true;

  @observable
  bool isVisible = true;

  void enable() {
    isEnabled = true;
  }

  void disable() {
    isEnabled = false;
  }

  void show() {
    isVisible = true;
    isEnabled = true;
  }

  void hide() {
    isVisible = false;
    isEnabled = false;
  }
}
