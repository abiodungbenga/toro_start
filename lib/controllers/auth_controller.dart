import 'dart:developer';

import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:get/get.dart';
import 'package:toro_start/base/basic_components.dart';
import 'package:toro_start/constants/app_constants.dart';
import 'package:toro_start/data/repo/auth_repo.dart';
import 'package:toro_start/entity/import_wallet_entity.dart';
import 'package:toronet/toronet.dart';
import '../entity/create_wallet_entity.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  Future<bool> get isLoggedIn => authRepo.isLoggedIn;

  Mutation<Wallet, CreateWalletEntity> createWallet() {
    return Mutation<Wallet, CreateWalletEntity>(
      key: AppConstants.createWallet,
      onSuccess: (res, arg) {
        authRepo.storeToken(res.address);
      },
      onError: (arg, error, fallback) {
        BasicComponents.showSnackBar(data: error.toString(),isError: true,snackBarType: SnackBarType.fail);
      },
      mutationFn: (data) async {
        final response = await authRepo.createWallet(
          password: data.password,
          username: data.username,
        );

        log("Create wallet response $response");
        return response;
      },
      // reload everything that starts with this key
      // invalidateQueries: ['posts'],
    );
  }
  Mutation<Wallet, ImportWalletEntity> importWallet() {
    return Mutation<Wallet, ImportWalletEntity>(
      key: AppConstants.importWallet,
      onSuccess: (res, arg) {
        authRepo.storeToken(res.address);
      },
      onError: (arg, error, fallback) {
        log("Import wallet error $error");
        BasicComponents.showSnackBar(data: error.toString(),isError: true,snackBarType: SnackBarType.fail);
      },
      mutationFn: (data) async {
        final response = await authRepo.importWallet(
          password: data.password,
          privateKey: data.privateKey,
        );

        log("Import wallet response $response");
        return response;
      },
      // reload everything that starts with this key
      // invalidateQueries: ['posts'],
    );
  }
}
