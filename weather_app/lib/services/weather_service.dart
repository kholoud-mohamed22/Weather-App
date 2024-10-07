import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService{

  final Dio dio;

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
   try {
     Response response= await dio.get('https://api.weatherapi.com/v1/forecast.json?key=ab5c59b7259a4014bdb151150240102&q=$cityName&days=1');

     WeatherModel weatherModel=WeatherModel.fromJson(response.data);

     return weatherModel;
   } on DioException catch (e) {

     final String errorMessage = e.response?.data['error']['message']??'try later';
     throw Exception(errorMessage);
   }catch(e)
    {
      throw Exception('oops,try later');
    }
  }

}