// ignore_for_file: file_names, must_be_immutable

import 'package:associates_2023/associateData.dart';
import 'package:associates_2023/model/associate.dart';
import 'package:associates_2023/pages/associateView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssociateTile extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var tileIndex;


  // ignore: use_key_in_widget_constructors
  AssociateTile({
    Key? key, 
    required this.tileIndex
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AssociateData>(
      builder: (context, associateData, child) {
        Associate currentAssociate = associateData.getAssociate(tileIndex);

        return (Container(
          decoration: BoxDecoration(
            color: tileIndex % 2 == 0 ? Colors.grey : Colors.white,
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigo,
              child: Text(
                currentAssociate.name.substring(0, 1),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              currentAssociate.name,
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              currentAssociate.phone.toString(),
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Provider.of<AssociateData>(context, listen: false)
                  .setActiveAssociate(currentAssociate.key);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AssociateView();
                  },
                ),
              );
            },
          ),
        ));
      },
    );
  }
}
