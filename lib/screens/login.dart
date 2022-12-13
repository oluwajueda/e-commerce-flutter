import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_flutter_well/components/custom_button.dart';
import 'package:practice_flutter_well/components/custom_text_input.dart';
import 'package:provider/provider.dart';

import '../utils/application_state.dart';
import '../utils/custom_theme.dart';
import '../utils/login_dart.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loadingButton = false;

  Map<String, String> data = {};

  _LoginState() {
    data = LoginData.signIn;
  }

  void switchogin() {
    setState(() {
      if (mapEquals(data, LoginData.signUp)) {
        data = LoginData.signIn;
      } else {
        data = LoginData.signUp;
      }
    });
  }

  loginError(FirebaseAuthException e) {
    if (e.message != "") {
      setState(() {
        _loadingButton = false;
      });
    }
  }

  void loginButtonPressed() {
    setState(() {
      _loadingButton = true;
    });
    ApplicationState applicationState =
        Provider.of<ApplicationState>(context, listen: false);
    if (mapEquals(data, LoginData.signUp)) {
      applicationState.signUp(
          _emailController.text, _passwordController.text, loginError);
    } else {
      applicationState.signIn(
          _emailController.text, _passwordController.text, loginError);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0, bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        data["heading"] as String,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    Text(data["subHeading"] as String,
                        style: Theme.of(context).textTheme.bodySmall)
                  ],
                ),
              ),
              model(data, _emailController, _passwordController),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    child: TextButton(
                        onPressed: switchogin,
                        child: Text(
                          data["footer"] as String,
                          style: Theme.of(context).textTheme.bodyLarge,
                        )),
                  )
                ],
              )
            ],
          ),
        ));
  }

  model(Map<String, String> data, TextEditingController emailController,
      TextEditingController passwordController) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 56),
      decoration: CustomTheme.getCardDecoration(),
      child: Column(
        children: [
          CustomTextInput(
              label: "Your email address",
              placeholder: "email@addres.com",
              icon: Icons.person_outline,
              textEditingController: _emailController),
          CustomTextInput(
              label: "password",
              placeholder: "password",
              password: true,
              icon: Icons.lock_outline,
              textEditingController: _passwordController),
          CustomButton(
            text: data["label"] as String,
            onPress: loginButtonPressed,
            loading: _loadingButton,
          )
        ],
      ),
    );
  }
}
