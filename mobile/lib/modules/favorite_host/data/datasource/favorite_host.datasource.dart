import 'package:injectable/injectable.dart';
import 'package:mobile/common/constants/endpoints.dart';
import 'package:mobile/common/utils/dio/dio_provider.dart';
import 'package:mobile/modules/favorite_host/data/model/favorite_host.model.dart';

@lazySingleton
class FavoriteHostDataSource {
  Future<List<FavoriteHostModel>> getFavoriteHosts(String userId) async {
    final HttpRequestResponse response =
        await DioProvider.get('${Endpoints.getFavoriteHost}/$userId');

    if (response.statusCode == 204) {
      return [];
    }

    final List<FavoriteHostModel> result = (response.data as List<dynamic>)
        .map((element) => FavoriteHostModel.fromJson(element))
        .toList();

    return result;
  }

  Future<String> addFavoriteHost({
    required String userId,
    required String hostId,
  }) async {
    final HttpRequestResponse response = await DioProvider.post(
      Endpoints.addFavoriteHost,
      body: {
        'userId': userId,
        'hostId': hostId,
      },
    );

    return response.data['favoriteHostId'].toString();
  }

  Future<void> deleteFavoriteHost({
    required String favoriteId,
  }) async {
    await DioProvider.delete(
      '${Endpoints.favoriteHost}/$favoriteId',
    );
  }
}
