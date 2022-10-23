// {
// "id": "cl9ftq1v500023ab830kesm0p",
// "name": "Disease #2",
// "assigneeType": "patient",
// "doctor": null,
// "isLive": true,
// "isMonitorCalorieCount": true,
// "minCalorieCount": 50,
// "isMonitorStepCount": true,
// "minStepCount": 1000,
// "isPredictionModelAssigned": false,
// "predictionModel": null,
// "intervalSeconds": 600,
// "vitalThreshold": [
// {
// "vital": {
// "name": "Oxygen Level",
// "unit": "%"
// }
// }
// ],
// "currentSteps": 0,
// "currentCalories": 1200
// },

class PersonalizedMonitoringRecord {
  PersonalizedMonitoringRecord({
    required this.id,
    required this.name,
    required this.assigneeType,
    required this.doctorName,
    required this.isLive,
    required this.isMonitorCalorieCount,
    required this.minCalorieCount,
    required this.isMonitorStepCount,
    required this.minStepCount,
    required this.isPredictionModelAssigned,
    required this.predictionModelName,
    required this.intervalSeconds,
    required this.vitalThreshold,
    required this.currentSteps,
    required this.currentCalories,
  });

  String id;
  String name;
  String assigneeType;
  String doctorName;
  bool isLive;
  bool isMonitorCalorieCount;
  int minCalorieCount;
  bool isMonitorStepCount;
  int minStepCount;
  bool isPredictionModelAssigned;
  String predictionModelName;
  int intervalSeconds;
  List<VitalThreshold> vitalThreshold;
  int currentSteps;
  int currentCalories;

  factory PersonalizedMonitoringRecord.fromJson(Map<String, dynamic> json) =>
      PersonalizedMonitoringRecord(
        id: json["id"],
        name: json["name"],
        assigneeType: json["assigneeType"],
        doctorName: json["doctor"]?["name"] ?? "",
        isLive: json["isLive"],
        isMonitorCalorieCount: json["isMonitorCalorieCount"],
        minCalorieCount: json["minCalorieCount"],
        isMonitorStepCount: json["isMonitorStepCount"],
        minStepCount: json["minStepCount"],
        isPredictionModelAssigned: json["isPredictionModelAssigned"],
        predictionModelName: json["predictionModel"]?["name"] ?? "",
        intervalSeconds: json["intervalSeconds"],
        vitalThreshold: List<VitalThreshold>.from(
            json["vitalThreshold"].map((x) => VitalThreshold.fromJson(x))),
        currentSteps: json["currentSteps"],
        currentCalories: json["currentCalories"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "assigneeType": assigneeType,
        "doctor": {
          "name": doctorName,
        },
        "isLive": isLive,
        "isMonitorCalorieCount": isMonitorCalorieCount,
        "minCalorieCount": minCalorieCount,
        "isMonitorStepCount": isMonitorStepCount,
        "minStepCount": minStepCount,
        "isPredictionModelAssigned": isPredictionModelAssigned,
        "prediction": {"name": predictionModelName},
        "intervalSeconds": intervalSeconds,
        "vitalThreshold":
            List<dynamic>.from(vitalThreshold.map((x) => x.toJson())),
        "currentSteps": currentSteps,
        "currentCalories": currentCalories,
      };
}

class VitalThreshold {
  VitalThreshold({
    required this.vital,
  });

  Vital vital;

  factory VitalThreshold.fromJson(Map<String, dynamic> json) => VitalThreshold(
        vital: Vital.fromJson(json["vital"]),
      );

  Map<String, dynamic> toJson() => {
        "vital": vital.toJson(),
      };
}

class Vital {
  Vital({
    required this.name,
    required this.unit,
  });

  String name;
  String unit;

  factory Vital.fromJson(Map<String, dynamic> json) => Vital(
        name: json["name"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "unit": unit,
      };
}
