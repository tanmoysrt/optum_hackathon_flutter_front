// {
// "id": "cl9fd2u9a00003a9618c9c9y4",
// "code": "hr",
// "name": "Heart Rate",
// "unit": "bpm",
// "canReceiveFromDevice": true
// }

class VitalInfo{
  final String id;
  final String code;
  final String name;
  final String unit;
  final bool canReceiveFromDevice;

  VitalInfo({
    required this.id,
    required this.code,
    required this.name,
    required this.unit,
    required this.canReceiveFromDevice,
  });

  factory VitalInfo.fromJson(Map<String, dynamic> json) => VitalInfo(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    unit: json["unit"],
    canReceiveFromDevice: json["canReceiveFromDevice"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "unit": unit,
    "canReceiveFromDevice": canReceiveFromDevice,
  };
}

// {
// "val": 81,
// "timestamp": 1666210348990
// }

class VitalData {
  final int val;
  final int timestamp;

  VitalData({
    required this.val,
    required this.timestamp,
  });

  factory VitalData.fromJson(Map<String, dynamic> json) => VitalData(
    val: json["val"],
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "val": val,
    "timestamp": timestamp,
  };
}