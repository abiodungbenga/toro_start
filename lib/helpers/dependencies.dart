import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:toro_start/controllers/auth_controller.dart';
import 'package:toro_start/data/api/torro_client.dart';
import 'package:toro_start/data/repo/auth_repo.dart';

Future<void> init() async {
  // Secure storage
  final FlutterSecureStorage storage = FlutterSecureStorage(
    aOptions: const AndroidOptions(),
    iOptions: const IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  Get.lazyPut(() => storage, fenix: true);
  // Torro client
  Get.lazyPut(() => TorroClient(), fenix: true);
  // Repos
  Get.lazyPut(() => AuthRepo(torroClient: Get.find(), storage: Get.find()), fenix: true, );
  // Controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()), fenix: true);
}
