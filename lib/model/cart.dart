import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled12/model/produk.dart';
import 'package:untitled12/services/provider_produk.dart';

class CartProduk extends StatelessWidget{
  final Product detailProduk;
  const CartProduk({Key? key,required this.detailProduk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product'),),
      body: ListView(
          children: [



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [



              Padding(padding: EdgeInsets.all(2)),
              Text(detailProduk.title,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w900),),
          
              Image.network(detailProduk.thumbnail,width: 60,),
              Text('Price: \$ : '+detailProduk.price.toString(),style:
              TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),

            ],),

            SizedBox(height: 50),


            Container( child:

            Card( color: Colors.blueGrey.shade100,

              child:

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 4)),



                  SizedBox(height: 10),
                  Text('Discount: ',style:
                  TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.indigo.shade900),),
                  Text('\$'+detailProduk.discountPercentage.toString(),style:
                  TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),




                  SizedBox(height: 30),

                  ElevatedButton(

                    child: Text('Pay',style: TextStyle(color:Colors.white, fontWeight: FontWeight.w300)),
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return  CartProduk(detailProduk: detailProduk);
                      },),);},style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(5),
                      primary: Colors.indigo.shade400,

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))

                  ),

                  ),

                ],

              ),
            ))] ),
    );
  }
}