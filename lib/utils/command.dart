

import 'package:flutter/material.dart';
import 'package:sample_app/utils/results.dart';

typedef CommandAction0<T> = Future<Result<T>> Function();
typedef CommandAction1<T, A> = Future<Result<T>> Function(A);

abstract class Command<T> extends ChangeNotifier {
  Command();

  // true when action is running
  bool _running = false;

  Result<T>? _result;

  /// true if action completed with error
  bool get error => _result is Error;

  /// true if action is completed  successfully
  bool get completed => _result is Ok;

  /// get last action result
  Result? get result => _result;

  void clearResult() {
    _result = null;
    notifyListeners();
  }

  Future<void> _execute(CommandAction0<T> action) async {
    if (_running) return;
    
    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }

  }
}

class Command0<T> extends Command<T> {
  Command0(this._action);

  final CommandAction0<T> _action;

  Future<void> execute() async {
    await _execute(_action);
  }
}

class Command1<T, A> extends Command<T> {
  Command1(this._action);

  final CommandAction1<T, A> _action;

  Future<void> execute(A argument) async {
    await _execute(() => _action(argument));
  }
}
