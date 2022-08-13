import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../keys.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({Key? key}) : super(key: key);

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 500,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                    ),
                    itemBuilder: (context, index) {
                      return Container();
                    }),
              ),
              const SizedBox(height: 15),
              IconButton(
                  iconSize: 50,
                  onPressed: () => getAllPhotos(),
                  icon: const Icon(Icons.download))
            ],
          ),
        ),
      ),
    );
  }

  Future getAllPhotos() async {
    final uri =
        Uri.parse('https://api.unsplash.com/photos?page=1&client_id=$unsplashApiKey');
    final request = await http.get(uri);

    print(request.body);
  }
}
