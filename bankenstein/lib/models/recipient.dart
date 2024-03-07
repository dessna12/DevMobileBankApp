class RecipientModel{
  final int id;
  final int account_id;
  final int user_id;
  final String name;
  final String iban;

  RecipientModel({
    required this.id,
    required this.account_id,
    required this.user_id,
    required this.name,
    required this.iban,
  });

factory RecipientModel.fromJson(Map<String, dynamic> json) => RecipientModel(
    id: json['id'] as int,
    account_id: json['account_id'] as int,
    user_id: json['user_id'] as int,
    name: json['name'] as String,
    iban: json['iban'] as String,
  );
}