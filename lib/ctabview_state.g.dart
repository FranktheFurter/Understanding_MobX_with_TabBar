// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ctabview_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CTabViewState on _CTabViewState, Store {
  late final _$activeIndexAtom =
      Atom(name: '_CTabViewState.activeIndex', context: context);

  @override
  int get activeIndex {
    _$activeIndexAtom.reportRead();
    return super.activeIndex;
  }

  @override
  set activeIndex(int value) {
    _$activeIndexAtom.reportWrite(value, super.activeIndex, () {
      super.activeIndex = value;
    });
  }

  late final _$tabsHiddenAtom =
      Atom(name: '_CTabViewState.tabsHidden', context: context);

  @override
  bool get tabsHidden {
    _$tabsHiddenAtom.reportRead();
    return super.tabsHidden;
  }

  @override
  set tabsHidden(bool value) {
    _$tabsHiddenAtom.reportWrite(value, super.tabsHidden, () {
      super.tabsHidden = value;
    });
  }

  @override
  String toString() {
    return '''
activeIndex: ${activeIndex},
tabsHidden: ${tabsHidden}
    ''';
  }
}
