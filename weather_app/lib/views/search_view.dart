import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child:  TextField(
            onSubmitted: (value) async{

              var getWeatherCubit=BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
              },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 16),
              labelText: 'Search',
              hintText: 'Enter City Name',
              suffixIcon:Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),

              )
            ) ,
          ),
        ),
      ),
    );
  }
}
