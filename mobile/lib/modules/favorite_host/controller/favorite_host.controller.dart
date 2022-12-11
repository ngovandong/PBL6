import 'package:get/get.dart';
import 'package:mobile/modules/favorite_host/data/repository/favorite_host.repository.dart';

class FavoriteHostController extends GetxController {
  final FavoriteHostRepository favoriteHostRepository;

  FavoriteHostController({
    required this.favoriteHostRepository,
  });
}
