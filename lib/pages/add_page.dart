import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:adopt_app/widgets/add_form.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add a New Pet")),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Fill those field to add a book"),
            AddForm(), // Render the AddForm widget here
          ],
        ),
      ),
    );
  }
}
// 9 didint solve it from part 2
// to copy option and shift and the errow