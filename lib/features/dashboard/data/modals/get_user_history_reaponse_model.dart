class GetUserHistoryResponseModel {
  String? status;
  int? results;
  List<UserTransactions>? userTransactions;

  GetUserHistoryResponseModel(
      {this.status, this.results, this.userTransactions});

  GetUserHistoryResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    if (json['userTransactions'] != null) {
      userTransactions = <UserTransactions>[];
      json['userTransactions'].forEach((v) {
        userTransactions!.add(UserTransactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['results'] = results;
    if (userTransactions != null) {
      data['userTransactions'] =
          userTransactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserTransactions {
  String? sId;
  String? userId;
  String? cardNumber;
  int? balance;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserTransactions(
      {this.sId,
      this.userId,
      this.cardNumber,
      this.balance,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserTransactions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    cardNumber = json['cardNumber'];
    balance = json['balance'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userId'] = userId;
    data['cardNumber'] = cardNumber;
    data['balance'] = balance;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
