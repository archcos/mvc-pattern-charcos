import 'package:assignment2/controller/user_controller.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  var formKey = GlobalKey<State>();
  List genderChoice = ["", "Male", "Female"];
  String selectedChoice = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Page"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: "Name",
                hintText: "Ex. Rain"
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Age",
                  hintText: "Ex. 11"
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
                value: selectedChoice,
                decoration: const InputDecoration(
                  labelText: 'Gender',
                ),
                items: [
                  ...genderChoice.map((choices) => DropdownMenuItem(
                      value: choices,
                      child: Text(choices)))
                ],
                onChanged: (value){
                  setState(() {
                    selectedChoice = value as String;
                  }
                  );
                  genderController.text = selectedChoice;
                }
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: locationController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  labelText: "Location",
                  hintText: "Ex. PHI"
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: (){
                  UserController updateUser = UserController(
                    newName: nameController.text,
                    newAge: int.parse(ageController.text),
                    newGender: genderController.text,
                    newLocation: locationController.text
                  );
                  setState(() {
                    updateUser;
                  });
                  Navigator.pop(context, updateUser);
                },
                child: const Text("UPDATE"))
          ],
        ),
      ),
    );
  }
}
