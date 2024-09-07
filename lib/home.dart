import 'package:flutter/material.dart';

import 'confirm_utils.dart';
import 'custom_filed.dart';

class Home extends StatefulWidget {
  Home({super.key});

  static const String routeName = "register";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var formKay = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKay,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomFiled(
                        label: "Name",
                        controller: name,
                        validator:(value) => ConfirmUtils.validateName(value!),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFiled(
                        label: "Email",
                        controller: email,
                        validator: (value) => ConfirmUtils.validateEmail(value!),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFiled(
                        label: "Password",
                        controller: password,
                        obscureText: true,
                        validator: (value) => ConfirmUtils.validatePassword(value!),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFiled(
                        label: "Confirm Password",
                        controller: confirmPassword,
                        obscureText: true,
                        validator: (value) => ConfirmUtils.validateConfirmPassword(password.value.text,value!),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (formKay.currentState!.validate()) {}
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "Register",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
