import 'package:autohome/api_calls.dart';
import 'package:autohome/constants.dart';
import 'package:autohome/screens/landingpage.dart';
import 'package:autohome/screens/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Define the text controller
  final TextEditingController _textEditingControllerUsername =
      TextEditingController();
  final TextEditingController _textEditingControllerPassword =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 40,
            margin: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/app-logo-small.jpg',
                  width: 170,
                ),
                _header(context),
                _inputField(context),
                _forgotPassword(context),
                _signup(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Text(
          "Welcome Back",
          style: kHeadingLarge(fontSize: 40),
        ),
        Text(
          "Enter your credential to login",
          style: kSubHeadingLarge(fontSize: 16),
        ),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _textEditingControllerUsername,
          decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Colors.green.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _textEditingControllerPassword,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Colors.green.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.password),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            final username = _textEditingControllerUsername.text;
            final password = _textEditingControllerPassword.text;
            final loginResult = await loginApiCall(username, password);

            if (loginResult == true) {
              // Login successful, navigate to next page
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LandingPage()),
                (route) => false,
              );
            } else if (loginResult == false) {
              // Invalid username or password, show toast
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Invalid username or password')),
              );
            } else {
              // Unknown error, show toast
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('An error occurred')),
              );
            }


            // print(_textEditingControllerUsername.text);
            // print(_textEditingControllerPassword.text);

            // Navigator.pushAndRemoveUntil(
            //   context,
            //   MaterialPageRoute(builder: (context) => const LandingPage()),
            //   (route) => false,
            // );
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.green,
          ),
          child: Text(
            "Login",
            style: kBodyLarge(fontSize: 20, color: Colors.white),
          ),
        )
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Forgot password?",
        style: kSubHeadingLarge(fontSize: 13, color: Colors.green),
      ),
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Dont have an account? ",
          style: kSubHeadingLarge(
            fontSize: 13,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupPage()),
            );
          },
          child: Text(
            "Sign Up",
            style: kSubHeadingLarge(fontSize: 13, color: Colors.green),
          ),
        )
      ],
    );
  }
}
