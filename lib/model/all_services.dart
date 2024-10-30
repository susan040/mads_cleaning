List<Services> serviceFromJson(List<dynamic> serviceJson) =>
    List<Services>.from(serviceJson
        .map((serviceListJson) => Services.fromJson(serviceListJson)));

class Services {
  int? id;
  String? name;
  int? price;
  String? location;
  String? workingInformation;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  Services(
      {this.id,
      this.name,
      this.price,
      this.location,
      this.workingInformation,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.imageUrl});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    location = json['location'];
    workingInformation = json['working_information'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['location'] = location;
    data['working_information'] = workingInformation;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image_url'] = imageUrl;
    return data;
  }
}
