




import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobicom/features/data/onboarding_data.dart';
import 'package:mobicom/features/home_screen.dart';
import 'package:mobicom/localdatabase/share_preference_manager.dart';
import 'package:mobicom/widgets/boarding_screen_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({ Key? key }) : super(key: key);

  static String name ='/boarding';
  

  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {  
  final _pagecontroler = PageController();
  bool isLastIndex = false;

  @override
  void dispose() {

    _pagecontroler.dispose();
    super.dispose();
  }

  void next() async {
      if (!isLastIndex){
        _pagecontroler.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
      }else{
        SharedPreferencesManager.setShowOnBoarding(true);
        Get.off(()=> const HomeScreen());
      }
  }


  void skip(){
   _pagecontroler.animateToPage(boarding_data.length - 1, duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: Stack(
    children: [
      
      
      PageView.builder(
        onPageChanged: (index){
          setState(() {
            isLastIndex = index == boarding_data.length - 1;
          });
        },
        physics: ClampingScrollPhysics(),
        controller: _pagecontroler,
        itemCount: boarding_data.length,
        itemBuilder: (context,index) => BoardingScreenWidget(boarding: boarding_data[index]),
      ),
      if(!isLastIndex) Positioned( 
        top: 40,
        right: 20,
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black.withOpacity(0.4),
            padding: const EdgeInsets.symmetric(horizontal: 16,)),
          onPressed:skip, child: Text('Skip'.toUpperCase(), style:   Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),),  ).animate().scale(),
                  ),

      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, ),
         
          decoration: const BoxDecoration(
          ),
          child: Container(
            padding: const EdgeInsets.only(bottom: 20),
            
         
            child:Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SmoothPageIndicator(
                  onDotClicked: (index) => _pagecontroler.animateToPage(index, duration: const Duration(milliseconds: 600), curve: Curves.easeIn),
                controller: _pagecontroler,
                count: boarding_data.length,
                effect:  ScrollingDotsEffect(
                  spacing: 12,
                  activeDotColor: Colors.white.withOpacity(0.80),
                  dotColor : Colors.grey.withOpacity(0.30),
                  activeDotScale: 1.5,
                  dotHeight: 14,
                  dotWidth: 14,

                ),
              ),
               Gap(MediaQuery.of(context).size.height * 0.05),
                SizedBox( width:double.infinity,child: ElevatedButton(onPressed: next, child: Text( isLastIndex ? 'Get Started'.toUpperCase() :'NEXT'.toUpperCase(), style:  const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,  ),)
                )
                ).animate().fadeIn(),
              ],
            )
          ),
        ),
      ),
    ],
  ),
);
  }
}