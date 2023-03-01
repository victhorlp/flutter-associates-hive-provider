// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_null_comparison, annotate_overrides

import 'package:associates_2023/associateData.dart';
import 'package:associates_2023/model/associate.dart';
import 'package:associates_2023/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssociateEditPage extends StatefulWidget {
  final Associate currentAssociate;

  const AssociateEditPage({required this.currentAssociate});

  @override
  _AssociateEditPageState createState() => _AssociateEditPageState();
}

class _AssociateEditPageState extends State<AssociateEditPage> {
  String newName = '';
  int newPhone = 0;
  bool newSenior = false;
  int newAge = 0;

  void _editAssociate(context) {
    if (newName == null) {
      toastWidget("Give entry a name");
      return;
    }
    if (newName.length < 2) {
      toastWidget("Get a longer name");
      return;
    }
    Provider.of<AssociateData>(context, listen: false).editAssociate(
        associate: Associate(
          name: newName,
          age: newAge,
          phone: newPhone,
          isSenior: newSenior,
        ),
        associateKey: widget.currentAssociate.key);

    Navigator.pop(context);
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.currentAssociate.name;
    newName = widget.currentAssociate.name;

    _phoneController.text = widget.currentAssociate.phone.toString();
    newPhone = widget.currentAssociate.phone;

    _ageController.text = widget.currentAssociate.age.toString();
    newAge = widget.currentAssociate.age;

    newSenior = widget.currentAssociate.isSenior;

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 16.0,
        title: Text(
          "Edit ${widget.currentAssociate.name}",
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            iconSize: 24.0,
            color: Colors.blue,
            tooltip: "Save",
            onPressed: () {
              _editAssociate(context);
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
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: "Name",
                ),
                onChanged: (v) {
                  setState(
                    () {
                      newName = v;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: "Phone",
                ),
                onChanged: (v) {
                  setState(
                    () {
                      newPhone = int.parse(v);
                    },
                  );
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                controller: _ageController,
                keyboardType: const TextInputType.numberWithOptions(decimal: false),
                decoration: const InputDecoration(
                  hintText: "Age",
                ),
                onChanged: (v) {
                  setState(
                    () {
                      newAge = int.parse(v);
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
                        newSenior = v;
                      });
                    },
                    value: newSenior,
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
