class WindowCleaningService {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? location;
  int? numberOfWindows;
  int? numberOfStory;
  String? serviceName;
  String? serviceDate;
  String? serviceTime;
  int? price;
  String? message;
  String? type;
  String? windowsTrackFrame;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  WindowCleaningService(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.location,
      this.numberOfWindows,
      this.numberOfStory,
      this.serviceName,
      this.serviceDate,
      this.serviceTime,
      this.price,
      this.message,
      this.type,
      this.windowsTrackFrame,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  WindowCleaningService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    location = json['location'];
    numberOfWindows = json['number_of_windows'];
    numberOfStory = json['number_of_story'];
    serviceName = json['service_name'];
    serviceDate = json['service_date'];
    serviceTime = json['service_time'];
    price = json['price'];
    message = json['message'];
    type = json['type'];
    windowsTrackFrame = json['windows_track_frame'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['location'] = this.location;
    data['number_of_windows'] = this.numberOfWindows;
    data['number_of_story'] = this.numberOfStory;
    data['service_name'] = this.serviceName;
    data['service_date'] = this.serviceDate;
    data['service_time'] = this.serviceTime;
    data['price'] = this.price;
    data['message'] = this.message;
    data['type'] = this.type;
    data['windows_track_frame'] = this.windowsTrackFrame;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
