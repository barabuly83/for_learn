import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_local_data_source.dart';
import '../datasources/weather_remote_data_source.dart';

/// Реализация репозитория погоды
/// Координирует работу между удаленным и локальным источниками данных
/// Предоставляет единообразный доступ к данным для доменного слоя
class WeatherRepositoryImpl implements WeatherRepository {
  const WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;

  @override
  Future<Either<Failure, Weather>> getWeatherByCity(String city) async {
    try {
      // Сначала пытаемся получить данные из кэша
      final cachedWeather = await localDataSource.getCachedWeather(city);
      if (cachedWeather != null) {
        return Right(cachedWeather.toEntity());
      }

      // Если кэша нет, получаем данные из API
      final weatherModel = await remoteDataSource.getWeatherByCity(city);
      
      // Сохраняем в кэш для будущего использования
      await localDataSource.cacheWeather(weatherModel);
      
      return Right(weatherModel.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Weather>>> getWeatherForecast(String city) async {
    try {
      // Сначала пытаемся получить данные из кэша
      final cachedForecast = await localDataSource.getCachedForecast(city);
      if (cachedForecast.isNotEmpty) {
        return Right(cachedForecast.map((model) => model.toEntity()).toList());
      }

      // Если кэша нет, получаем данные из API
      final forecastModels = await remoteDataSource.getWeatherForecast(city);
      
      // Сохраняем в кэш для будущего использования
      await localDataSource.cacheForecast(city, forecastModels);
      
      return Right(forecastModels.map((model) => model.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
