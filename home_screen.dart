import 'package:login_with_list/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home';
  final String userName;
  const HomeScreen({super.key, this.userName = ''});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textCreateToDoList = TextEditingController();
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text("To Do List"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome ${widget.userName}!'),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: () {
                context.pushNamed(LoginScreen.name);
              },
              child: const Text('Go Back To Login',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Future setProfileDescription() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          insetPadding: const EdgeInsets.only(top: 60, bottom: 60),
          title: const Text("Describe yourself"),
          content: Column(
            children: [
              TextField(
                //style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'Description',
                  prefixIcon: const Icon(
                    Icons.text_fields,
                  ),
                  hintText: "Write a description",
                ),
                maxLines: 3,
                minLines: 1,
                maxLength: 200,
                controller: textCreateToDoList,
              ),
              Text(
                errorText,
                style: const TextStyle(color: Colors.red),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                String localUserDescription = userDescriptionController.text;
                if (localUserDescription.isEmpty) {
                  setState(() {
                    errorText = 'Description not filled';
                  });
                } else {
                  setState(() {
                    userDescription = localUserDescription;
                  });
                  profileCompletionCards.removeWhere(
                      (element) => element.title == "Describe yourself");
                  setState(() {
                    globals.profileCompletionCardsAccomplished =
                        globals.profileCompletionCardsAccomplished + 1;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      );
}

class ToDoListCards {
  final String dueTo;
  final String descriptionCard;
  ToDoListCards({
    required this.dueTo,
    required this.descriptionCard
  })
}

List <ToDoListCards> toDoListCards = [
  ToDoListCards(
    dueTo: 'Sample',
    descriptionCard: 'Sample',
  )
];
