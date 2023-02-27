import 'package:freezed_annotation/freezed_annotation.dart';

part 'modelresponse.freezed.dart';
part 'modelresponse.g.dart';

@freezed
class ModelResponse with _$ModelResponse{
  const factory ModelResponse({
  required String? error,
  required dynamic data, 
  required String? message, 
  }) = _ModelResponse; 

  factory ModelResponse.fromJson(Map<String, dynamic> json) => _$ModelResponseFromJson(json); 
}