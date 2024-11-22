class StationFacilitiesModel {
  String? s;
  String? e;
  String? em;
  List<Stnlist>? stnlist;

  StationFacilitiesModel({this.s, this.e, this.em, this.stnlist});

  StationFacilitiesModel.fromJson(Map<String, dynamic> json) {
    s = json['s'];
    e = json['e'];
    em = json['em'];
    if (json['stnlist'] != null) {
      stnlist = <Stnlist>[];
      json['stnlist'].forEach((v) {
        stnlist!.add(new Stnlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s'] = this.s;
    data['e'] = this.e;
    data['em'] = this.em;
    if (this.stnlist != null) {
      data['stnlist'] = this.stnlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stnlist {
  String? stationid;
  String? station;
  String? stcode;
  String? afcnumber;
  String? atsnumber;
  String? amscode;
  String? description;
  int? stage;
  int? stnId;
  double? latitude;
  double? longitude;
  String? type;
  String? rtclr;
  int? rccode;
  int? tt;
  String? jn;
  String? cmnJN;
  Fc? fc;
  String? status;
  int? mMTSR;

  Stnlist(
      {this.stationid,
      this.station,
      this.stcode,
      this.afcnumber,
      this.atsnumber,
      this.amscode,
      this.description,
      this.stage,
      this.stnId,
      this.latitude,
      this.longitude,
      this.type,
      this.rtclr,
      this.rccode,
      this.tt,
      this.jn,
      this.cmnJN,
      this.fc,
      this.status,
      this.mMTSR});

  Stnlist.fromJson(Map<String, dynamic> json) {
    stationid = json['stationid'];
    station = json['Station'];
    stcode = json['stcode'];
    afcnumber = json['afcnumber'];
    atsnumber = json['atsnumber'];
    amscode = json['amscode'];
    description = json['description'];
    stage = json['stage'];
    stnId = json['stnId'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    type = json['type'];
    rtclr = json['rtclr'];
    rccode = json['rccode'];
    tt = json['tt'];
    jn = json['jn'];
    cmnJN = json['cmnJN'];
    fc = json['fc'] != null ? new Fc.fromJson(json['fc']) : null;
    status = json['status'];
    mMTSR = json['MMTS_R'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stationid'] = this.stationid;
    data['Station'] = this.station;
    data['stcode'] = this.stcode;
    data['afcnumber'] = this.afcnumber;
    data['atsnumber'] = this.atsnumber;
    data['amscode'] = this.amscode;
    data['description'] = this.description;
    data['stage'] = this.stage;
    data['stnId'] = this.stnId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['type'] = this.type;
    data['rtclr'] = this.rtclr;
    data['rccode'] = this.rccode;
    data['tt'] = this.tt;
    data['jn'] = this.jn;
    data['cmnJN'] = this.cmnJN;
    if (this.fc != null) {
      data['fc'] = this.fc!.toJson();
    }
    data['status'] = this.status;
    data['MMTS_R'] = this.mMTSR;
    return data;
  }
}

class Fc {
  String? p;
  String? mmts;
  String? rt;
  String? bs;

  Fc({this.p, this.mmts, this.rt, this.bs});

  Fc.fromJson(Map<String, dynamic> json) {
    p = json['p'];
    mmts = json['mmts'];
    rt = json['rt'];
    bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['p'] = this.p;
    data['mmts'] = this.mmts;
    data['rt'] = this.rt;
    data['bs'] = this.bs;
    return data;
  }
}
