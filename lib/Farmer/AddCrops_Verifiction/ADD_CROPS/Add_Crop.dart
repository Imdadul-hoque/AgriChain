import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse499_project/Company/approved_list_button/approved/approvedORdecline.dart';
import 'package:flutter/material.dart';

class Farmer_AddCrops extends StatelessWidget {
  Farmer_AddCrops({Key? key}) : super(key: key);
  TextEditingController _itemHarvestingTime = new TextEditingController();
  TextEditingController _itemFartilizer = new TextEditingController();
  TextEditingController _itemId = new TextEditingController();
  TextEditingController _itemDelivaeryDate = new TextEditingController();
  TextEditingController _itemName = new TextEditingController();
  TextEditingController _itemWeight = new TextEditingController();
  TextEditingController _itemPlace = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Farmer",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            TextFormField(
              controller: _itemId,
              decoration: InputDecoration(
                labelText: 'Item ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _itemName,
              decoration: InputDecoration(
                labelText: 'Item name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _itemWeight,
              decoration: InputDecoration(
                labelText: 'Kg',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),
            TextFormField(
              controller: _itemDelivaeryDate,
              decoration: InputDecoration(
                labelText: 'Date:DD/MM/YYYY',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),
            TextFormField(
              controller: _itemPlace,
              decoration: InputDecoration(
                labelText: 'Place',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),
            TextFormField(
              controller: _itemFartilizer,
              decoration: InputDecoration(
                labelText: 'Fartilizer',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),
            TextFormField(
              controller: _itemHarvestingTime,
              decoration: InputDecoration(
                labelText: 'Harvesting time',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Map<String, dynamic> data = {
                  "Food ID": _itemId.text,
                  "Food name": _itemName.text,
                  "Food harvesting time": _itemHarvestingTime.text,
                  "Food Delivery": _itemDelivaeryDate.text,
                  "Place": _itemPlace.text,
                  "Fertilizer": _itemFartilizer.text
                };
                FirebaseFirestore.instance
                    .collection("farmer add food")
                    .add(data);
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => Company_ApprovedorDecline()));
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
