import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather_app/ui/login.dart';
import 'package:weather_app/ui/register.dart';

class Register_Login extends StatelessWidget {
  const Register_Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 153, 196),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 9, 58, 221),
            Color.fromARGB(255, 9, 114, 201),
            Color.fromARGB(255, 15, 153, 196)
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/al_T.png",
                      scale: 11,
                    ),
                    Image.asset(
                      "assets/al_O.png",
                      scale: 11,
                    ),
                    Image.asset(
                      "assets/al_M.png",
                      scale: 11,
                    ),
                    Image.asset(
                      "assets/al_O.png",
                      scale: 11,
                    ),
                    Image.asset(
                      "assets/al_R.png",
                      scale: 11,
                    ),
                    Image.asset(
                      "assets/al_R.png",
                      scale: 11,
                    ),
                    Image.asset(
                      "assets/al_O.png",
                      scale: 11,
                    ),
                    Image.asset(
                      "assets/al_W.png",
                      scale: 11,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: Image.asset("assets/duck.png"),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Register();
                        }));
                      },
                      icon: Icon(Icons.add),
                      label: Text(
                        "Register",
                        style: TextStyle(fontSize: 20),
                      )),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Login();
                        }));
                      },
                      icon: Icon(Icons.login),
                      label: Text(
                        "Login",
                        style: TextStyle(fontSize: 20),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
