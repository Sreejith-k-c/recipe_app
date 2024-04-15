import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/presentation/login/view/loginpage.dart';
import 'package:recipe_app/presentation/registration/controller/registration_controller.dart';

import '../../../global_widget/image_icon.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController usernamecontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();
  File? image;

  Future<void> getImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            const Text(
              'Create Account',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                'Fill your information below or Login with your account',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJwvSb2j9_-OziB1hVGZIbh6nsOqOwlVVTBQ&usqp=CAU",
              height: 80,
              width: 100,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: usernamecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'username',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                SelectImageButton(
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                  icon: Icons.photo,
                  label: "Choose DP",
                  iconColor: Colors.orange,
                  labelColor: Colors.orange,
                ),
                SizedBox(
                  width: 10,
                ),
                // SelectImageButton(
                //   onPressed: () {
                //     getImage(ImageSource.camera);
                //   },
                //   icon: Icons.camera_alt,
                //   label: "Open Camera",
                //   iconColor: Colors.orange,
                //   labelColor: Colors.orange,
                // ),
                if (image != null)
                  Container(
                    margin: EdgeInsets.only(left: size.width * .2),
                    height: 100,
                    width: 100,
                    child: Image.file(
                      image!,
                      fit: BoxFit.cover,
                    ),
                  )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email address',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                controller: emailcontroller,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                obscureText: true,
                controller: passwordcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                onTap: () {
                  Provider.of<RegistrationController>(context, listen: false)
                      .onRegistration(
                          context,
                          usernamecontroller.text.trim(),
                          emailcontroller.text.trim(),
                          passwordcontroller.text.trim(),
                  image);
                  usernamecontroller.clear();
                  emailcontroller.clear();
                  passwordcontroller.clear();
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an Account ?",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        )),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
