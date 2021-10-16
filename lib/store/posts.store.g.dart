// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostsStore on _PostsStore, Store {
  final _$isLoadingAtom = Atom(name: '_PostsStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_PostsStoreActionController = ActionController(name: '_PostsStore');

  @override
  dynamic loadPosts() {
    final _$actionInfo = _$_PostsStoreActionController.startAction(
        name: '_PostsStore.loadPosts');
    try {
      return super.loadPosts();
    } finally {
      _$_PostsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
