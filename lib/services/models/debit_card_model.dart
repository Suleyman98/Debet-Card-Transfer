class DebitCardModel {
  final String cardNumber;
  final String cardHolderName;
  final String expirationDate;
  final String cvv;
  double balance;

  DebitCardModel({
    required this.balance,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expirationDate,
    required this.cvv,
  });

  Map<String, dynamic> toJson() {
    return {
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
      'expirationDate': expirationDate,
      'cvv': cvv,
      'balance': balance,
    };
  }

  factory DebitCardModel.fromJson(Map<String, dynamic> json) {
    return DebitCardModel(
      balance: json['balance'] ?? 0.0,
      cardNumber: json['cardNumber'] ?? '',
      cardHolderName: json['cardHolderName'] ?? '',
      expirationDate: json['expirationDate'] ?? '',
      cvv: json['cvv'] ?? '',
    );
  }
}
