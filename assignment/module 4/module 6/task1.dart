import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: LoginForm()));
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Form")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              // Email Field
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Email";
                  }
                  if (!value.contains('@')) {
                    return "Enter Valid Email";
                  }
                  return null;
                },
                onSaved: (value) => email = value!,
              ),

              // Password Field
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "Password must be 6+ characters";
                  }
                  return null;
                },
                onSaved: (value) => password = value!,
              ),

              SizedBox(height: 20),

              ElevatedButton(
                child: Text("Login"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print("Email: $email");
                    print("Password: $password");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}