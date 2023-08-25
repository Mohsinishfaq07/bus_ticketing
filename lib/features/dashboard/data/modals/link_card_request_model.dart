class LinkCardRequestModel {
  String? cardNumber;
  String? cnic;

  LinkCardRequestModel({this.cardNumber, this.cnic});

  LinkCardRequestModel.fromJson(Map<String, dynamic> json) {
    cardNumber = json['cardNumber'];
    cnic = json['cnic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cardNumber'] = cardNumber;
    data['cnic'] = cnic;
    return data;
  }
}
