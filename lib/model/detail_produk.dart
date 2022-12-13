import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled12/model/produk.dart';
import 'package:untitled12/services/provider_produk.dart';

class DetailProduk extends StatelessWidget{
  final Product detailProduk;
  const DetailProduk({Key? key,required this.detailProduk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Produk'),),
      body: ListView(
      children: [

Image.network(detailProduk.thumbnail),

        Row(children: [


          Padding(padding: EdgeInsets.only(left: 10,top: 28,right: 10,bottom: 28)),
          Text(detailProduk.title,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w900),),
        ],),

          Row(
              children: [
          Padding(padding: EdgeInsets.only(left: 10,top: 28,right: 10,bottom: 28)),
                Image.network(detailProduk.images[0], width: 80),
                SizedBox(width: 8),
                // Image.network(detailProduk.images[1], width: 80),
                // SizedBox(width: 8),
          SizedBox(width: 250),


    ]
          ),

      Container( child:

          Card( color: Colors.blueGrey.shade100,

            child:

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 4)),
          Text('Deskripsi: ',style:
          TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.indigo.shade900),),
          Text(detailProduk.description,style:
          TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
        SizedBox(height: 10),
          Text('Price: ',style:
          TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.indigo.shade900),),
          Text('\$'+detailProduk.price.toString(),style:
          TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),

          SizedBox(height: 10),
          Text('Discount: ',style:
          TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.indigo.shade900),),
          Text('\$'+detailProduk.discountPercentage.toString(),style:
          TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),


        SizedBox(height: 10),
        Text('Rating: ',style:
        TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.indigo.shade900),),
        Text(detailProduk.rating.toString(),style:
        TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),

          SizedBox(height: 10),

          Text('Stock: ',style:
          TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.indigo.shade900),),
          Text(detailProduk.stock.toString(),style:
          TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),

          SizedBox(height: 10),
          Text('Brand: ',style:
          TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.indigo.shade900),),
          Text(detailProduk.brand,style:
          TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),


          SizedBox(height: 10),
          Text('Category: ',style:
          TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.indigo.shade900),),
          Text(detailProduk.category,style:
          TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),


        ],

      ),
      ))] ),
    );
  }
}