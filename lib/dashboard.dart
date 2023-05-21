import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'card/category.dart';
import 'card/more.dart';
import 'package:pocket_task/home.dart';
import 'ui/first_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 0,
          backgroundColor: Colors.white,),
      backgroundColor: Colors.white,
      body: SafeArea(child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20, vertical: 5),
                child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Welcome to',
                      style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 18
                          ),
                   ),
                    SizedBox(height: 8),
                    Text('Dashboard',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),
                    ),
                  ],
                )
                ],
                ),
    ),
              const SizedBox(height: 20),

              // card
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                       color: tdNavyBlue,
                      //color:tdGreen.withOpacity(0.86),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(children: [
                    SizedBox(
                      height: 120,
                      width: 100,
                      //color: Colors.white,
                    child: Image.asset(
                      'assets/man.png',
                      fit: BoxFit.contain
                    ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),

                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                              Text('What is your plan for today?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            ),
                            SizedBox(height: 12),
                             Text('Start to create something now',
                            style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            ),
                            SizedBox(height: 12),
                          ],
                        ))
                  ],),
                ),
              ),

              //const SizedBox(height: 25),
              const SizedBox(height: 30),
              // DISCOVER MORE
              Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Discover More',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              )),

              const SizedBox(height: 30),

              Padding(
                padding:const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigate to another page when the item is clicked
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const FirstPage()),
                              );
                            },
                            child: const CategoryCard(
                              categoryName: 'Task',
                              iconImagePath: 'assets/task.png',
                            ),
                          ),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {
                              // Navigate to another page when the item is clicked
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                            child: const CategoryCard(
                              categoryName: 'Quiz',
                              iconImagePath: 'assets/brain.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    //const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigate to another page when the item is clicked
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                            child: const CategoryCard(
                              categoryName: 'Games',
                              iconImagePath: 'assets/game-console.png',
                            ),
                          ),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {
                              // Navigate to another page when the item is clicked
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                            child: const CategoryCard(
                              categoryName: 'Video',
                              iconImagePath: 'assets/video.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
      ),
    ));
  }
}
