import 'package:flutter/material.dart';
import 'package:hacker_kernel_task/network/network_handler.dart';
import 'package:hacker_kernel_task/screen/authentication/custom_textformfield.dart';
import 'package:hacker_kernel_task/screen/homescreen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    emailController.text = 'eve.holt@reqres.in';
    passwordController.text = "pistol";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 230,
              width: double.infinity,
              child: Image.asset(
                "assets/girl.jpg",
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'email ID',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomPasswordFormField(
              controller: passwordController,
              hintText: 'password',
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Forget Password",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                NetworkHandler()
                    .registerUser(
                  context,
                  email: emailController.text,
                  password: passwordController.text,
                )
                    .then((value) {
                  if (value != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }
                });
              },
              child: Container(
                height: 44,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                decoration: ShapeDecoration(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    height: 2,
                    thickness: 2,
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  'OR',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    height: 2,
                    thickness: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.maxFinite,
              height: 48,
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.grey.shade200,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    child: Image.asset("assets/google.png"),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Google",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'New to Logistics? ',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const TextSpan(
                        text: 'Register',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
