class QrGetFareModel {
  String? fromStationId;
  String? toStationId;
  int? fareBeforeDiscount;
  int? discountAmount;
  int? fareAfterDiscount;
  int? cgst;
  int? sgst;
  int? finalFare;
  String? fareValidTime;
  String? fareQuotIdforOneTicket;
  String? returnCode;
  String? returnMsg;

  QrGetFareModel(
      {this.fromStationId,
      this.toStationId,
      this.fareBeforeDiscount,
      this.discountAmount,
      this.fareAfterDiscount,
      this.cgst,
      this.sgst,
      this.finalFare,
      this.fareValidTime,
      this.fareQuotIdforOneTicket,
      this.returnCode,
      this.returnMsg});

  QrGetFareModel.fromJson(Map<String, dynamic> json) {
    fromStationId = json['fromStationId'];
    toStationId = json['toStationId'];
    fareBeforeDiscount = json['fareBeforeDiscount'];
    discountAmount = json['discountAmount'];
    fareAfterDiscount = json['fareAfterDiscount'];
    cgst = json['cgst'];
    sgst = json['sgst'];
    finalFare = json['finalFare'];
    fareValidTime = json['fareValidTime'];
    fareQuotIdforOneTicket = json['fareQuotIdforOneTicket'];
    returnCode = json['returnCode'];
    returnMsg = json['returnMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fromStationId'] = fromStationId;
    data['toStationId'] = toStationId;
    data['fareBeforeDiscount'] = fareBeforeDiscount;
    data['discountAmount'] = discountAmount;
    data['fareAfterDiscount'] = fareAfterDiscount;
    data['cgst'] = cgst;
    data['sgst'] = sgst;
    data['finalFare'] = finalFare;
    data['fareValidTime'] = fareValidTime;
    data['fareQuotIdforOneTicket'] = fareQuotIdforOneTicket;
    data['returnCode'] = returnCode;
    data['returnMsg'] = returnMsg;
    return data;
  }
}
