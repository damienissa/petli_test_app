class ResultType<V> {
  V? _success;
  Exception? _failure;
  Error? _error;

  ResultType.success(V value) : _success = value;
  ResultType.failure(Exception failure) : _failure = failure;
  ResultType.error(Error error) : _error = error;

  ResultType<V> onSuccess(Function(V value) completion) {
    if (_success != null) {
      completion(_success!);
    }
    return this;
  }

  ResultType<V> catchError(Function(dynamic exception) completion) {
    if (_failure != null) {
      completion(_failure!);
    } else if (_error != null) {
      completion(_error);
    }

    return this;
  }
}
