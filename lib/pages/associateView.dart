// ignore_for_file: unused_import, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, file_names

import 'package:associates_2023/model/associate.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../associateData.dart';
import '../utils.dart';
import 'associateEdit.dart';

class AssociateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _deleteConfirmation(currentAssociate) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              'Are you sure?',
              style: TextStyle(color: Colors.black),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('You are about to delete ${currentAssociate.name}'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text("This action cannot be undone")
                ],
              ),
            ),
            actions: <Widget>[
              InkWell(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.red,
                  child: const Text(
                    "DELETE",
                    style:
                        TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  Log.d("Deleting ${currentAssociate.name}");
                  Provider.of<AssociateData>(context, listen: false)
                      .deleteAssociate(currentAssociate.key);

                  Navigator.popUntil(
                    context,
                    ModalRoute.withName(Navigator.defaultRouteName),
                  );
                },
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.blue,
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )
                ),
                onTap: () {
                  Log.d("Cancelling");
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }

    return Consumer<AssociateData>(
      builder: (context, associateData, child) {
        Associate currentAssociate = associateData.getActiveAssociate();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            elevation: 16.0,
            title: Text(
              currentAssociate.name,
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.create),
                iconSize: 24.0,
                color: Colors.blue,
                tooltip: "Edit",
                onPressed: () {
                  Log.d("Selected to edit");
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AssociateEditPage(
                          currentAssociate: currentAssociate);
                    },
                  ));
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                iconSize: 24.0,
                color: Colors.red,
                tooltip: "Delete",
                onPressed: () {
                  Log.d("Selected for deletion");
                  _deleteConfirmation(currentAssociate);
                },
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 36.0,
                    color: Colors.grey[300],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        const Text(
                          "Phone",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        Text(
                          currentAssociate.phone.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 36.0,
                    color: Colors.white54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        const Text(
                          "Age",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        Text(
                          currentAssociate.age.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 36.0,
                    color: Colors.grey[300],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        const Text(
                          "Senior",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        Switch(
                          activeTrackColor: Colors.black,
                          value: currentAssociate.isSenior,
                          onChanged: (bool v) {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
