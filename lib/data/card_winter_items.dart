import 'package:dots_indicator/dots_indicator.dart';

//this is the indicator for the dot indicator
int currentSelected = 0;

//this class was created to store the image urls and save functions for actions taken in the app
class CardData {
  List<String> cardImageUrl = [
    'https://www.tretorn.eu/pub_images/original/475862072_1.jpg?extend=copy&width=1024&method=fit&height=1024&type=webp&timestamp=1630670831',
    'https://www.cerave.com/-/media/project/loreal/brand-sites/cerave/americas/us/products-v3/daily-moisturizing-lotion/700x875/cerave_daily_moisturizing_lotion_12oz_front-700x875-v2.jpg?rev=390aa8f6818341be8949c710c247a7f6?w=500&hash=8B58F750C69AB7ACE1FD33F64FA446B6',
    'https://cdni.llbean.net/is/image/wim/518006_53148_41?hei=1095&wid=950&resMode=sharp2&defaultImage=llbprod/A0211793_2',
    'https://th.louisvuitton.com/images/is/image/lv/1/PP_VP_L/%E0%B8%AB%E0%B8%A5%E0%B8%B8%E0%B8%A2%E0%B8%AA%E0%B9%8C-%E0%B8%A7%E0%B8%B4%E0%B8%95%E0%B8%95%E0%B8%AD%E0%B8%87-%E0%B8%9C%E0%B9%89%E0%B8%B2%E0%B8%9E%E0%B8%B1%E0%B8%99%E0%B8%84%E0%B8%AD%E0%B8%A3%E0%B8%B8%E0%B9%88%E0%B8%99-jhelam-s00-%E0%B8%9C%E0%B9%89%E0%B8%B2%E0%B8%9E%E0%B8%B1%E0%B8%99%E0%B8%84%E0%B8%AD%E0%B8%AA%E0%B8%B3%E0%B8%AB%E0%B8%A3%E0%B8%B1%E0%B8%9A%E0%B8%9C%E0%B8%B9%E0%B9%89%E0%B8%8A%E0%B8%B2%E0%B8%A2--M75364_PM2_Front%20view.png?wid=1240&hei=1240',
    'https://s.catch.com.au/images/product/0088/88825/63292eda83bc5153882232_w803h620.webp',
    //'https://i0.wp.com/emilylightly.com/wp-content/uploads/2022/12/IMG_1846.jpg?resize=768%2C923&ssl=1',
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
