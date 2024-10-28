import 'package:flutter/material.dart';
import 'package:pizzeria_aic/screen/login/signup.dart';
import 'package:pizzeria_aic/widgets/nav_bar.dart';

class signin extends StatelessWidget {
  const signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 70, left: 24, bottom: 24, right: 24),
          child: Column(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ласкаво просимо,",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 3),
                  Text("ПіцаTime чекає на твоє замовлення",
                      style: TextStyle(fontSize: 17))
                ],
              ),
              const SizedBox(height: 32),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Пошта",
                        labelStyle: const TextStyle(color: Color(0xffECDFCC)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Color(0xffECDFCC),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color(0xff3C3D37),
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Пароль",
                        labelStyle: const TextStyle(color: Color(0xffECDFCC)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Color(0xffECDFCC),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color(0xff3C3D37),
                            width: 2.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => nav_bar()),
                    );
                  },
                  child: const Text("Увійти"),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => signup()),
                    );
                  },
                  child: const Text("Зареєструватися"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
