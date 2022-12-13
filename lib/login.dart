import 'package:flutter/material.dart';

import 'homepage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//Text Controllers
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(145, 209, 220, 1.0),
      body: Container(

        padding: EdgeInsets.only(left: 20,bottom: 20,right: 20,top: 250),

        decoration: BoxDecoration(


          gradient: LinearGradient(
              begin: Alignment.topLeft,

              colors: [


                Color.fromRGBO(65, 160, 184, 1.0),
                Color.fromRGBO(132, 184, 166, 1.0),
                Color.fromRGBO(150, 189, 219, 1.0),
                //Color.fromRGBO(255, 210, 118, 1.0),
                Color.fromRGBO(145, 209, 220, 1.0),

              ]
          ),
        ),

        child: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                'Hello there!',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),

              const SizedBox(height: 30),

              //Email Text Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username',
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              //Password Text Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              //Signin Button
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      if (_emailController.text == 'aulia' &&
                          _passwordController.text == '123') {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const HomePage();
                            },
                          ),
                        );
                      } else if (_emailController.text == '' ||
                          _passwordController.text == '') {
                        const snackBar = SnackBar(
                          content: Text('field shouldnt be empty'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        const snackBar = SnackBar(
                          content: Text(
                              'Email or password is not correct. Try again !'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.green[400],
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}