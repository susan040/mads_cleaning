class CommercialCleaningService {
  int? id;
  String? name;
  String? phone;
  String? location;
  String? email;
  String? serviceName;
  String? serviceDate;
  String? serviceTime;
  String? typeOfCommercialSpace;
  String? siteVisitDate;
  String? messageBox;
  int? price;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  CommercialCleaningService({
    this.id,
    this.name,
    this.phone,
    this.location,
    this.email,
    this.serviceName,
    this.serviceDate,
    this.serviceTime,
    this.typeOfCommercialSpace,
    this.siteVisitDate,
    this.messageBox,
    this.price,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  CommercialCleaningService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    location = json['location'];
    email = json['email'];
    serviceName = json['service_name'];
    serviceDate = json['service_date'];
    serviceTime = json['service_time'];
    typeOfCommercialSpace = json['type_of_commercial_space'];
    siteVisitDate = json['site_visit_date'];
    messageBox = json['message_box'];
    price = json['price'];
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
    data['type_of_commercial_space'] = typeOfCommercialSpace;
    data['site_visit_date'] = siteVisitDate;
    data['message_box'] = messageBox;
    data['price'] = price;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
