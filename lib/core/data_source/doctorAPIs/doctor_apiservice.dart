import 'package:dio/dio.dart';
import 'package:health_tech/features/doctors/models/doctor_response.dart';
import 'package:retrofit/http.dart';

part 'doctor_apiservice.g.dart';

Dio createDio() {
  final dio = Dio();
  dio.options.headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL3JlZ2lzdGVyIiwiaWF0IjoxNzc4NDI5NjkwLCJleHAiOjE3Nzg1MTYwOTAsIm5iZiI6MTc3ODQyOTY5MCwianRpIjoiVU5xOTljZ2F3MjU5ZjZUWSIsInN1YiI6IjY5OTciLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.Hm2ThsBKKQVyOq2JgUYo5IUPoZ7k2hppjAf7cby7Zyc',
    'Accept': 'application/json',
  };
  return dio;
}

@RestApi(baseUrl: 'https://vcare.integration25.com/api')
abstract class DoctorApiService {
  factory DoctorApiService(Dio dio, {String baseUrl}) = _DoctorApiService;

  @GET('/doctor/index')
  Future<DoctorResponse> getDoctors();
}
