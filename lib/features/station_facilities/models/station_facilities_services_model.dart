class MetroStationFacilitiesServicesModel {
    String? s;
    String? e;
    String? em;
    R? r;

    MetroStationFacilitiesServicesModel({
        this.s,
        this.e,
        this.em,
        this.r,
    });

    factory MetroStationFacilitiesServicesModel.fromJson(Map<String, dynamic> json) => MetroStationFacilitiesServicesModel(
        s: json["s"],
        e: json["e"],
        em: json["em"],
        r: json["r"] == null ? null : R.fromJson(json["r"]),
    );

    Map<String, dynamic> toJson() => {
        "s": s,
        "e": e,
        "em": em,
        "r": r?.toJson(),
    };
}

class R {
    List<Facility> facilities;

    R({
        this.facilities = const [], // Initialize to an empty list by default
    });

    factory R.fromJson(Map<String, dynamic> json) => R(
        facilities: json["facilities"] == null ? [] : List<Facility>.from(json["facilities"]!.map((x) => Facility.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "facilities": facilities.map((x) => x.toJson()).toList(),
    };
}

class Facility {
    String? id;
    String? stationId;
    StationName? stationName;
    String? facilityCode;
    String? facilityName;
    String? facilityContent;
    String? isGateAvailable;
    String? facilityIconPath;
    String? facilityContentUrl;
    int? isActive;
    int? facilityPriority;
    List<Facility> neighbourhood;
    List<Facility> busstop;
    List<Facility> catchment;

    Facility({
        this.id,
        this.stationId,
        this.stationName,
        this.facilityCode,
        this.facilityName,
        this.facilityContent,
        this.isGateAvailable,
        this.facilityIconPath,
        this.facilityContentUrl,
        this.isActive,
        this.facilityPriority,
        this.neighbourhood = const [], // Initialize to empty lists
        this.busstop = const [],
        this.catchment = const [],
    });

    factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        id: json["Id"],
        stationId: json["stationId"],
        stationName: stationNameValues.map[json["stationName"]], // Remove the `!` operator for null safety
        facilityCode: json["facilityCode"],
        facilityName: json["facilityName"],
        facilityContent: json["facilityContent"],
        isGateAvailable: json["isGateAvailable"],
        facilityIconPath: json["facilityIconPath"],
        facilityContentUrl: json["facilityContentUrl"],
        isActive: json["isActive"],
        facilityPriority: json["facilityPriority"],
        neighbourhood: json["NEIGHBOURHOOD"] == null ? [] : List<Facility>.from(json["NEIGHBOURHOOD"]!.map((x) => Facility.fromJson(x))),
        busstop: json["BUSSTOP"] == null ? [] : List<Facility>.from(json["BUSSTOP"]!.map((x) => Facility.fromJson(x))),
        catchment: json["CATCHMENT"] == null ? [] : List<Facility>.from(json["CATCHMENT"]!.map((x) => Facility.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "stationId": stationId,
        "stationName": stationNameValues.reverse[stationName],
        "facilityCode": facilityCode,
        "facilityName": facilityName,
        "facilityContent": facilityContent,
        "isGateAvailable": isGateAvailable,
        "facilityIconPath": facilityIconPath,
        "facilityContentUrl": facilityContentUrl,
        "isActive": isActive,
        "facilityPriority": facilityPriority,
        "NEIGHBOURHOOD": neighbourhood.map((x) => x.toJson()).toList(),
        "BUSSTOP": busstop.map((x) => x.toJson()).toList(),
        "CATCHMENT": catchment.map((x) => x.toJson()).toList(),
    };
}

enum StationName {
    UPPAL,
}

final stationNameValues = EnumValues({
    "Uppal": StationName.UPPAL,
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
