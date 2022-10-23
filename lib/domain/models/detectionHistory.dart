import 'package:intl/intl.dart';

class DetectionHistory {
  final String id;
  final String reoprtedByName;
  final String cause;
  final String riskLevel;
  bool resolved;
  final String ? disease;
  final int detectedOn;

  DetectionHistory({
    required this.id,
    required this.reoprtedByName,
    required this.cause,
    required this.riskLevel,
    required this.resolved,
    required this.disease,
    required this.detectedOn,
  });

  factory DetectionHistory.fromJson(Map<String, dynamic> json) =>
      DetectionHistory(
        id: json["id"],
        reoprtedByName: json["reoprtedByName"],
        cause: json["cause"],
        riskLevel: json["riskLevel"],
        resolved: json["resolved"],
        disease: json["disease"] == null ? null : json["disease"]["name"],
        detectedOn: json["detectedOn"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reoprtedByName": reoprtedByName,
        "cause": cause,
        "riskLevel": riskLevel,
        "resolved": resolved,
        "disease": disease,
        "detectedOn": detectedOn,
      };

  String toFormattedDateTime(){
    return DateFormat("HH:mm, dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(detectedOn));
  }
}