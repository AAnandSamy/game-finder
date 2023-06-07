import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import 'home_page.dart';
import 'package:logger/logger.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool _isHidden = true;
  bool loading = false;
  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background clolor from m-3
      body: _buildContainer(context),
    );
  }

  Widget _buildContainer(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //logo
              const Icon(
                Icons.diamond,
                size: 150,
                color: Colors.teal,
              ),
              // social login
              const SizedBox(height: 50),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.google,
                      mode: SocialLoginButtonMode.single,
                      text: '',
                      onPressed: () {},
                    ),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.facebook,
                      mode: SocialLoginButtonMode.single,
                      text: '',
                      onPressed: () {},
                    ),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.apple,
                      mode: SocialLoginButtonMode.single,
                      text: '',
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Text(' Or continue with '),
                  Expanded(child: Divider()),
                ],
              ),
              //user name
              const SizedBox(height: 50),
              TextField(
                  controller:
                      emailController, // Assign controller to the TextField
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    hintText: 'Email Address',
                    labelText: 'Email Address',
                  )),
              const SizedBox(height: 20),
              // password
              TextField(
                  controller:
                      passwordController, // Assign controller to the TextField
                  obscureText: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    filled: true,
                    hintText: 'Password',
                    labelText: 'Password',
                    suffix: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  )),
              const SizedBox(height: 10),
              // forgot password
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot paassword?',
                  ),
                ],
              ),
              //sing in  buttion
              const SizedBox(height: 10),
              loading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: FilledButton(
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          if (emailController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("All fields are required!"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            User? result = await AuthService().login(
                                emailController.text,
                                passwordController.text,
                                context);
                            if (result != null) {
                              print("Success");
                              logger.i("logged in");

                              print(result.email);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Homescreen(result)),
                                  (route) => false);
                            }
                          }
                          setState(() {
                            loading = false;
                          });
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              // registor now
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(' Not a member?'),
                  SizedBox(width: 5),
                  Text(
                    'Register now',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
