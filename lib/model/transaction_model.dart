class TransactionModel {
  String? id;
  String? Payment;
  String? credit_type;
  String? date_time;
  String? status;
  String? pic;
  String? tittle;

  TransactionModel(
      {this.id,
      this.Payment,
      this.credit_type,
      this.status,
      this.pic,
      this.date_time,
      this.tittle});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Payment = json['Payment'];
    credit_type = json['credit_type'];
    pic = json['pic'];
    status = json['status'];
    date_time = json['date_time'];
    tittle = json['tittle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Payment'] = this.Payment;
    data['credit_type'] = this.credit_type;
    data['pic'] = this.pic;
    data['status'] = this.status;
    data['date_time'] = this.date_time;
    data['tittle'] = this.tittle;

    return data;
  }
}
