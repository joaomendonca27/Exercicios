import 'package:app/pages/home/domain/error/failure.dart';
import 'package:app/pages/home/domain/models/games.dart';
import 'package:dio/dio.dart';

abstract class IGamesRepository {
  Future<List<Games>> getAllGames();
}

class GamesRepository implements IGamesRepository {
  final Dio dio;

  GamesRepository({required this.dio});

  @override
  Future<String> getToken() async {
    try {
      final response = await dio.post('https://id.twitch.tv/oauth2/token?client_id=zzwvkc0qt6rc34jey06a8l2al6lnf0&client_secret=96zbdmxr9r39mv6j3derz96rquls3s&grant_type=client_credentials');
      final json = response.data;
      var token = json['access_token'];
      return token;
    } catch (e) {
      throw Failure();
    }
  }
  @override
  Future<List<Games>> getAllGames() async {
    try {
      var token = await getToken();
      final String clientid = "zzwvkc0qt6rc34jey06a8l2al6lnf0";
      final response = await dio.post('https://api.igdb.com/v4/games/', data: 'fields summary, url, name, id; where platforms = [48,49,6]; limit 10;', options: Options(
        headers: {
          'Authorization': 'bearer $token',
          "access_token": token,
          "Client-ID": clientid,
        },
      ),);
      final json = response.data;
      final list = json as List<dynamic>;
      return list.map((e) => Games.fromMap(e)).toList();
    } catch (e) {
      throw Failure();
    }
  }
}
