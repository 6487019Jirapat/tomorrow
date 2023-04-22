import 'package:dots_indicator/dots_indicator.dart';

//this is the indicator for the dot indicator
int currentSelected = 0;

//this class was created to store the image urls and save functions for actions taken in the app
class CardData {
  List<String> cardImageUrl = [
    'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1641924898-41cJs3cRPYL._SL500_.jpg?crop=1xw:1.00xh;center,top&resize=980:*',
    'https://images.ov.app/eyJidWNrZXQiOiJvdi1lbXMiLCJrZXkiOiJtZWRpYS9wcm9kdWN0cy9kb2luZy10aGluZ3MtaGF0L292LWJsdWUvVTYwMTY0MC1SQ04tUk9ZX0RvaW5nX1RoaW5nc19IYXRfT1ZfQmx1ZV9BTkdMRS5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsiZml0IjoiaW5zaWRlIiwiaGVpZ2h0IjoxMDAwMCwid2lkdGgiOjYwMH0sInRvRm9ybWF0Ijoid2VicCJ9fQ==',
    'https://www.charleskeith.co.th/dw/image/v2/BCWJ_PRD/on/demandware.static/-/Sites-th-products/default/dw258196f5/images/hi-res/2022-L2-CK1-71720031-01-1.jpg?sw=1152&sh=1536',
    'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/456261/sub/goods_456261_sub14.jpg?width=750',
    'https://img.buzzfeed.com/buzzfeed-static/static/2023-04/3/20/campaign_images/b07763346caa/these-relatively-cheap-sunglasses-block-uv-light--2-1368-1680553958-0_dblbig.jpg?resize=1200:*',
    'https://cdn.shopify.com/s/files/1/0236/0328/2000/products/Drinkware_Tumbler_30oz_Seafoam_Studio_PrimaryB.png?v=1662474483&width=768',
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
