import 'package:clase_2/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String name = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userController = TextEditingController();

  TextEditingController passController = TextEditingController();
  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightBlue, width: 2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person,
                    color: Colors.lightBlue, size: 120),
              ),
              const SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'User',
                    prefixIcon: const Icon(Icons.person)),
                controller: userController,
              ),
              const SizedBox(height: 25),
              TextField(
                obscureText: hidePass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.key),
                  suffixIcon: IconButton(
                    icon: hidePass
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: togglePasswordVisibility,
                  ),
                ),
                controller: passController,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                child:
                    const Text('Login', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  String user = userController.text;
                  String pass = passController.text;
                  if (user.isEmpty || pass.isEmpty) {
                    print('User or password not filled');
                  } else {
                    if (user == 'Jorge' && pass == 'Jorge123') {
                      print('Login Exitoso');
                      context.pushNamed(HomeScreen.name,
                          extra: userController.text);
                    } else {
                      print('Login Fallido');
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void togglePasswordVisibility() => setState(() => hidePass = !hidePass);
}
