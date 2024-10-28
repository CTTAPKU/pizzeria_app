import 'package:flutter/material.dart';
import 'package:pizzeria_aic/screen/login/signin.dart';

class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 70, left: 24, bottom: 24, right: 24),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Реєстрація",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      expands: false,
                      decoration: InputDecoration(
                        labelText: "Ім'я",
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
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: TextField(
                      expands: false,
                      decoration: InputDecoration(
                        labelText: "Прізвище",
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
                  )
                ],
              ),
              SizedBox(height: 8),
              TextField(
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
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  labelText: "Телефон",
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
              SizedBox(height: 8),
              TextField(
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
                      MaterialPageRoute(builder: (context) => signin()),
                    );
                  },
                  child: const Text("Створити Акаунт"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
