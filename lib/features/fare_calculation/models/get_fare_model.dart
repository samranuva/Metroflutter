class GetFareModel {
    final String fromStationId;
    final String toStationId;
    final int fareBeforeDiscount;
    final int discountAmount;
    final int fareAfterDiscount;
    final int cgst;
    final int sgst;
    final int finalFare;
    final DateTime fareValidTime;
    final String fareQuotIdforOneTicket;
    final String returnCode;
    final String returnMsg;

    GetFareModel({
        required this.fromStationId,
        required this.toStationId,
        required this.fareBeforeDiscount,
        required this.discountAmount,
        required this.fareAfterDiscount,
        required this.cgst,
        required this.sgst,
        required this.finalFare,
        required this.fareValidTime,
        required this.fareQuotIdforOneTicket,
        required this.returnCode,
        required this.returnMsg,
    });

    factory GetFareModel.fromJson(Map<String, dynamic> json) => GetFareModel(
        fromStationId: json["fromStationId"],
        toStationId: json["toStationId"],
        fareBeforeDiscount: json["fareBeforeDiscount"],
        discountAmount: json["discountAmount"],
        fareAfterDiscount: json["fareAfterDiscount"],
        cgst: json["cgst"],
        sgst: json["sgst"],
        finalFare: json["finalFare"],
        fareValidTime: DateTime.parse(json["fareValidTime"]),
        fareQuotIdforOneTicket: json["fareQuotIdforOneTicket"],
        returnCode: json["returnCode"],
        returnMsg: json["returnMsg"],
    );

    Map<String, dynamic> toJson() => {
        "fromStationId": fromStationId,
        "toStationId": toStationId,
        "fareBeforeDiscount": fareBeforeDiscount,
        "discountAmount": discountAmount,
        "fareAfterDiscount": fareAfterDiscount,
        "cgst": cgst,
        "sgst": sgst,
        "finalFare": finalFare,
        "fareValidTime": fareValidTime.toIso8601String(),
        "fareQuotIdforOneTicket": fareQuotIdforOneTicket,
        "returnCode": returnCode,
        "returnMsg": returnMsg,
    };
}
