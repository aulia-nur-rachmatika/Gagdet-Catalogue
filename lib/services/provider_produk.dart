import 'package:untitled12/model/produk.dart';
import 'package:untitled12/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class ProdukProvider extends ChangeNotifier{
  List<Product> product =[];
  bool isLoading = true;

  ProdukProvider(){
    getData();
  }

  void getData(){
    isLoading=true;
    notifyListeners();
    api.getProduk().then((value){
      isLoading = false;
      if(value!=null){
        product=value;
      }
      notifyListeners();

    });
  }
}