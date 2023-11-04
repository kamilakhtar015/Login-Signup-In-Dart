import 'package:flutter/material.dart';
import 'package:login_signup/signup.dart';

class MySignin extends StatefulWidget {
  const MySignin({super.key});

  @override
  State<MySignin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MySignin> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 430,
              width: screenWidth,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/asset1.jpg'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        'Log In',
                        style: TextStyle(
                            color: Color.fromARGB(255, 168, 148, 241),
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 168, 148, 241),
                          width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const TextField(
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 50,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 168, 148, 241)),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        // enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 168, 148, 241),
                          width: 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const TextField(
                      obscureText: true,
                      maxLength: 20,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 168, 148, 241)),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 168, 148,
                            241), // Set the background color to purple
                        padding: const EdgeInsets.all(
                            25), // You can adjust the padding as needed
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                            color: Color.fromARGB(255, 168, 148, 241),
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MySignUp()));
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Color.fromARGB(255, 168, 148, 241),
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Forget Password?",
                        style: TextStyle(
                            color: Color.fromARGB(255, 168, 148, 241),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
