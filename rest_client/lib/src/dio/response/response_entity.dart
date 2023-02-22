class ResponseEntity<T> {
  final T? response;
  final List<dynamic>? errorList;
  final String? message;

  ResponseEntity(
    this.message,
    this.errorList, {
    required this.response,
  });

  factory ResponseEntity.fromJson({
    String rootNode = 'Data',
    required Map<String, dynamic>? json,
    required T Function(Map<String, dynamic> o) fromJson,
  }) {
    return ResponseEntity(
      json?['Message'] ?? '',
      json?['ErrorList'],
      response: fromJson(json?[rootNode] ?? {}),
    );
  }

  factory ResponseEntity.withError({required String message}) {
    print(message);
    return ResponseEntity(
      '',
      [message],
      response: null,
    );
  }
}
