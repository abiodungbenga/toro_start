import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:toro_start/constants/app_constants.dart';
import 'package:toro_start/data/api/torro_client.dart';
import 'package:toronet/toronet.dart';

class AuthRepo {
  final TorroClient torroClient;
  final FlutterSecureStorage storage;

  AuthRepo({required this.torroClient, required this.storage});

  void storeToken(String token) async {
    await storage.write(key: AppConstants.walletAddressKey, value: token);
  }

  Future<bool> get isLoggedIn => storage.containsKey(key: AppConstants.walletAddressKey);



  Future<Wallet> createWallet({String? username, String? password}) => torroClient.createWallet(username: username, password: password);

  Future<Wallet> importWallet({String? privateKey, String? password}) => torroClient.importWallet(privateKey: privateKey, password: password);



}