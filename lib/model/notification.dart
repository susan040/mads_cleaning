List<NotificationDetails> notificationFromJson(
        List<dynamic> notificationJson) =>
    List<NotificationDetails>.from(notificationJson.map(
        (notificationListJson) =>
            NotificationDetails.fromJson(notificationListJson)));

class NotificationDetails {
  String? id;
  Data? data;
  String? readAt;
  String? createdAt;

  NotificationDetails({this.id, this.data, this.readAt, this.createdAt});

  NotificationDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    readAt = json['read_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['read_at'] = this.readAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Data {
  int? bookingId;
  String? message;

  Data({this.bookingId, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this.bookingId;
    data['message'] = this.message;
    return data;
  }
}
