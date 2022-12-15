import 'package:injectable/injectable.dart';
import 'package:mobile/common/constants/endpoints.dart';
import 'package:mobile/common/utils/dio/dio_provider.dart';
import 'package:mobile/modules/favorite_host/data/model/favorite_host.model.dart';

@lazySingleton
class FavoriteHostDataSource {
  Future<List<FavoriteHostModel>> getFavoriteHosts(String userId) async {
    final HttpRequestResponse response =
        await DioProvider.get('${Endpoints.favoriteHost}/user/$userId');

    final List<FavoriteHostModel> result = response.data
        .map((element) => FavoriteHostModel.fromJson(element))
        .toList();

    return result;
  }
}
