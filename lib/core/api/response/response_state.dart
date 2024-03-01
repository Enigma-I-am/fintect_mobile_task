class RequestState<T> {
  late RequestStatus status;
  T? data;
  late String message;
  RequestState.idle() : status = RequestStatus.IDLE;

  RequestState.loading(this.message) : status = RequestStatus.LOADING;

  RequestState.completed(this.data) : status = RequestStatus.COMPLETED;

  RequestState.error(this.message) : status = RequestStatus.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

// ignore: constant_identifier_names
enum RequestStatus { LOADING, COMPLETED, ERROR, IDLE }
