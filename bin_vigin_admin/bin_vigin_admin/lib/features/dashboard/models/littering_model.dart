import 'package:intl/intl.dart';

class LitteringModel {
  String? uid;
  String? id;
  String city;
  String location;
  String date;
  String statement;
  String evidenceFile;
  int fineAmount;
  String? appealStatement;
  int status;

  LitteringModel({
    required this.uid,
    required this.city,
    required this.location,
    required this.date,
    required this.statement,
    required this.evidenceFile,
    required this.fineAmount,
    required this.appealStatement,
    required this.status,
  });

  factory LitteringModel.fromJson(Map<String, dynamic> json) {
    return LitteringModel(
      uid: json['uid'],
      city: json['city'],
      location: json['location'],
      date: json['date'],
      statement: json['statement'],
      evidenceFile: json['evidence_file'],
      fineAmount: int.parse(json['fine_amount'].toString()),
      appealStatement: json['appeal_statement'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'city': city,
      'location': location,
      'date': date,
      'statement': statement,
      'evidence_file': evidenceFile,
      'fine_amount': fineAmount,
      'appeal_statement': appealStatement,
      'status': status,
    };
  }

  DateTime get parsedDate {
    final dateFormat = DateFormat('d-M-yyyy');
    return dateFormat.parse(date);
  }
}
