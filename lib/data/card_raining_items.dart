import 'package:dots_indicator/dots_indicator.dart';

//this is the indicator for the dot indicator
int currentSelected = 0;

//this class was created to store the image urls and save functions for actions taken in the app
class CardData {
  List<String> cardImageUrl = [
    'https://www.ikea.com/th/en/images/products/knalla-umbrella-black__0934105_pe792338_s5.jpg?f=s',
    'https://i5.walmartimages.com/asr/b7d3d86c-86f2-4368-a534-17135f596d5f.223644c51ede192bb7323ba0dee32cba.jpeg?odnHeight=711&odnWidth=711&odnBg=FFFFFF&odnDynImageQuality=70',
    'https://contents.mediadecathlon.com/p2153640/d818821b08b26e91eb24f5debc5bc736/p2153640.jpg?f=480x480&format=auto',
    'https://mobileimages.lowes.com/productimages/4f2a1752-8249-45e7-a96d-cd54a28c69d4/11227366.jpg?size=xl',
    //'https://img.ltwebstatic.com/images3_pi/2021/08/05/162815498511e819b0456214ba6545dab9427bd934_thumbnail_900x.webp',
    'https://img.my-best.in.th/product_images/7c3666e56b5c2cde56d3fc58ced39b12.jpeg?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=4df5b512f3c093d9ba2aa53a392f4515',
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
