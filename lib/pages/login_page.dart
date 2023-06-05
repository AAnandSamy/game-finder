import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background clolor from m-3
      body: _buildContainer(context),
    );
  }

  Widget _buildContainer(BuildContext context) {
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
              const TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                hintText: 'Email',
                labelText: 'Enter your Email',
              )),
              const SizedBox(height: 20),
              // password
              TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    filled: true,
                    hintText: 'password',
                    labelText: 'Enter your Password',
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
              FilledButton(
                onPressed: () {},
                child: const Text('     Sign in     '),
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
