import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled12/model/produk.dart';
import 'package:untitled12/services/provider_produk.dart';
import 'package:untitled12/homepage.dart';
import 'package:untitled12/model/setting.dart';
import 'package:untitled12/login.dart';

class BuyProduk extends StatelessWidget{
  final Product detailProduk;
  const BuyProduk({Key? key,required this.detailProduk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product'),),
      body: ListView(
          children: [

            Image.network(detailProduk.thumbnail),

            Row(children: [


              Padding(padding: EdgeInsets.only(left: 10,top: 28,right: 10,bottom: 28)),
              Text(detailProduk.title,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w900),),
            ],),



            Container( child:

            Card( color: Colors.blueGrey.shade100,

              child:

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 4)),

                  Text('Price: ',style:
                  TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.indigo.shade900),),
                  Text('\$'+detailProduk.price.toString(),style:
                  TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),

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
                        return  BuyProduk(detailProduk: detailProduk);
                      },),);},style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(5),
                      primary: Colors.indigo.shade400,

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))

                  ),

                  ),

                ],

              ),
            ))] ),

        drawer:Drawer(
            child: ListView(
                children: [
                  InkWell(
                    child:
                    UserAccountsDrawerHeader(
                        accountName:Text("Aulia Nur Rachmatika"),accountEmail: Text('aulianurrachmatika02@gmail.com')),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute
                        (builder: (context){
                        return HomePage();},));},),

                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text('Catalogue Product'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute
                        (builder: (context){
                        return HomePage();
                      },
                      ));
                    },

                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute
                        (builder: (context){
                        return Setting();
                      },
                      ));
                    },

                  ),

                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Logout'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute
                        (builder: (context){
                        return LoginPage();
                      },
                      ));
                    },

                  )

                ]))
    );
  }
}