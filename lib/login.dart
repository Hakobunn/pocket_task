import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket_task/dashboard.dart';
import 'package:pocket_task/constants/colors.dart';
import 'package:pocket_task/signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios,
          size: 20,
          color: Colors.black,),


        ), systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget> [
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                Column(
                  children: <Widget> [
                    const Text("Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20,),
                    Text("Login to your account",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700]
                    ),)
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      inputFile(label: "Email",context: context),
                      inputFile(label: "Password",obscureText: true,context: context)
                    ],
                  ),
                  ),
                  Padding(padding:
                  const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: const EdgeInsets.only(top: 1, left: 0.5),
                      decoration:
                      BoxDecoration(
                       borderRadius: BorderRadius.circular(12),
                        border: const Border(
                         //bottom: BorderSide(color: Colors.black),
                          //top: BorderSide(color: Colors.black),
                          //left: BorderSide(color: Colors.black),
                          //right: BorderSide(color: Colors.black),
                        )
                      ),

                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 50,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder:
                              (context)=> const Dashboard()));
                        },
                        color: tdNavyBlue,
                        //color: const Color(0xFF00BFA6),
                        elevation:0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "Login", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,

                        ),
                         ),
                       ),
                      ),
                  ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  <Widget>[
                    const Text("Don't have an account?"),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the sign-up page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: const Text(
                        " Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ))
          ],
        ),
      ),
    );
  }
}

//creating a widget for text field
Widget inputFile({label, obscureText = false, required BuildContext context}) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: isDarkMode ? Colors.white : Colors.black87,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}
