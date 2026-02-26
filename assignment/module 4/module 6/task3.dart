import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: FeedbackForm()));
}

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();

  String selectedCategory = "App";
  bool recommend = false;
  String feedbackText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feedback Form")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Dropdown
              DropdownButtonFormField(
                value: selectedCategory,
                items: ["App", "Website", "Service"]
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
                decoration: InputDecoration(labelText: "Category"),
              ),

              // Checkbox
              CheckboxListTile(
                title: Text("Would you recommend us?"),
                value: recommend,
                onChanged: (value) {
                  setState(() {
                    recommend = value!;
                  });
                },
              ),

              // Feedback Text
              TextFormField(
                decoration: InputDecoration(labelText: "Your Feedback"),
                maxLines: 3,
                validator: (value) =>
                value!.isEmpty ? "Please enter feedback" : null,
                onSaved: (value) => feedbackText = value!,
              ),

              SizedBox(height: 20),

              ElevatedButton(
                child: Text("Submit"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    print("Category: $selectedCategory");
                    print("Recommend: $recommend");
                    print("Feedback: $feedbackText");

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Feedback Submitted")),
                    );
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