import 'package:flutter/material.dart' hide Action;
import 'package:rebloc/rebloc.dart';

abstract class MkDispatchProvider<T> {
  BuildContext get context;

  void dispatchAction(Action action) => StoreProvider.of<T>(context).dispatch(action);
}
