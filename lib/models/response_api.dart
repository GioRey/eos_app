import 'dart:convert';

ResponseApi responseApiFromJson(String str) =>
    ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {
  String code;
  String message;
  dynamic response;

  ResponseApi({
    this.code,
    this.message,
  });

  ResponseApi.fromJson(Map<String, dynamic> json) {
    code = json["Code"];
    message = json["Message"];

    try {
      response = json['Response'];
    } catch (e) {
      print('Exception data $e');
    }
  }

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Message": message,
      };
}
