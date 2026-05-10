import 'package:health_tech/features/doctors/models/doctor_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctor_response.g.dart';
@JsonSerializable()
class DoctorResponse {
  final bool status;
  final String message;
  final List<DoctorModel> data;
  final int code;
  DoctorResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.code,
  });
  factory DoctorResponse.fromJson(Map<String, dynamic> json) => _$DoctorResponseFromJson(json);
}
