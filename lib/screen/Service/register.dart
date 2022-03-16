import 'package:f_tutor_app/endPoints/dataTutor.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final bitrhDayController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final languageController = TextEditingController();
  final skillController = TextEditingController();
  final educationController = TextEditingController();
  final gpaController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    bitrhDayController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    languageController.dispose();
    skillController.dispose();
    educationController.dispose();
    gpaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scrollbar(
      isAlwaysShown: true,
      child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: "Enter your name",
                        border: OutlineInputBorder(),
                      ))),
              Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                      controller: bitrhDayController,
                      decoration: const InputDecoration(
                        labelText: "Enter your birthDay",
                        border: OutlineInputBorder(),
                      ))),
              Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        labelText: "Enter your phone number",
                        border: OutlineInputBorder(),
                      ))),
              Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: "Enter your email",
                        border: OutlineInputBorder(),
                      ))),
              Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: "Enter your password",
                        border: OutlineInputBorder(),
                      ))),
              Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                      controller: addressController,
                      decoration: const InputDecoration(
                        labelText: "Enter your address",
                        border: OutlineInputBorder(),
                      ))),
              Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                      controller: languageController,
                      decoration: const InputDecoration(
                        labelText: "Enter your languae",
                        border: OutlineInputBorder(),
                      ))),
              Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                      controller: skillController,
                      decoration: const InputDecoration(
                        labelText: "Enter your skill",
                        border: OutlineInputBorder(),
                      ))),
              Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                      controller: educationController,
                      decoration: const InputDecoration(
                        labelText: "Enter your Education",
                        border: OutlineInputBorder(),
                      ))),
              Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                      controller: gpaController,
                      decoration: const InputDecoration(
                        labelText: "Enter your gpa",
                        border: OutlineInputBorder(),
                      ))),
              Container(
                  margin: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: 50,
                  child: RaisedButton(
                    onPressed: () async {
                      if (passwordController.text != '') {
                        if (nameController.text != '') {
                          if (bitrhDayController.text != '') {
                            if (phoneController.text != '') {
                              if (emailController.text != '') {
                                if (addressController.text != '') {
                                  if (languageController.text != '') {
                                    if (skillController.text != '') {
                                      if (educationController.text != '') {
                                        if (gpaController.text != '') {
                                          final response = await Register(
                                              nameController.text,
                                              bitrhDayController.text,
                                              phoneController.text,
                                              emailController.text,
                                              passwordController.text,
                                              addressController.text,
                                              languageController.text,
                                              skillController.text,
                                              emailController.text,
                                              gpaController.text);
                                          if (response == true) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Đăng ký thành công")));
                                            Navigator.pop(context);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Email đã được dùng")));
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "GPA Không được để trống")));
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Trường học không được để trống")));
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Kỹ năng không được để trống")));
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Ngông ngữ không được để trống")));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Địa chỉ không được để trống")));
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("Email không được để trống")));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Số điện thoại không được để trống")));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("Ngày sinh không được để trống")));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Tên không được để trống")));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Mật khẩu không được để trống")));
                      }
                    },
                    child: Text("Register",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ))
            ],
          )),
    ));
  }
}
