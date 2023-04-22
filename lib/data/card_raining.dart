import 'package:dots_indicator/dots_indicator.dart';

//this is the indicator for the dot indicator
int currentSelected = 0;

//this class was created to store the image urls and save functions for actions taken in the app
class CardData {
  List<String> cardImageUrl = [
    'https://i0.wp.com/emilylightly.com/wp-content/uploads/2022/12/IMG_1832.jpg?resize=719%2C1024&ssl=1',
    'https://i0.wp.com/emilylightly.com/wp-content/uploads/2021/10/IMG_1549.jpeg?resize=600%2C874&ssl=1',
    'https://i0.wp.com/emilylightly.com/wp-content/uploads/2022/12/IMG_1828.jpg?resize=680%2C1024&ssl=1',
    'https://i0.wp.com/emilylightly.com/wp-content/uploads/2021/10/IMG_1558.jpeg?resize=600%2C909&ssl=1',
    //'https://images.unsplash.com/photo-1642781148581-64443eaa8dd5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    //'https://images.unsplash.com/photo-1608514737591-8d9be34beeb7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDZ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  ];

  //function to move to next image
  nextImage() {
    if (currentSelected == cardImageUrl.length - 1) {
      currentSelected = 0;
    } else {
      int newlySelected = currentSelected + 1;
      currentSelected = newlySelected;
    }
  }

  //moves to previous image
  previousImage() {
    if (currentSelected == 0) {
      currentSelected = 0;
    } else {
      int newlySelected = currentSelected - 1;
      currentSelected = newlySelected;
    }
  }

  //builds the dot indicator with the dots indicator package
  DotsIndicator buildDotsIndicator() {
    return DotsIndicator(
      dotsCount: cardImageUrl.length,
      position: currentSelected.toDouble(),
    );
  }
}
