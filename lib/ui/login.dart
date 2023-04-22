import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather_app/ui/home_page.dart';


import '../auth.dart';
import 'login.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget title() {
    return const Text("Tomorrow");
  }

  Widget entryFieldEmail(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget entryFieldPassword(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      obscureText: true,
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: signInWithEmailAndPassword,
      child: Text("Login"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title(),
      ),
      backgroundColor: Color.fromARGB(255, 15, 153, 196),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 15, 153, 196),
            Color.fromARGB(255, 9, 114, 201),
            Color.fromARGB(255, 9, 58, 221)
          ],
        )),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                  children: [
                    Image.asset("assets/al_T.png",scale: 12,),
                    Image.asset("assets/al_O.png",scale: 12,),
                    Image.asset("assets/al_M.png",scale: 12,),
                    Image.asset("assets/al_O.png",scale: 12,),
                    Image.asset("assets/al_R.png",scale: 12,),
                    Image.asset("assets/al_R.png",scale: 12,),
                    Image.asset("assets/al_O.png",scale: 12,),
                    Image.asset("assets/al_W.png",scale: 12,),
                  ],
                ),
              SizedBox(height: 30,),
              entryFieldEmail('Email', _controllerEmail),
              entryFieldPassword('Password', _controllerPassword),
              _errorMessage(),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
