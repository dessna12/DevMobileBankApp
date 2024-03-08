import 'package:bankenstein/data/wallet_data_source.dart';
import 'package:bankenstein/models/wallet.dart';
import 'package:bankenstein/service/authentication_service.dart';

abstract class WalletService {
  static Future<List<WalletModel>> getWallet() async {
    final authenticationService =
        AuthenticationServiceImpl(); // Instancier AuthenticationService
    final String? token = await authenticationService
        .getToken(); // Utiliser l'instance pour appeler getToken()

    final walletJson = await WalletDataSource.walletDataSource(token!);

    return walletJson.map((e) => WalletModel.fromJson(e)).toList();
  }
}
