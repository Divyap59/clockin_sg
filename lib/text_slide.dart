// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// class ManualSlide extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return ManualSlideState();
//   }
// }

// class ManualSlideState extends State<ManualSlide> {
//   @override
//   Widget build(BuildContext context) {
//     CarouselController carouselController = new CarouselController();

//     return Scaffold(
//       body: Center(
//           child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//         CarouselSlider(
//           items: [
//             MyImageView("images/nature1.jpg"),
//             MyImageView("images/nature2.jpg"),
//             MyImageView("images/nature3.jpg"),
//             MyImageView("images/nature4.jpg"),
//             MyImageView("images/nature5.jpg"),
//             MyImageView("images/nature6.jpg"),
//           ],
//           options: CarouselOptions(
//             height: MediaQuery.of(context).size.height * 0.2,
//           ),
//           carouselController: carouselController,
//         ),
//         //  height: MediaQuery.of(context).size.height * 0.2,
//         //           width: MediaQuery.of(context).size.width - 80,
//         SizedBox(
//           height: 30,
//         ),
//       ])),
//     );
//   }
// }

// class MyImageView extends StatelessWidget {
//   String imgPath;

//   MyImageView(this.imgPath);

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//         margin: EdgeInsets.symmetric(horizontal: 5),
//         child: FittedBox(
//           fit: BoxFit.fill,
//           child: Image.asset(imgPath),
//         ));
//   }
// }
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
//import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:zippy/api/api.dart';
// import 'package:zippy/helper/color_constant.dart';
// import 'package:zippy/helper/helper.dart';
// import 'package:zippy/helper/string_constant.dart';
// import 'package:zippy/model/home_slider_model.dart';
// import 'package:zippy/widget/widget_image.dart';

// class WidgetImageSlider extends StatelessWidget {
//   // Future getSliderImage(BuildContext context) async {
//   //   return await API.getHomeSlider(context);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return
//     FutureBuilder(
//       future: getSliderImage(context),
//       builder: (ctx, asyncSnapshot) {
//         return asyncSnapshot.data == null
//             ? Container(height: 0)
//             : SliderItem(asyncSnapshot: asyncSnapshot.data);
//       },
//     );
//   }
// }

class SliderItem extends StatefulWidget {
  // final List<HomeSliderItem> asyncSnapshot;
  // SliderItem({this.asyncSnapshot});

  @override
  _SliderItemState createState() => _SliderItemState();
}

class _SliderItemState extends State<SliderItem> {
  List<String> sliderImage = [
    'Over 25 years monitoring trials from pre-site selection to closeout. Contact us today! CMX Research has the proficiency and skill to best monitor your BA/BE or Phase I-IV trial. ICH GCP Compliant.',
    'Learn More! Worldwide Offers Therapeutic Expertise & Vital Strategic Services. Award-Winning. Global Expertise. 30 Years of Experience. Advanced Workflow Process. Innovative Solutions',
    'Over 50 Years’ Experience - A Unique Culture Delivering Exceptional Solutions. Expert regulatory support. Flexible CDx development. Custom assay development. Software development. Tailored solutions. Services: Biomarker Discovery, Custom Assay Development, Custom Validation, DNA & RNA Panels, Flexible CDx Development, Expert Regulatory Support.',
  ];
  int _sliderIndex = 0;
  final _totalDots = 5;
  double _currentPosition = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          itemCount: sliderImage.length,
          itemBuilder: (context, index, _) {
            // HomeSliderItem sliderImage = widget.asyncSnapshot[index];
            return Container(
              //height: 100,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '^^',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromRGBO(255, 197, 15, 1)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      sliderImage[index],
                      style: GoogleFonts.arimo(color: Colors.black),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            );
          },
          options: CarouselOptions(
            viewportFraction: 1,
            initialPage: 0,
            height: MediaQuery.of(context).size.height * 0.15,
            onPageChanged: (index, carouselPageChangedReason) {
              setState(() {
                _sliderIndex = index;
                _currentPosition = _sliderIndex.toDouble();
              });
            },
          ),
        ),
        new DotsIndicator(
          decorator: DotsDecorator(
              color: Colors.grey, activeColor: Color.fromRGBO(255, 197, 15, 1)),
          dotsCount: sliderImage.length,
          position: _currentPosition,
          onTap: (pos) {
            setState(() {
              _currentPosition = pos;
            });
          },
        )
      ],
    );
  }
}
