import 'package:mads_cleaning/model/builder_cleaning_service.dart';
import 'package:mads_cleaning/model/carpet_cleaning_service.dart';
import 'package:mads_cleaning/model/commercial_cleaning_service.dart';
import 'package:mads_cleaning/model/house_cleaning_service.dart';
import 'package:mads_cleaning/model/lawn_service.dart';
import 'package:mads_cleaning/model/lease_cleaning_service.dart';
import 'package:mads_cleaning/model/rubbish_removal.dart';
import 'package:mads_cleaning/model/window_cleaning_service.dart';
List<BookingDetails> bookingDetailsFromJson(List<dynamic> bookingJson) =>
    List<BookingDetails>.from(bookingJson
        .map((bookingListJson) => BookingDetails.fromJson(bookingListJson)));
class BookingDetails {
  int? id;
  int? windowCleaningServiceId;
  int? houseCleaningServiceId;
  int? leaseCleaningServiceId;
  int? commercialCleaningServiceId;
  int? builderCleaningServiceId;
  int? lawnServiceId;
  int? rubbishRemovalServiceId;
  int? carpetCleaningServiceId;

  WindowCleaningService? windowCleaningService;
  HouseCleaningService? houseCleaningService;
  LeaseCleaningService? leaseCleaningService;
  CommercialCleaningService? commercialCleaningService;
  BuilderCleaningService? builderCleaningService;
  LawnService? lawnService;
  RubbishRemovalService? rubbishRemovalService;
  CarpetCleaningService? carpetCleaningService;

  BookingDetails({
    this.id,
    this.windowCleaningServiceId,
    this.houseCleaningServiceId,
    this.leaseCleaningServiceId,
    this.commercialCleaningServiceId,
    this.builderCleaningServiceId,
    this.lawnServiceId,
    this.rubbishRemovalServiceId,
    this.carpetCleaningServiceId,
    this.windowCleaningService,
    this.houseCleaningService,
    this.leaseCleaningService,
    this.commercialCleaningService,
    this.builderCleaningService,
    this.lawnService,
    this.rubbishRemovalService,
    this.carpetCleaningService,
  });

  BookingDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    windowCleaningServiceId = json['window_cleaning_service_id'];
    houseCleaningServiceId = json['house_cleaning_service_id'];
    leaseCleaningServiceId = json['lease_cleaning_service_id'];
    commercialCleaningServiceId = json['commercial_cleaning_service_id'];
    builderCleaningServiceId = json['builder_cleaning_service_id'];
    lawnServiceId = json['lawn_service_id'];
    rubbishRemovalServiceId = json['rubbish_removal_service_id'];
    carpetCleaningServiceId = json['carpet_cleaning_service_id'];

    windowCleaningService = json['window_cleaning_service'] != null
        ? WindowCleaningService.fromJson(json['window_cleaning_service'])
        : null;
    houseCleaningService = json['house_cleaning_service'] != null
        ? HouseCleaningService.fromJson(json['house_cleaning_service'])
        : null;
    leaseCleaningService = json['lease_cleaning_service'] != null
        ? LeaseCleaningService.fromJson(json['lease_cleaning_service'])
        : null;
    commercialCleaningService = json['commercial_cleaning_service'] != null
        ? CommercialCleaningService.fromJson(json['commercial_cleaning_service'])
        : null;
    builderCleaningService = json['builder_cleaning_service'] != null
        ? BuilderCleaningService.fromJson(json['builder_cleaning_service'])
        : null;
    lawnService = json['lawn_service'] != null
        ? LawnService.fromJson(json['lawn_service'])
        : null;
    rubbishRemovalService = json['rubbish_removal_service'] != null
        ? RubbishRemovalService.fromJson(json['rubbish_removal_service'])
        : null;
    carpetCleaningService = json['carpet_cleaning_service'] != null
        ? CarpetCleaningService.fromJson(json['carpet_cleaning_service'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['window_cleaning_service_id'] = windowCleaningServiceId;
    data['house_cleaning_service_id'] = houseCleaningServiceId;
    data['lease_cleaning_service_id'] = leaseCleaningServiceId;
    data['commercial_cleaning_service_id'] = commercialCleaningServiceId;
    data['builder_cleaning_service_id'] = builderCleaningServiceId;
    data['lawn_service_id'] = lawnServiceId;
    data['rubbish_removal_service_id'] = rubbishRemovalServiceId;
    data['carpet_cleaning_service_id'] = carpetCleaningServiceId;

    if (windowCleaningService != null) {
      data['window_cleaning_service'] = windowCleaningService!.toJson();
    }
    if (houseCleaningService != null) {
      data['house_cleaning_service'] = houseCleaningService!.toJson();
    }
    if (leaseCleaningService != null) {
      data['lease_cleaning_service'] = leaseCleaningService!.toJson();
    }
    if (commercialCleaningService != null) {
      data['commercial_cleaning_service'] = commercialCleaningService!.toJson();
    }
    if (builderCleaningService != null) {
      data['builder_cleaning_service'] = builderCleaningService!.toJson();
    }
    if (lawnService != null) {
      data['lawn_service'] = lawnService!.toJson();
    }
    if (rubbishRemovalService != null) {
      data['rubbish_removal_service'] = rubbishRemovalService!.toJson();
    }
    if (carpetCleaningService != null) {
      data['carpet_cleaning_service'] = carpetCleaningService!.toJson();
    }

    return data;
  }
}
