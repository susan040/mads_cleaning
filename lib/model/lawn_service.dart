class LawnService {
  int? id;
  String? name;
  String? phone;
  String? location;
  String? email;
  String? serviceName;
  String? serviceDate;
  String? serviceTime;
  int? price;
  String? typeOfLawnService;
  String? messageBox;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  LawnService({
    this.id,
    this.name,
    this.phone,
    this.location,
    this.email,
    this.serviceName,
    this.serviceDate,
    this.serviceTime,
    this.price,
    this.typeOfLawnService,
    this.messageBox,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  LawnService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    location = json['location'];
    email = json['email'];
    serviceName = json['service_name'];
    serviceDate = json['service_date'];
    serviceTime = json['service_time'];
    price = json['price'];
    typeOfLawnService = json['type_of_lawn_service'];
    messageBox = json['message_box'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['location'] = location;
    data['email'] = email;
    data['service_name'] = serviceName;
    data['service_date'] = serviceDate;
    data['service_time'] = serviceTime;
    data['price'] = price;
    data['type_of_lawn_service'] = typeOfLawnService;
    data['message_box'] = messageBox;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
