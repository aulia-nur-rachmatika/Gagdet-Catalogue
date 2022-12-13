
import 'package:untitled12/model/user_model.dart';

class MyResponse<T>{
  int code;
  String message;
  T? data;

  MyResponse({this.code= 0,this.message="",this.data});

  factory MyResponse.fromJson(
      Map<String, dynamic> json, Function fromJsonModel){
    return MyResponse(
      code: json['code'],
      message: json['message'],
      data: fromJsonModel(json['data']),
    );

  }
  static List<User> listFromJson(list)=>List<User>.from(list.map((x) => User.fromJson(x)));


  }



