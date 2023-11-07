// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/firebase%20auth%20implementation/firebase_auth_services.dart';
import 'package:login_signup/signin.dart';

class MySignUp extends StatefulWidget {
  const MySignUp({super.key});

  @override
  State<MySignUp> createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                      image: AssetImage('assets/asset2.jpg'),
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
                        'Sign Up',
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
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 50,
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 168, 148, 241),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          // enabledBorder: InputBorder.none,
                          border: InputBorder.none),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 168, 148, 241),
                                width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 168, 148, 241)),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0),
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.center
                              // border: InputBorder.none,
                              ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 168, 148, 241),
                                width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                labelText: 'Confirm Password',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 168, 148, 241)),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0),
                                border: InputBorder.none),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _signup,
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
                        'Create Account',
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
                        "Have an Account?",
                        style: TextStyle(
                            color: Color.fromARGB(255, 168, 148, 241),
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MySignin()));
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Color.fromARGB(255, 168, 148, 241),
                                fontWeight: FontWeight.bold),
                          ))
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

  void _signup() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Validations for passwords
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match."),
        ),
      );
      return; // Stop execution if passwords don't match
    }

    try {
      // Attempt user registration with Firebase
      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      if (user != null) {
        // Sign-up was successful
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MySignin()));
      } else {
        // Handle cases where user creation is not successful
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User registration failed. Please try again."),
          ),
        );
      }
    } catch (e) {
      // Handle specific Firebase Authentication errors
      print('Firebase Authentication Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text("An error occurred during registration. Please try again."),
        ),
      );
    }
  }
}
