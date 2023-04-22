import '../data/card_winter.dart';
import 'detail_page_winter.dart';
import 'package:flutter/material.dart';

class HomePage_winter extends StatefulWidget {
  const HomePage_winter({Key? key}) : super(key: key);

  @override
  _HomePage_winterState createState() => _HomePage_winterState();
}

class _HomePage_winterState extends State<HomePage_winter> {
  //calls the function to move to next image
  void buildNextImage() {
    setState(() {
      CardData().nextImage();
    });
  }

  //calls the function to move to previous image
  void buildPreviousImage() {
    setState(() {
      CardData().previousImage();
    });
  }

  //calls the function to move to build dot indicator in this widget
  Widget rebuildDotIndicator() {
    return CardData().buildDotsIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("winter"),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Color.fromARGB(255, 5, 0, 21),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),

                //The gesture detector widget will detect swipes and taps of the image card
                child: GestureDetector(
                  onHorizontalDragEnd: (dragEndDetails) {
                    setState(() {
                      if (dragEndDetails.primaryVelocity! < 0) {
                        // Page forwards
                        buildNextImage();
                      } else if (dragEndDetails.primaryVelocity! > 0) {
                        // Page backwards
                        buildPreviousImage();
                      }
                    });
                  },
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailPage()));
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(
                            CardData().cardImageUrl[currentSelected]),
                        //fit: BoxFit.cover,
                      ),
                    ),
                    height: 500,
                    width: MediaQuery.of(context).size.width - 2 * 54,
                    //The stack widget puts the dot indicator on the image card
                    child: Stack(
                      children: [
                        //Positions the dot indicator at the bottom of the card
                        Positioned(
                          right: 0,
                          left: 0,
                          bottom: 10,
                          child: rebuildDotIndicator(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
