import 'package:flutter/material.dart';
import 'package:my_first_app/seetings_model.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key, required this.settingsModel});
  final SettingsModel settingsModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 5),
        
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 10),
            ],
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                    ),
                    child: Icon(settingsModel.icon),
                  ),
                  SizedBox(width: 10),
                  Text(
                    settingsModel.title,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
        
              Icon(Icons.arrow_forward_ios_rounded, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
