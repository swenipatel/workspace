import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: RegistrationForm()));
}

class RegistrationForm extends StatefulWidget {
@override
_RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String phone = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration Form")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [

                // Name
                TextFormField(
                  decoration: InputDecoration(labelText: "Name"),
                  validator: (value) =>
                  value!.isEmpty ? "Enter Name" : null,
                  onSaved: (value) => name = value!,
                ),

                // Email
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return "Enter Valid Email";
                    }
                    return null;
                  },
                  onSaved: (value) => email = value!,
                ),

                // Phone
                TextFormField(
                  decoration: InputDecoration(labelText: "Phone Number"),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.length != 10) {
                      return "Enter 10 digit phone number";
                    }
                    return null;
                  },
                  onSaved: (value) => phone = value!,
                ),

                // Password
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
                  child: Text("Register"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print("Name: $name");
                      print("Email: $email");
                      print("Phone: $phone");
                      print("Password: $password");
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}