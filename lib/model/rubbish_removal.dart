class RubbishRemovalService {
  int? id;
  String? name;
  String? phone;
  String? location;
  String? email;
  String? serviceName;
  String? serviceDate;
  String? serviceTime;
  int? price;
  int? numberOfTyres;
  int? numberOfFurniture;
  int? numberOfMattress;
  String? messageBox;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  RubbishRemovalService({
    this.id,
    this.name,
    this.phone,
    this.location,
    this.email,
    this.serviceName,
    this.serviceDate,
    this.serviceTime,
    this.price,
    this.numberOfTyres,
    this.numberOfFurniture,
    this.numberOfMattress,
    this.messageBox,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  RubbishRemovalService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    location = json['location'];
    email = json['email'];
    serviceName = json['service_name'];
    serviceDate = json['service_date'];
    serviceTime = json['service_time'];
    price = json['price'];
    numberOfTyres = json['number_of_tyres'];
    numberOfFurniture = json['number_of_furniture'];
    numberOfMattress = json['number_of_mattress'];
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
    data['number_of_tyres'] = numberOfTyres;
    data['number_of_furniture'] = numberOfFurniture;
    data['number_of_mattress'] = numberOfMattress;
    data['message_box'] = messageBox;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
