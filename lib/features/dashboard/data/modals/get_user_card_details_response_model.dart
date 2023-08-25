class GetUserCardDetailsResponseModel {
  String? status;
  Card? card;

  GetUserCardDetailsResponseModel({this.status, this.card});

  GetUserCardDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    card = json['card'] != null ? Card.fromJson(json['card']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (card != null) {
      data['card'] = card!.toJson();
    }
    return data;
  }
}

class Card {
  String? sId;
  String? cardIssuer;
  String? cardNumber;
  String? cnic;
  int? balance;
  String? activationDate;
  String? expirationDate;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? cardHolder;

  Card(
      {this.sId,
      this.cardIssuer,
      this.cardNumber,
      this.cnic,
      this.balance,
      this.activationDate,
      this.expirationDate,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.cardHolder});

  Card.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cardIssuer = json['cardIssuer'];
    cardNumber = json['cardNumber'];
    cnic = json['cnic'];
    balance = json['balance'];
    activationDate = json['activationDate'];
    expirationDate = json['expirationDate'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    cardHolder = json['cardHolder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['cardIssuer'] = cardIssuer;
    data['cardNumber'] = cardNumber;
    data['cnic'] = cnic;
    data['balance'] = balance;
    data['activationDate'] = activationDate;
    data['expirationDate'] = expirationDate;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['cardHolder'] = cardHolder;
    return data;
  }
}
