class Failure {
  int code;
  String message;

  Failure(this.code, this.message);
}

class OfflineFailure extends Failure {
  OfflineFailure(super.code, super.message);
}

class DataEmptyFailure extends Failure {
  DataEmptyFailure(super.code, super.message);
}
