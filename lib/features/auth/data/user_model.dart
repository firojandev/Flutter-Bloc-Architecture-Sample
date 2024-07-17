import 'package:dio/dio.dart';

class UserModel {
  String? message;
  String? status;
  String? depotName;
  String? designation;
  String? empName;
  String? isTourPartialAllow;
  String? locCode;
  String? locName;
  String? mPGroup;
  String? mPOName;
  String? marketName;
  String? password;
  String? userID;

  UserModel({
    this.message,
    this.status,
    this.depotName,
    this.designation,
    this.empName,
    this.isTourPartialAllow,
    this.locCode,
    this.locName,
    this.mPGroup,
    this.mPOName,
    this.marketName,
    this.password,
    this.userID,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    status = json['Status'];
    depotName = json['DepotName'];
    designation = json['Designation'];
    empName = json['EmpName'];
    isTourPartialAllow = json['IsTourPartialAllow'];
    locCode = json['LocCode'];
    locName = json['LocName'];
    mPGroup = json['MPGroup'];
    mPOName = json['MPOName'];
    marketName = json['MarketName'];
    password = json['Password'];
    userID = json['UserID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['Status'] = this.status;
    data['DepotName'] = this.depotName;
    data['Designation'] = this.designation;
    data['EmpName'] = this.empName;
    data['IsTourPartialAllow'] = this.isTourPartialAllow;
    data['LocCode'] = this.locCode;
    data['LocName'] = this.locName;
    data['MPGroup'] = this.mPGroup;
    data['MPOName'] = this.mPOName;
    data['MarketName'] = this.marketName;
    data['Password'] = this.password;
    data['UserID'] = this.userID;
    return data;
  }

  factory UserModel.error(String message, String status) {
    return UserModel(message: message, status: status);
  }
}
