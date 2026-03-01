import 'package:get/get.dart';
import 'package:toronet/toronet.dart';

class TorroClient extends GetxService {
  final ToronetSDK sdk = ToronetSDK(network: Network.testnet);

  Future<Wallet> createWallet({String? username, String? password}) => sdk
      .walletService
      .createWallet(username: username ?? "", password: password ?? "");

  Future<Map<String, dynamic>> transferCurrency({
    String? from,
    String? fromP,
    String? to,
    Currency? currency,
    String? amount,
  }) => sdk.currencyService.transferCurrency(
    currency: currency ?? Currency.naira,
    amount: amount ?? "",
    from: from ?? "",
    fromPassword: fromP ?? "",
    to: to ?? "",
  );
  Future<Map<String, dynamic>> getTransactionFees({
    Currency? currency,
    String? amount,
  }) => sdk.currencyService.getTransactionFee(
    currency: currency ?? Currency.naira,
    amount: amount ?? "",
  );

  Future<Wallet> importWallet({String? privateKey, String? password}) =>
      sdk.walletService.importWalletFromPrivateKey(
        privateKey: privateKey ?? "",
        password: password ?? "",
      );

  Future<Map<String, dynamic>> getWalletBalance({String? address}) =>
      sdk.balanceService.getBalance(address: address ?? "");
  Future<List<Map<String, dynamic>>> getTransaction({
    String? address,
    int? count,
  }) => sdk.queryService.getAddrTransactionsNaira(
    addr: address ?? '',
    count: count ?? 10,
  );
  Future<Map<String, dynamic>> getReciept({String? hash}) =>
      sdk.queryService.getReceipt(hash: hash ?? '');
  Future<List<Map<String, dynamic>>> getAddressTransaction({
    String? address,
    int? count,
  }) => sdk.queryService.getAddrTransactions(
    addr: address ?? "",
    count: count ?? 0,
  );
}
