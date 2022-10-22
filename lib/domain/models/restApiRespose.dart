class RestApiResponse {
  late bool success;
  late int code;
  late String message;
  late dynamic payload;
  bool pagination = false;



  RestApiResponse({
    required this.success,
    required this.code,
    required this.message,
    required this.payload,
    required this.pagination,
  });

  factory RestApiResponse.fromJson(Map<String, dynamic> json) => RestApiResponse(
    success: json["success"] ?? false,
    code: json["code"] ?? 500,
    message: json["message"] ?? "",
    payload: json["payload"],
    pagination: json["recordCount"] != null ? true : false,
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
    "payload": payload
  };

}