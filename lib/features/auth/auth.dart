import 'package:eccomerce/common/widgets/custom_button.dart';
import 'package:eccomerce/common/widgets/custom_textField.dart';
import 'package:eccomerce/constants/global_Variable.dart';
import 'package:flutter/material.dart';

enum Auth { signUp, signIn }

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";

  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final _singUpKey = GlobalKey<FormState>();
  final _singInKey = GlobalKey<FormState>();
  Auth auth = Auth.signUp;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            ListTile(
              tileColor: auth == Auth.signUp
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: Text('Create Account',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signUp,
                groupValue: auth,
                onChanged: (Auth? val) {
                  setState(() {
                    auth = val!;
                  });
                },
              ),
            ),
            if (auth == Auth.signUp)
              Container(
                color: GlobalVariables.backgroundColor,
                padding: EdgeInsets.all(8),
                child: Form(
                    key: _singUpKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: "Name",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _emailController,
                          hintText: "Email",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(onTap: () {}, text: "Sign Up")
                      ],
                    )),
              ),
            ListTile(
              tileColor: auth == Auth.signIn
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: Text(
                'Sign In',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signIn,
                groupValue: auth,
                onChanged: (Auth? val) {
                  setState(() {
                    auth = val!;
                  });
                },
              ),
            ),
            if (auth == Auth.signIn)
              Container(
                color: GlobalVariables.backgroundColor,
                padding: EdgeInsets.all(8),
                child: Form(
                    key: _singInKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailController,
                          hintText: "Email",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(onTap: () {}, text: "Sign In")
                      ],
                    )),
              ),
          ],
        ),
      )),
    );
  }
}
