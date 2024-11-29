class CarpetCleaningService {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? location;
  String? serviceName;
  String? serviceDate;
  String? serviceTime;
  int? price;
  int? carpetSteamCleaningArea;
  String? carpetSteamCleaningUnit;
  int? carpetStainCleaningArea;
  String? carpetStainCleaningUnit;
  String? message;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  CarpetCleaningService({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.location,
    this.serviceName,
    this.serviceDate,
    this.serviceTime,
    this.price,
    this.carpetSteamCleaningArea,
    this.carpetSteamCleaningUnit,
    this.carpetStainCleaningArea,
    this.carpetStainCleaningUnit,
    this.message,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  CarpetCleaningService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    location = json['location'];
    serviceName = json['service_name'];
    serviceDate = json['service_date'];
    serviceTime = json['service_time'];
    price = json['price'];
    carpetSteamCleaningArea = json['carpet_steam_cleaning_area'];
    carpetSteamCleaningUnit = json['carpet_steam_cleaning_unit'];
    carpetStainCleaningArea = json['carpet_stain_cleaning_area'];
    carpetStainCleaningUnit = json['carpet_stain_cleaning_unit'];
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
    data['phone'] = phone;
    data['email'] = email;
    data['location'] = location;
    data['service_name'] = serviceName;
    data['service_date'] = serviceDate;
    data['service_time'] = serviceTime;
    data['price'] = price;
    data['carpet_steam_cleaning_area'] = carpetSteamCleaningArea;
    data['carpet_steam_cleaning_unit'] = carpetSteamCleaningUnit;
    data['carpet_stain_cleaning_area'] = carpetStainCleaningArea;
    data['carpet_stain_cleaning_unit'] = carpetStainCleaningUnit;
    data['message'] = message;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
