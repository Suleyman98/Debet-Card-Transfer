import 'package:debet_card_transfer/services/models/debit_card_model.dart';

class UserModel {
  final String id;
  final String name;
  final String surname;
  final String birthDate;
  final String gsmNumber;
  DebitCardModel debitCard;

  UserModel(
      {required this.id,
      required this.name,
      required this.surname,
      required this.debitCard,
      required this.birthDate,
      required this.gsmNumber});
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'debitCard': debitCard.toJson(),
      'surname': surname,
      'birthDate': birthDate,
      'gsmNumber': gsmNumber
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        debitCard: DebitCardModel.fromJson(json['debitCard']),
        surname: json['surname'],
        birthDate: json['birthDate'],
        gsmNumber: json['gsmNumber']);
  }
}
