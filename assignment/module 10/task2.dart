import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  final controller = TextEditingController();

  void sendMessage() {
    FirebaseFirestore.instance.collection("messages").add({
      "message": controller.text,
      "time": Timestamp.now(),
    });
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("messages")
                  .orderBy("time")
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();

                final docs =
                    snapshot.data!.docs;

                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(docs[index]["message"]),
                    );
                  },
                );
              },
            ),
          ),
          TextField(controller: controller),
          ElevatedButton(
            onPressed: sendMessage,
            child: Text("Send"),
          )
        ],
      ),
    );
  }
}