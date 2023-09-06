import 'package:bzu_online_route_tracking_app/dashboard.dart';
import 'package:bzu_online_route_tracking_app/driver/driver_move.dart';
import 'package:bzu_online_route_tracking_app/driver/enter_location.dart';
import 'package:bzu_online_route_tracking_app/registration.dart';
import 'package:bzu_online_route_tracking_app/utils/utils.dart';
import 'package:bzu_online_route_tracking_app/widget/buttton.dart';
import 'package:bzu_online_route_tracking_app/widget/text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.025,
              ),
              Center(
                child: CircleAvatar(
                  radius: 54,
                  child: Image.asset('img/buses.png'),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.025,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Text(
                  "Welcome back! Glad to see you, Again!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.025,
              ), //email
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextInputField(
                  controller: _emailController,
                  labelText: 'Enter Email',
                  icon: Icons.email,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.025,
              ), //password
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextInputField(
                  controller: _passwordController,
                  labelText: 'Enter Password',
                  icon: Icons.password,
                  isObscure: true,
                ),
              ),
              //forgot password
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             const ForgotPasswordScreen()));
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color(0xFF6A707C),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.025,
              ), //login button
              Center(
                  child: button(
                      ontap: () {
                        if (_emailController.text.toString() ==
                                'driver@gmail.com' &&
                            _passwordController.text.toString() ==
                                'driver123') {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => drivermovement()));
                        } else {
                          auth
                              .signInWithEmailAndPassword(
                                  email: _emailController.text.toString(),
                                  password: _passwordController.text.toString())
                              .then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                            utils().toast('Successfully Login');
                          }).onError((error, stackTrace) {
                            utils().toast(error.toString());
                          });
                        }
                      },
                      txt: '             Login           ')),
              SizedBox(
                height: screenHeight * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: Color(0xFF35C2C1),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
