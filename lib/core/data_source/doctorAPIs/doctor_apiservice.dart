import 'package:dio/dio.dart';
import 'package:health_tech/features/doctors/models/doctor_response.dart';
import 'package:retrofit/http.dart';

part 'doctor_apiservice.g.dart';

Dio createDio() {
  final dio = Dio();
  dio.options.headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL3JlZ2lzdGVyIiwiaWF0IjoxNzc4NjA0MDEyLCJleHAiOjE3Nzg2OTA0MTIsIm5iZiI6MTc3ODYwNDAxMiwianRpIjoiUFdvOG56c1VxOU5MMlhoWSIsInN1YiI6IjcwMDQiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.aHt0EouVKVV-lLgpMemq6Inr3IENXt01EdNcJCdbHyI',
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
