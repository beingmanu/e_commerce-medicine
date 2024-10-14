import 'dart:convert';

class Payments {
  String paymentType;
  String paymentID;
  String upiId;
  String cardNumber;
  DateTime expirydate;
  String cvvnumber;
  Payments({
    required this.paymentType,
    required this.paymentID,
    required this.upiId,
    required this.cardNumber,
    required this.expirydate,
    required this.cvvnumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'paymentType': paymentType,
      'paymentID': paymentID,
      'upiId': upiId,
      'cardNumber': cardNumber,
      'expirydate': expirydate.millisecondsSinceEpoch,
      'cvvnumber': cvvnumber,
    };
  }

  factory Payments.fromMap(Map<String, dynamic> map) {
    return Payments(
      paymentType: map['paymentType'] ?? '',
      paymentID: map['paymentID'] ?? '',
      upiId: map['upiId'] ?? '',
      cardNumber: map['cardNumber'] ?? '',
      expirydate: DateTime.fromMillisecondsSinceEpoch(map['expirydate']),
      cvvnumber: map['cvvnumber'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Payments.fromJson(String source) =>
      Payments.fromMap(json.decode(source));
}

class MyWallet {
  int balance;
  int cradit;
  int cash;
  MyWallet({
    required this.balance,
    required this.cradit,
    required this.cash,
  });

  Map<String, dynamic> toMap() {
    return {
      'balance': balance,
      'cradit': cradit,
      'cash': cash,
    };
  }

  factory MyWallet.fromMap(Map<String, dynamic> map) {
    return MyWallet(
      balance: map['balance']?.toInt() ?? 0,
      cradit: map['cradit']?.toInt() ?? 0,
      cash: map['cash']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyWallet.fromJson(String source) =>
      MyWallet.fromMap(json.decode(source));
}
