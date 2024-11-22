class ApiEndPoint {
  static String getToken = "qr/getToken";
  static String getStations = "qr/getStations";
  static String getFare = 'qr/getTicketFare';
  static String createQrPaymentOrder = 'cfpg/cashfree/createOrder';
  static String verifyPayment = 'cfpg/cashfree/getOrder';
  static String generateTicket = 'qr/generateTicket';



  ///Station Facilities
  static String getStationsWithCoords = 'jsondata/metronmmtsjsonlist.json';
  static String getStationFacilitiesServices = 'getMetroStationFacilities/services.do?mstId=';
}
