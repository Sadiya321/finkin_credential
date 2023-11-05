import 'package:finkin_credential/res/app_color.dart';
import 'package:flutter/material.dart';

class AgentPage extends StatefulWidget {
  const AgentPage({Key? key}) : super(key: key);

  @override
  _AgentPageState createState() => _AgentPageState();
}

class _AgentPageState extends State<AgentPage> {
  String? selectedChoice; // Initial choice

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200, // Adjust the width as needed
              child: DropdownButton<String>(
                hint: const Text("Please select your choice"), // Default option
                value: selectedChoice,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedChoice = newValue;
                  });
                },
                icon: const Icon(Icons.arrow_drop_down, 
                color:AppColor.textPrimary,
                ), // Align the arrow to the right
                iconSize: 24, // Adjust the arrow size as needed
                isExpanded: true, // Make the dropdown expand to the container width
                items: <String>['Choice 1', 'Choice 2', 'Choice 3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),

      
    );
  }
}
