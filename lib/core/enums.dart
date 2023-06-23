enum RequestMethod {
  get,
  head,
  post,
  put,
  delete,
  connect,
  options,
  trace,
  patch,
}

enum EventStatus {
  idle,
  processing,
  success,
  failure,
}

class VehicleType {
  static const collection = 0;
  static const inPe = 1;
  static const inAuction = 2;
}

class AccountPermission {
  static const none = 0;
  static const collection = 1;
  static const auction = 2;
}

class VehicleServiceType {
  static const unknown = 0;
  static const none = 1;
  static const small = 2;
  static const big = 3;
}

class VehicleTireType {
  static const allSeason = 0;
  static const summer = 1;
  static const winter = 2;
}

class DriveCarType {
  static const replacement = 0;
  static const test = 1;
}

class DriveStatus {
  static const inDrive = 0;
}

class AccountType {
  static const admin = 0;
  static const employee = 1;
  static const garageOwner = 2;
}

enum OcrScanType {
  driverLicence,
  vehicleLicense;
}
