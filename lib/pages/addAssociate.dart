// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_null_comparison, file_names

import 'package:associates_2023/model/associate.dart';
import 'package:associates_2023/widgets/toast.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../associateData.dart';

class AddAssociatePage extends StatefulWidget {
  @override
  _AddAssociatePageState createState() => _AddAssociatePageState();
}

class _AddAssociatePageState extends State<AddAssociatePage> {
  String name = '';
  int phone = 0;
  bool senior = false;
  int age = 0;

  void _addAssociate(context) {
    if (name == null) {
      toastWidget("Give entry a name");
      return;
    }
    if (name.length < 2) {
      toastWidget("Get a longer name");
      return;
    }
    Provider.of<AssociateData>(context, listen: false).addAssociate(
      Associate(
        name: name,
        age: age,
        phone: phone,
        isSenior: senior,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 16.0,
        title: const Text(
          "Add Associate",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            iconSize: 24.0,
            color: Colors.blue,
            tooltip: "Save",
            onPressed: () {
              _addAssociate(context);
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "Name",
                ),
                onChanged: (v) {
                  setState(
                    () {
                      name = v;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: "Phone",
                ),
                onChanged: (v) {
                  setState(
                    () {
                      phone = int.parse(v);
                    },
                  );
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                keyboardType: const TextInputType.numberWithOptions(decimal: false),
                decoration: const InputDecoration(
                  hintText: "Age",
                ),
                onChanged: (v) {
                  setState(
                    () {
                      age = int.parse(v);
                    },
                  );
                },
              ),
              Row(
                children: <Widget>[
                  const Text(
                    "Is Senior",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  Switch(
                    activeTrackColor: Colors.black,
                    activeColor: Colors.blue,
                    onChanged: (v) {
                      setState(() {
                        senior = v;
                      });
                    },
                    value: senior,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
