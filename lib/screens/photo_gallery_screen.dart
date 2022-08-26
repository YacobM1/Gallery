// import 'dart:async';
//
// import 'package:demo_photo_gallery/json/urls.dart';
// import 'package:demo_photo_gallery/services/network_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
// import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
//
// import '../keys.dart';
//
// class PhotoGallery extends StatefulWidget {
//   const PhotoGallery({Key? key}) : super(key: key);
//
//   @override
//   State<PhotoGallery> createState() => _PhotoGalleryState();
// }
//
// class _PhotoGalleryState extends State<PhotoGallery> {
//   //
//   // Future<List<String>>? images;
//   //
//   // Future<List<String>> getImages() async {
//   //
//   //   List<String> images = [];
//   //
//   //   String url = 'https://api.unsplash.com/photos?page=2&client_id=$unsplashApiKey';
//   //
//   //   NetworkHelper networkHelper = NetworkHelper(url: url);
//   //
//   //   dynamic data = await networkHelper.getData();
//   //
//   //   List<dynamic> photoList = data['hits'] as List;
//   //
//   //   for (int i = 0; i < photoList.length; i++) {
//   //     images.add(photoList[i]['largeImageURL']);
//   //   }
//   //   return images;
//   // }
//
//   late Future<PhotoList> photoListHome;
//
//   @override
//   void initState() {
//     super.initState();
//     photoListHome = getPhotoList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//           child: Container(
//             child:
//                StaggeredGridView.countBuilder(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 12,
//                       mainAxisSpacing: 12,
//                     // itemCount: 12,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         height: 400,
//                         width: 250,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(30),
//                             image:  DecorationImage(
//                               fit: BoxFit.cover,
//                               image: NetworkImage(
//                                 'https://papers.co/wallpaper/papers.co-hk52-girl-glasses-lips-beauty-face-40-wallpaper.jpg',
//                               ),
//                             ),
//                             color: Colors.red),
//                         child: Stack(
//                           alignment: AlignmentDirectional.bottomCenter,
//                           children: [
//                             Container(
//                               height: 70,
//                               width: 250,
//                               decoration: BoxDecoration(
//                                 borderRadius: const BorderRadius.only(
//                                   bottomRight: Radius.circular(30),
//                                   bottomLeft: Radius.circular(30),
//                                 ),
//                                 // color: Colors.red
//                                 gradient: LinearGradient(
//                                     begin: Alignment.bottomCenter,
//                                     end: Alignment.topCenter,
//                                     colors: [
//                                       Colors.grey.withOpacity(0.6),
//                                       Colors.grey.withOpacity(0),
//                                     ]),
//                               ),
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Padding(
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 8, vertical: 8),
//                                     child: CircleAvatar(
//                                       radius: 25,
//                                       backgroundImage: NetworkImage(
//                                         'https://i.pinimg.com/originals/df/7d/d3/df7dd358c555542cf85c1357ce1fe5a4.jpg',
//                                       ),
//                                     ),
//                                   ),
//                                   // SizedBox(width: 30),
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: const [
//                                       Text(
//                                         'Beautiful Girl',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     }, staggeredTileBuilder: (int index) {
//                         return StaggeredTile.count(1, index.isEven ? 1.2:1.8);
//                },),
//               ),
//           ),
//         );
//   }
//
//   // Future getAllPhotos() async {
//   //   final uri =
//   //       Uri.parse('https://api.unsplash.com/photos?page=1&client_id=$unsplashApiKey');
//   //   final request = await http.get(uri);
//   //
//   //   print(request.body);
//   // }
// }
