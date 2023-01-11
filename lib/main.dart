import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(key: Key('id_loginpage'),),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final snackBarSuccess = const SnackBar(
    content: Text('Success',key: Key('id_success_text'),),
    backgroundColor: Colors.green,
  );
  final snackBarFailure = const SnackBar(
    content: Text('Failure',key: Key('id_failure_text'),),
    backgroundColor: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('id_scaffold'),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  }
                  // add more validation logic if needed
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  }
                  // add more validation logic if needed
                  return null;
                },
              ),
              const SizedBox(height: 20),
              RaisedButton(
                child: const Text("LOGIN"),
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    // try to login with the email and password
                    // if success show message otherwise show error
                    bool allowLogin = validateCredentials(_emailController.text, _passwordController.text);
                    if(allowLogin){
                      ScaffoldMessenger.of(context).showSnackBar(snackBarSuccess);
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(snackBarFailure);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateCredentials(String e,String p){
    if(e == "email" && p == "password"){
      return true;
    }
    return false;
  }
}

