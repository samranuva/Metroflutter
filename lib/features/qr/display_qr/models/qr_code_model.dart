class QrTicketModel {
  String? returnCode;
  String? returnMsg;
  String? ltmrhlPurchaseId;
  List<Tickets>? tickets;

  QrTicketModel(
      {this.returnCode, this.returnMsg, this.ltmrhlPurchaseId, this.tickets});

  QrTicketModel.fromJson(Map<String, dynamic> json) {
    returnCode = json['returnCode'];
    returnMsg = json['returnMsg'];
    ltmrhlPurchaseId = json['ltmrhlPurchaseId'];
    if (json['tickets'] != null) {
      tickets = <Tickets>[];
      json['tickets'].forEach((v) {
        tickets!.add(Tickets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['returnCode'] = returnCode;
    data['returnMsg'] = returnMsg;
    data['ltmrhlPurchaseId'] = ltmrhlPurchaseId;
    if (tickets != null) {
      data['tickets'] = tickets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tickets {
  String? ticketId;
  String? rjtID;
  String? ticketContent;
  String? fromStationId;
  String? toStationId;
  int? ticketTypeId;
  String? ticketStatus;
  String? noOfTripsRemaining;
  String? noOfTripsUsed;
  String? remainingStoredValue;
  String? entryExitType;
  String? platFormNo;
  String? ticketExpiryTime;
  String? carbonEmissionMsg;

  Tickets(
      {this.ticketId,
      this.rjtID,
      this.ticketContent,
      this.fromStationId,
      this.toStationId,
      this.ticketTypeId,
      this.ticketStatus,
      this.noOfTripsRemaining,
      this.noOfTripsUsed,
      this.remainingStoredValue,
      this.entryExitType,
      this.platFormNo,
      this.ticketExpiryTime,
      this.carbonEmissionMsg});

  Tickets.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticketId'];
    rjtID = json['rjtID'];
    ticketContent = json['ticketContent'];
    fromStationId = json['fromStationId'];
    toStationId = json['toStationId'];
    ticketTypeId = json['ticketTypeId'];
    ticketStatus = json['ticketStatus'];
    noOfTripsRemaining = json['noOfTripsRemaining'];
    noOfTripsUsed = json['noOfTripsUsed'];
    remainingStoredValue = json['remainingStoredValue'];
    entryExitType = json['entryExitType'];
    platFormNo = json['platFormNo'];
    ticketExpiryTime = json['ticketExpiryTime'];
    carbonEmissionMsg = json['carbonEmissionMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ticketId'] = ticketId;
    data['rjtID'] = rjtID;
    data['ticketContent'] = ticketContent;
    data['fromStationId'] = fromStationId;
    data['toStationId'] = toStationId;
    data['ticketTypeId'] = ticketTypeId;
    data['ticketStatus'] = ticketStatus;
    data['noOfTripsRemaining'] = noOfTripsRemaining;
    data['noOfTripsUsed'] = noOfTripsUsed;
    data['remainingStoredValue'] = remainingStoredValue;
    data['entryExitType'] = entryExitType;
    data['platFormNo'] = platFormNo;
    data['ticketExpiryTime'] = ticketExpiryTime;
    data['carbonEmissionMsg'] = carbonEmissionMsg;
    return data;
  }
}
