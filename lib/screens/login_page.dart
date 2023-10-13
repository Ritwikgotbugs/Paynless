import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynless/utils/db.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Image.asset("assets/paynless.png"),
        centerTitle: true,
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/Sign_in.png",
            fit: BoxFit.cover,
            width: Get.size.width,
            height: Get.size.height,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 225.0),
                  child: Column(
                    children: [
                      const Text("Let's Sign you in!",
                          style: TextStyle(
                              color: Color.fromARGB(255, 20, 118, 136),
                              fontSize: 32,
                              fontWeight: FontWeight.bold)),
                      Center(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Welcome Back,',
                                    style: TextStyle(
                                      fontSize: 36.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'You have been missed',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  const SizedBox(height: 32.0),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[500]!,
                                            blurRadius: 2,
                                            offset: const Offset(0, 2),
                                            spreadRadius: 0.5,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: TextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        labelText: 'Username',
                                        labelStyle:
                                            const TextStyle(color: Colors.grey),
                                        prefixIcon: const Icon(
                                          Icons.person,
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your email';
                                        }
                                        if (!value.contains('@')) {
                                          return 'Please enter a valid email';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[500]!,
                                            blurRadius: 2,
                                            offset: const Offset(0, 2),
                                            spreadRadius: 0.5,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: TextFormField(
                                      controller: _passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle:
                                            const TextStyle(color: Colors.grey),
                                        prefixIcon: const Icon(
                                          Icons.lock,
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your password';
                                        }
                                        if (value.length < 6) {
                                          return 'Password must be at least 6 characters';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                              "Forgot your Password?",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 30.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(),
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Text("Sign In",
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          ElevatedButton(
                                            style: const ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Color.fromARGB(
                                                          255, 20, 118, 136)),
                                            ),
                                            onPressed: () async {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                final email =
                                                    _emailController.text;
                                                final password =
                                                    _passwordController.text;
                                                try {
                                                  await db.auth
                                                      .signInWithPassword(
                                                    email: email,
                                                    password: password,
                                                  );
                                                } catch (e) {
                                                  if (e is AuthException) {
                                                    Get.snackbar(
                                                      e.message,
                                                      "Please try again",
                                                      snackPosition:
                                                          SnackPosition.BOTTOM,
                                                    );
                                                  } else {
                                                    Get.snackbar(
                                                      'Error',
                                                      e.toString(),
                                                      snackPosition:
                                                          SnackPosition.BOTTOM,
                                                    );
                                                  }
                                                }
                                              }
                                            },
                                            child: const Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
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
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed("/signup");
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
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
    );
  }

  @override
  void initState() {
    db.auth.onAuthStateChange.listen((event) {
      if (event.event == AuthChangeEvent.signedIn) {
        Get.offAllNamed('/');
      }
    });
    super.initState();
  }
}
