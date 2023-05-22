import 'package:flutter/material.dart';
import 'package:pocket_task/dashboard.dart';
import 'package:pocket_task/tutorials/tutorial1.dart';
import 'package:pocket_task/tutorials/tutorial2.dart';
import 'package:pocket_task/tutorials/tutorial3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class TutorialPage extends StatelessWidget {

  //controller to keep track of which page we're on
  PageController controller= PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Dashboard()));
          },
          icon: const Icon(Icons.close,
          size:40,
          color: Colors.black,),

        ),
      ),
      body: Stack(
        children: [
          // PageView
          PageView(
            controller: controller,
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          //dot indicators
          Container(
            alignment: const Alignment(0,0.8),
            child: SmoothPageIndicator (controller: controller,count:3),
          ),
        ],
      )
    );
  }
}



