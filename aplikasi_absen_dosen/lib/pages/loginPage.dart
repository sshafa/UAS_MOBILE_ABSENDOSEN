import 'package:firebase_auth/firebase_auth.dart';
import '../pages/homePage.dart';
import 'package:flutter/material.dart';

import 'Register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordHidden = true;
  bool _isFormValid = false;

  void _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      String username = _usernameController.text;
      String password = _passwordController.text;

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: username, password: password);

        // Authentication succeeded, you can perform the desired actions,
        // such as navigating to the home page.
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          (Route<dynamic> route) => false,
        );

        // Display a success message for login
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login berhasil')),
        );
      } on FirebaseAuthException catch (e) {
        String errorMessage = '';
        if (e.code == 'user-not-found') {
          errorMessage = 'User not found. Please register an account.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password. Please try again.';
        } else {
          errorMessage = 'Login failed. Error: ${e.message}';
        }

        // Display a login failed dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Failed'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } catch (e) {
        // Display a login failed dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Failed'),
            content: Text('Login failed. Error: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  // Password Field obscureText Handler
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 50, right: 20, left: 20, bottom: 50),
            child: Column(
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 300,
                  height: 300,
                  padding: EdgeInsets.all(3),
                  child: Image(image: AssetImage('assets/images/login.png')),
                ),
                Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        focusColor: Colors.blue,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length <= 6) {
                          return 'Password must be greater than 6 digits';
                        }
                        return null;
                      },
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        fillColor: Colors.grey.shade100,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: _toggleVisibility,
                          icon: _isHidden
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                        filled: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/reset',
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Container(
                    width: 150,
                    height: 40,
                    child: OutlinedButton(
                      onPressed: () {
                        _login(context);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontFamily: "Inter-Regular",
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shadowColor: Colors.blue,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const Register();
                    }));
                  },
                  child: Text(
                    "Belum Punya Akun ? Daftar Disini !",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
