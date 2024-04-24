import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User',
                    prefixIcon: Icon(Icons.person)),
                controller: userController,
              ),
              const SizedBox(height: 25),
              TextField(
                obscureText: hidePass,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
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
                child: const Text('Login'),
                onPressed: () {
                  String user = userController.text;
                  String pass = passController.text;
                  if (user.isEmpty || pass.isEmpty) {
                    print('User or password not filled');
                  } else {
                    if (user == 'Jorge' && pass == 'Jorge123') {
                      print('Login Exitoso');
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
