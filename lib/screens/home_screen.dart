import 'package:demo_photo_gallery/json/urls.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   late Future<List<ElementList>> urlsList;

  @override
  void initState() {
    super.initState();
    urlsList = getElementList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ElementList>>(
        future: urlsList,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
                itemBuilder:(context, index) {
                // return Container(
                //   height: 50,
                //   width: 50,
                //   color: Colors.red,
                // );
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child:
                  StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 400,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image:  DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                '${snapshot.data![index].urls.regular}',
                              ),
                            ),
                            color: Colors.red),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Container(
                              height: 70,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                ),
                                // color: Colors.red
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.grey.withOpacity(0.6),
                                      Colors.grey.withOpacity(0),
                                    ]),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                        'https://i.pinimg.com/originals/df/7d/d3/df7dd358c555542cf85c1357ce1fe5a4.jpg',
                                      ),
                                    ),
                                  ),
                                  // SizedBox(width: 30),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Beautiful Girl',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }, staggeredTileBuilder: (int index) {
                    return StaggeredTile.count(1, index.isEven ? 1.2:1.8);
                  },),
                );
                } );
          }else if (snapshot.hasError) {
            return const Center(child:Text('Error'));
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
