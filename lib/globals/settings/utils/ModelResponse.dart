import 'dart:convert';
import 'dart:math';

class ModelResponse {
  ModelResponse({this.error, this.data, this.message}); 

  final dynamic error; 
  final dynamic data; 
  final dynamic message; 

  Map<String, dynamic> toJson () => 
      {'error': error ?? '', 'data': data ?? '', 'message': message ?? ''}; 

  factory ModelResponse.fromJson(Map<String, dynamic> json) {
    final error = json['error']; // cast as non-nullable String
    final data = json['data']; // cast as non-nullable String
    final message = data['message']; // cast as nullable int
    return ModelResponse(error: error, data: data, message: message);
  }
}