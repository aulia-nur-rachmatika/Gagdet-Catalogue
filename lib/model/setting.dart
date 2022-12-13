import 'package:flutter/material.dart';


void main() {
  runApp(Setting());
}
class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon:Icon(Icons.arrow_back),onPressed:() => Navigator.of(context).pop(),),

          title: Text('Settings'),
          actions: [
            Icon(Icons.search),
            Padding(padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.menu),)
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children:<Widget> [
            ListTile(title: Text('Account',style: TextStyle(fontSize: 15,color: Colors.blue),),),
            ListTile(title: Text('+6281234567890',style: TextStyle(fontSize: 17),),
              subtitle: Text('Phone Number',style: TextStyle(fontWeight: FontWeight.w100)),
            ),
            ListTile(title: Text('aulianurrachmatika02@gmail.com',style: TextStyle(fontSize: 17,),),
              subtitle: Text('Username',style: TextStyle(fontWeight: FontWeight.w100),),
            ),
            ListTile(
              title: Text('Settings',style: TextStyle(fontSize: 15,color: Colors.blueAccent)),

            ),
            ListTile(
              title: Text('Notifications and Sounds'),
              leading: Icon(Icons.notifications),

            ),
            ListTile(
              title: Text('Privacy and Security'),
              leading: Icon(Icons.lock),

            ),
            ListTile(
              title: Text('Data and Storage'),
              leading: Icon(Icons.data_usage_sharp),

            ),
            ListTile(
              title: Text('Chat Settings'),
              leading: Icon(Icons.chat),

            ),
            ListTile(
              title: Text('Language'),
              leading: Icon(Icons.language),

            )

          ],
        ),
      ),
    );



  }
}






