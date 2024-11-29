class LeaseCleaningService {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? location;
  int? numberOfBedrooms;
  int? numberOfBathrooms;
  String? windowCleaning;
  int? ovenCleaning;
  int? stoveCleaning;
  int? numberOfWallsCleaned;
  String? carpetSteamCleaningArea;
  String? carpetSteamCleaningUnit;
  String? serviceName;
  String? serviceDate;
  String? serviceTime;
  int? price;
  String? message;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  LeaseCleaningService({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.location,
    this.numberOfBedrooms,
    this.numberOfBathrooms,
    this.windowCleaning,
    this.ovenCleaning,
    this.stoveCleaning,
    this.numberOfWallsCleaned,
    this.carpetSteamCleaningArea,
    this.carpetSteamCleaningUnit,
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

  LeaseCleaningService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    location = json['location'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfBathrooms = json['number_of_bathrooms'];
    windowCleaning = json['window_cleaning'];
    ovenCleaning = json['oven_cleaning'];
    stoveCleaning = json['stove_cleaning'];
    numberOfWallsCleaned = json['number_of_walls_cleaned'];
    carpetSteamCleaningArea = json['carpet_steam_cleaning_area'];
    carpetSteamCleaningUnit = json['carpet_steam_cleaning_unit'];
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
    data['phone'] = phone;
    data['email'] = email;
    data['location'] = location;
    data['number_of_bedrooms'] = numberOfBedrooms;
    data['number_of_bathrooms'] = numberOfBathrooms;
    data['window_cleaning'] = windowCleaning;
    data['oven_cleaning'] = ovenCleaning;
    data['stove_cleaning'] = stoveCleaning;
    data['number_of_walls_cleaned'] = numberOfWallsCleaned;
    data['carpet_steam_cleaning_area'] = carpetSteamCleaningArea;
    data['carpet_steam_cleaning_unit'] = carpetSteamCleaningUnit;
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
