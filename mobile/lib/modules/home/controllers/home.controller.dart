import 'package:get/get.dart';
import 'package:mobile/modules/home/data/repositories/user.repository.dart';

class HomeController extends GetxController {
  final UserRepository userRepository;

  HomeController({required this.userRepository});
}
