// class Services {
//   String? image;
//   String? name;

//   Services({this.image, this.name});
//   factory Services.fromJson(Map<String, dynamic> json) {
//     return Services(
//       image: json['image'],
//       name: json['name'],
//     );
//   }

//   // Method to convert Services instance to a map.
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['image'] = image;
//     data['name'] = name;
//     return data;
//   }
// }

// List<Services> servicesFromJson(List<dynamic> servicesJson) =>
//     List<Services>.from(
//         servicesJson.map((serviceJson) => Services.fromJson(serviceJson)));
