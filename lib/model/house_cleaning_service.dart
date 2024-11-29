class HouseCleaningService {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? location;
  int? numberOfBedroom;
  int? numberOfBathroom;
  int? numberOfStory;
  String? frequency;
  String? serviceName;
  String? serviceDate;
  String? serviceTime;
  int? price;
  String? message;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  HouseCleaningService({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.location,
    this.numberOfBedroom,
    this.numberOfBathroom,
    this.numberOfStory,
    this.frequency,
    this.serviceName,
    this.serviceDate,
    this.serviceTime,
    this.price,
    this.message,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  HouseCleaningService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    location = json['location'];
    numberOfBedroom = json['number_of_bedroom'];
    numberOfBathroom = json['number_of_bathroom'];
    numberOfStory = json['number_of_story'];
    frequency = json['frequency'];
    serviceName = json['service_name'];
    serviceDate = json['service_date'];
    serviceTime = json['service_time'];
    price = json['price'];
    message = json['message'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['location'] = location;
    data['number_of_bedroom'] = numberOfBedroom;
    data['number_of_bathroom'] = numberOfBathroom;
    data['number_of_story'] = numberOfStory;
    data['frequency'] = frequency;
    data['service_name'] = serviceName;
    data['service_date'] = serviceDate;
    data['service_time'] = serviceTime;
    data['price'] = price;
    data['message'] = message;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

