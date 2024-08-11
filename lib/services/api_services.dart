import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.246.234:3000/api',
    headers: {'Content-Type': 'application/json'},
    validateStatus: (status) {
      return status! < 500;
    },
  ));

  Future<Response> register(String name, String email, String password) async {
    // return await _dio.post('/register', data: {
    //   'name': name,
    //   'email': email,
    //   'password': password,
    //   'password_confirmation': password,
    // });

    // try {
    var user = await Dio().post('http://192.168.246.234:3000/api/register',
        data: {'name': name, 'email': email, 'password': password});
    // if registered successfull, return true
    return user;
    // } catch (error) {
    //   return error;
    // }
  }

  Future<Response> login(String email, String password) async {
    return await _dio.post('/login', data: {
      'email': email,
      'password': password,
    });
  }

  Future<Response> saveLocation(
      double latitude, double longitude, String token) async {
    return await _dio.post('/save-location',
        data: {
          'latitude': latitude,
          'longitude': longitude,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
  }

  Future<Response> getData(String token) async {
    return await _dio.get('/data',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
  }
}
