class NotificationsModel {
  String? id;
  String? name;
  String? discription;
  String? created_on;
  String? status;
  String? link;

  NotificationsModel(
      {this.id,
      this.name,
      this.discription,
      this.status,
      this.link,
      this.created_on});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    discription = json['discription'];
    created_on = json['created_on'];
    status = json['status'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['discription'] = this.discription;
    data['created_on'] = this.created_on;
    data['status'] = this.status;
    data['link'] = this.link;

    return data;
  }
}
