import 'package:flutter/material.dart';
import 'package:untitled12/login.dart';
import 'package:untitled12/model/cart.dart';
import 'package:untitled12/model/setting.dart';
import 'package:untitled12/services/provider_produk.dart';
import 'package:untitled12/model/produk.dart';
import 'package:provider/provider.dart';
import 'package:untitled12/model/detail_produk.dart';
import 'package:untitled12/model/buyProduct.dart';
import 'package:untitled12/model/setting.dart';

void main() {
  runApp(HomePage());
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProdukProvider())
        ],
        child: Consumer<ProdukProvider>(builder: (context, produkprovider, _) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Daftar Produk',
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),


                ),
                elevation: 0,
                backgroundColor: Colors.indigo,
                // actions: <Widget>[IconButton(onPressed: () {},
                //   icon: Icon(Icons.shopping_cart),)],

              ),
              body: Padding(
                

                padding: EdgeInsets.all(3),
                child: produkprovider.isLoading
                    ? Center(

                    child: CircularProgressIndicator(
                      color: Color(0xFF37AEEE),
                      //801E48FF
                    ))

                     :
                GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: produkprovider.product.length,
                  itemBuilder: (ctx, index) {
                    Product data = produkprovider.product[index];
                    return InkWell(
                        onTap: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> DetailProduk(detailProduk: data,)
                          ));
                          //detail

                        },

                        child: Card(
                          color:  Colors.white70,
                      child: Container(
                        height: 350,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.all(2),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    data.thumbnail,
                                    width:20,
                                    height: 20,
                                  ),
                                ),
                                Text(
                                  data.title
                                  ,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.blueGrey.shade700
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                     '\$ ' +data.price.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                    SizedBox(width: 28),

                                    Icon(Icons.star,color: Colors.yellow.shade700),
                                    Text(data.rating.toString(),style: TextStyle(fontSize: 18),)
                                  ],
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(

                                      child: Text('Buy',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),

                                      onPressed: (){
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                          return  BuyProduk(detailProduk: data);
                                        },),);},style: ElevatedButton.styleFrom(
                                      primary: Colors.indigo.shade100,
                                        padding: const EdgeInsets.all(8),


                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))
                                    ),
                                    ),
                                    SizedBox(width: 8),
                                    ElevatedButton(

                                      child: Text('Add To Cart',style: TextStyle(color:Colors.white, fontWeight: FontWeight.w300)),
                                      onPressed: (){
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                          return  CartProduk(detailProduk: data,);
                                        },),);},style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(5),
                                          primary: Colors.indigo.shade400,

                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))

                                    ),

                                    ),

                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ));
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 2,
                    mainAxisExtent: 264,
                  ),
                ),
              ),


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

                ])));
        }));}



  }


