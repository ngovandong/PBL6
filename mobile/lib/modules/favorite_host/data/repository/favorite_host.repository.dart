import 'package:injectable/injectable.dart';
import 'package:mobile/modules/favorite_host/data/datasource/favorite_host.datasource.dart';
import 'package:mobile/modules/favorite_host/data/model/favorite_host.model.dart';

@lazySingleton
class FavoriteHostRepository {
  final FavoriteHostDataSource dataSource;

  FavoriteHostRepository({required this.dataSource});

  Future<List<FavoriteHostModel>> getFavoriteHosts(String userId) {
    return dataSource.getFavoriteHosts(userId);
  }

  Future<String> addFavoriteHost({
    required String userId,
    required String hostId,
  }) {
    return dataSource.addFavoriteHost(userId: userId, hostId: hostId);
  }

  Future<void> deleteFavoriteHost({
    required String favoriteId,
  }) {
    return dataSource.deleteFavoriteHost(favoriteId: favoriteId);
  }
}
