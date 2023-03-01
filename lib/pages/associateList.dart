// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:associates_2023/widgets/associateList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../associateData.dart';

class AssociateListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<AssociateData>(context, listen: false).getAssociates();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 16.0,
        title: const Text(
          'Associates',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: AssociateList(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        tooltip: "Add",
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/AddAssociatePage');
        },
      ),
    );
  }
}
