import 'package:dots_indicator/dots_indicator.dart';

//this is the indicator for the dot indicator
int currentSelected = 0;

//this class was created to store the image urls and save functions for actions taken in the app
class CardData {
  List<String> cardImageUrl = [
    'https://i0.wp.com/emilylightly.com/wp-content/uploads/2022/03/IMG_1695.jpeg?resize=600%2C873&ssl=1',
    'https://i0.wp.com/emilylightly.com/wp-content/uploads/2022/03/IMG_1689.jpeg?resize=600%2C884&ssl=1',
    'https://i0.wp.com/emilylightly.com/wp-content/uploads/2022/12/IMG_1835.jpg?resize=768%2C956&ssl=1',
    'https://i0.wp.com/emilylightly.com/wp-content/uploads/2021/02/IMG_1332.png?resize=600%2C883&ssl=1',
    'https://i0.wp.com/emilylightly.com/wp-content/uploads/2018/08/Capsule-Wardrobe-for-Men-Outfit-9.png?resize=683%2C1024&ssl=1',
    'https://i0.wp.com/emilylightly.com/wp-content/uploads/2022/12/IMG_1846.jpg?resize=768%2C923&ssl=1',
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
