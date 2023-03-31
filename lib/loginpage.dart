import 'package:flutter/material.dart';
import 'package:leave_management_system/mainscreen.dart';
import 'package:leave_management_system/services/api_service.dart';
import 'package:leave_management_system/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //MARK:API Call
  void callLoginApi() async {
    final service = ApiServices();

    try {
      final value = await service.apiCallLogin({
        "email": emailController.text,
        "password": passwordController.text,
      });

      if (value != null && value.error == null) {
        print(value.token!);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        print("get data >>>>>> ${value?.error ?? 'Unknown error'}");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.2,
          right: MediaQuery.of(context).size.width * 0.2,
          top: MediaQuery.of(context).size.height * 0.1),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Image(image: AssetImage('images/leoforce_icon.png')),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                fillColor: Colors.grey[100],
                filled: true,
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[\w-\.]+@[a-z 0-9]+[\.][\w-]{2,4}$')
                        .hasMatch(value!))
                  return "Enter correct email";
                else
                  return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Colors.grey[100],
                filled: true,
                hintText: 'password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[\w-\.@]{8,15}$').hasMatch(value!))
                  return "password is not valid";
                else
                  return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                callLoginApi();
              },
              child: const Text('Login'),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text('Sign up'))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
