import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(6,173,115,1),
                Color.fromARGB(100,6, 185, 135),
               ],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 73),
              child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Icon(Icons.arrow_left,color: Colors.white,),
                    Icon(Icons.logout,color: Colors.white,),
                  ],
                ),
                SizedBox(
                height: 20,
                ),
                Text('Dashboard',
                textAlign: TextAlign.center,
                style: TextStyle(
                color: Colors.white,
                  fontWeight: FontWeight.w600,
                fontSize: 25,
                fontFamily: 'Poppins',
                 ),),
                SizedBox(
                  height: 22,
                ),
                Container(
                  height: height*0.40,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double innerHeight = constraints.maxHeight;
                      double innerWidth = constraints.maxWidth;
                      return Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: innerHeight * 0.72,
                              width: innerWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,),
                               child: Column(
                                 children: [
                                   SizedBox( height: 80,),
                                   Text('Rafiq Ahmad',
                                   style: TextStyle(
                                       color: Color.fromRGBO(6,173,115,1),
                                     fontFamily: 'Nunito',
                                     fontSize: 30,
                                   ),
                                   ),
                                   SizedBox(
                                     height: 5,
                                   ),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Column(
                                         children: [
                                           Text('Tasks',
                                           style: TextStyle(
                                             color: Colors.grey[700],
                                             fontFamily: 'Nunito',
                                             fontSize: 25,
                                           ),
                                           ),
                                           Text('16',
                                           style: TextStyle(
                                             color: Color.fromRGBO(6,173,115,1),
                                             fontFamily: 'Nunito',
                                             fontSize: 25,
                                           ),),
                                         ],
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 8),
                                         child: Container(
                                           height: 50,
                                           width: 3,
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(100),
                                             color: Colors.grey,
                                           ),
                                         ),
                                       ),
                                       Column(
                                         children: [
                                           Text('Stories',
                                           style: TextStyle(
                                             color: Colors.grey[700],
                                             fontFamily: 'Nunito',
                                             fontSize: 25,
                                           ),
                                           ),
                                           Text('2',
                                           style: TextStyle(
                                             color: Color.fromRGBO(6,173,115,1),
                                             fontFamily: 'Nunito',
                                             fontSize: 25,
                                           ),
                                           ),
                                         ],
                                       ),
                                     ],
                                   ),
                                 ],
                               ),
                          ),
                          ),
                          Positioned (
                            top: 100,
                            right: 20,
                            child: Icon(Icons.settings,
                            color: Colors.grey[700],
                            size: 30,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  child: Image.asset('assets/profile.png',
                                  width: innerWidth * 0.35,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                          ),
                                ),
                        ],
                      );
                    },
                    ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: height * 0.5,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Pages',
                          style: TextStyle(
                            color: Color.fromRGBO(6,173,115,1),
                            fontFamily: 'Nunito',
                            fontSize: 27,
                          ),
                        ),
                        Divider(
                          thickness: 2.5,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: height * 0.10,
                          decoration: BoxDecoration(
                            color: Color(0xFF00BFA6),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: height * 0.10,
                          decoration: BoxDecoration(
                            color: Color(0xFF00BFA6),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: height * 0.10,
                          decoration: BoxDecoration(
                            color: Color(0xFF00BFA6),
                            borderRadius: BorderRadius.circular(30),

                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
       ),
      ],
    );
  }
}