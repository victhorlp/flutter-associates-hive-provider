// ignore_for_file: use_key_in_widget_constructors

import 'package:associates_2023/model/associate.dart';
import 'package:associates_2023/pages/addAssociate.dart';
import 'package:associates_2023/pages/associateList.dart';
import 'package:flutter/material.dart';
import "package:hive/hive.dart";
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'associateData.dart';

void main() {
  Hive.registerAdapter(AssociateAdapter());

  runApp(AssociateApp());
}

Future _initHive() async {
  var dir = await getApplicationDocumentsDirectory();

  Hive.init(dir.path);
}

class AssociateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AssociateData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Associates',
        theme: ThemeData(primaryColor: Colors.indigo),
        initialRoute: "/",
        routes: {
          "/": (context) => FutureBuilder(
              future: _initHive(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.error != null) {
                    // ignore: avoid_print
                    print('snashot error route => ${snapshot.error}');
                    return const Scaffold(
                      body: Center(
                        child: Text("Error establishing connection to hive"),
                      ),
                    );
                  } else {
                    return AssociateListPage();
                  }
                } else {
                  return const Scaffold();
                }
              }),
          "/AddAssociatePage": (context) => AddAssociatePage()
        },
      ),
    );
  }
}
