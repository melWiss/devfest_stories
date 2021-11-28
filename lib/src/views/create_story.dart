import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfest_stories/src/models/story.dart';
import 'package:flutter/material.dart';

class CreateStoryScreen extends StatelessWidget {
  const CreateStoryScreen({Key? key, required this.image}) : super(key: key);
  final File image;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a description"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: null,
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Write some description here...",
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  // imageUrl: stories[0].imgUrl!,
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Submit"),
        icon: const Icon(Icons.file_upload_outlined),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
