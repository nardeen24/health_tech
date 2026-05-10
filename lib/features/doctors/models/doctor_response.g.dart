// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorResponse _$DoctorResponseFromJson(Map<String, dynamic> json) =>
    DoctorResponse(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: (json['code'] as num).toInt(),
    );
