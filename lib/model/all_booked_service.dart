class AllBookedServices {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? location;
  String? numberOfWindows;
  String? numberOfStory;
  String? message;
  String? serviceDate;
  String? serviceTime;
  String? type;
  String? status;
  String? windowsTrackFrame;
  String? createdAt;
  String? updatedAt;

  AllBookedServices(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.location,
      this.numberOfWindows,
      this.numberOfStory,
      this.message,
      this.serviceDate,
      this.serviceTime,
      this.type,
      this.status,
      this.windowsTrackFrame,
      this.createdAt,
      this.updatedAt});

  AllBookedServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    location = json['location'];
    numberOfWindows = json['number_of_windows'];
    numberOfStory = json['number_of_story'];
    message = json['message'];
    serviceDate = json['service_date'];
    serviceTime = json['service_time'];
    type = json['type'];
    status = json['status'];
    windowsTrackFrame = json['windows_track_frame'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['location'] = location;
    data['number_of_windows'] = numberOfWindows;
    data['number_of_story'] = numberOfStory;
    data['message'] = message;
    data['service_date'] = serviceDate;
    data['service_time'] = serviceTime;
    data['type'] = type;
    data['status'] = status;
    data['windows_track_frame'] = windowsTrackFrame;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
