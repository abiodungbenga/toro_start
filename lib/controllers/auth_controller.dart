import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:get/get.dart';
import 'package:toro_start/constants/app_constants.dart';
import 'package:toro_start/data/repo/auth_repo.dart';
import 'package:toronet/toronet.dart';
import '../entity/create_wallet_entity.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  Mutation<Wallet, CreateWalletEntity> createWallet() {
    return Mutation<Wallet, CreateWalletEntity>(
      key: AppConstants.createWallet,
      mutationFn: (data) async {
        final response = await authRepo.createWallet(
          password: data.password,
          username: data.username,
        );
        return response;
      },
      // reload everything that starts with this key
      // invalidateQueries: ['posts'],
    );
  }
}
