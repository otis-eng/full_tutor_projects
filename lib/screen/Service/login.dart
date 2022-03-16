import 'package:f_tutor_app/endPoints/dataTutor.dart';
import 'package:f_tutor_app/screen/Service/register.dart';
import 'package:f_tutor_app/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("E-Tutor Login")),
        body: Center(
            child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Center(
                  child: Image.network(
                "https://res.cloudinary.com/phankieuphuicloud/image/upload/v1647015756/logo_vfsuw5-removebg-preview_wcetqb.png",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              )),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text("E-Tutor",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                alignment: Alignment.center,
                child: TextField(
                    maxLength: 50,
                    controller: emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your username")),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  alignment: Alignment.center,
                  child: TextField(
                      obscureText: true,
                      maxLength: 50,
                      controller: passwordController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your password")),
                )),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: RaisedButton(
                    onPressed: () async {
                      if (emailController.text == '' ||
                          passwordController.text == '') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Email và password không được bỏ trống"),
                        ));
                      } else {
                        final response = await login(
                            emailController.text.toString(),
                            passwordController.text.toString());

                        if (response == true) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage(emailController.text)));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Sai thông tin tài khoản hoặc account chưa được kích hoạt"),
                          ));
                        }
                      }
                    },
                    child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text("Login",
                            style: TextStyle(fontWeight: FontWeight.bold)))),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: const Text("Register",
                          style: TextStyle(fontWeight: FontWeight.bold)))),
            )
          ],
        )));
  }
}
