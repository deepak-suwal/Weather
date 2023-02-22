class ResponseEntityList<T> {
  final List<T>? response;
  final List<String>? errorList;
  final String? message;

  ResponseEntityList(
    this.message,
    this.errorList, {
    required this.response,
  });

  factory ResponseEntityList.fromJson(
      {String rootNode = 'Data',
      dynamic json,
      required T Function(Map<String, dynamic> o) fromJson}) {
    if (json == null || json.isEmpty == null || json[rootNode] == null) {
      return ResponseEntityList.withError('No data found');
    }
    if (json[rootNode] is! List) {
      return ResponseEntityList.withError('Invalid data');
    }
    return ResponseEntityList(
      '',
      [],
      response: List<T>.from(json[rootNode].map((x) => fromJson(x))),
    );
  }

  factory ResponseEntityList.fromEntityList(List<T> t) {
    return ResponseEntityList(
      '',
      [],
      response: t,
    );
  }

  factory ResponseEntityList.withError(String errorValue) {
    return ResponseEntityList(
      errorValue,
      [],
      response: <T>[],
    );
  }
}
