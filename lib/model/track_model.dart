class bzuapi {
  String? success;
  List<SearchIDs>? searchIDs;
  int? size;

  bzuapi({this.success, this.searchIDs, this.size});

  bzuapi.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['searchIDs'] != null) {
      searchIDs = <SearchIDs>[];
      json['searchIDs'].forEach((v) {
        searchIDs!.add(new SearchIDs.fromJson(v));
      });
    }
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.searchIDs != null) {
      data['searchIDs'] = this.searchIDs!.map((v) => v.toJson()).toList();
    }
    data['size'] = this.size;
    return data;
  }
}

class SearchIDs {
  String? ignitionOnOff;
  double? speed;
  String? reportText;
  String? vehicleModel;
  String? location;
  double? latitude;
  String? trackerTime;
  double? longitude;
  String? vehicleMake;
  String? engineNo;
  String? regNo;

  SearchIDs(
      {this.ignitionOnOff,
      this.speed,
      this.reportText,
      this.vehicleModel,
      this.location,
      this.latitude,
      this.trackerTime,
      this.longitude,
      this.vehicleMake,
      this.engineNo,
      this.regNo});

  SearchIDs.fromJson(Map<String, dynamic> json) {
    ignitionOnOff = json['Ignition_On_Off'];
    speed = json['Speed'];
    reportText = json['reportText'];
    vehicleModel = json['vehicle_model'];
    location = json['Location'];
    latitude = json['Latitude'];
    trackerTime = json['Tracker_Time'];
    longitude = json['Longitude'];
    vehicleMake = json['vehicle_make'];
    engineNo = json['engine_no'];
    regNo = json['reg_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Ignition_On_Off'] = this.ignitionOnOff;
    data['Speed'] = this.speed;
    data['reportText'] = this.reportText;
    data['vehicle_model'] = this.vehicleModel;
    data['Location'] = this.location;
    data['Latitude'] = this.latitude;
    data['Tracker_Time'] = this.trackerTime;
    data['Longitude'] = this.longitude;
    data['vehicle_make'] = this.vehicleMake;
    data['engine_no'] = this.engineNo;
    data['reg_no'] = this.regNo;
    return data;
  }
}
