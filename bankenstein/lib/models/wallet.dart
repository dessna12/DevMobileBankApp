class WalletModel {
  final int id;
  final int userId;
  final String name;
  final int balance;
  final String iban;

  WalletModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.balance,
    required this.iban,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
        id: json['id'] as int,
        userId: json['user_id'] as int,
        name: json['name'] as String,
        balance: json['balance'] as int,
        iban: json['iban'] as String,
      );
}
