// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Task on TaskBase, Store {
  late final _$titleAtom = Atom(name: 'TaskBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$isCompletedAtom = Atom(
    name: 'TaskBase.isCompleted',
    context: context,
  );

  @override
  bool get isCompleted {
    _$isCompletedAtom.reportRead();
    return super.isCompleted;
  }

  @override
  set isCompleted(bool value) {
    _$isCompletedAtom.reportWrite(value, super.isCompleted, () {
      super.isCompleted = value;
    });
  }

  late final _$TaskBaseActionController = ActionController(
    name: 'TaskBase',
    context: context,
  );

  @override
  void toggleCompleted() {
    final _$actionInfo = _$TaskBaseActionController.startAction(
      name: 'TaskBase.toggleCompleted',
    );
    try {
      return super.toggleCompleted();
    } finally {
      _$TaskBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
isCompleted: ${isCompleted}
    ''';
  }
}
