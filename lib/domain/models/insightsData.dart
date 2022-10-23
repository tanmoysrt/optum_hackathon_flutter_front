import 'package:intl/intl.dart';

class VitalInsight{
  final double value;
  final int timestamp;

  VitalInsight(this.value, this.timestamp);

  factory VitalInsight.fromJson(Map<String, dynamic> json){
    dynamic value = json["val"];
    if(value is String){
      value = double.parse(value);
    }
    if(value is int){
      value = value.toDouble();
    }
    return VitalInsight(
      value,
      json["timestamp"] as int,
    );
  }

  Map<String, dynamic> toJson() => {
    "val": value,
    "timestamp": timestamp,
  };

  DateTime toDateTime(){
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  String toFormattedDateTime(){
    return DateFormat("dd MMM yyyy").format(DateTime.fromMillisecondsSinceEpoch(timestamp));
  }
}