// ignore_for_file: library_prefixes, file_names

import 'dart:ui_web' as uiWeb;

import 'package:flutter/material.dart';

class Widgets extends StatefulWidget {
  const Widgets({super.key});

  @override
  State<Widgets> createState() => _WidgetsState();
}

class _WidgetsState extends State<Widgets> {

  @override
  void initState() {
    super.initState();
  }

  List<String> nomes = ['Jamilton', 'Maira', 'João', 'Carla'];

  @override
  Widget build(BuildContext context) {
    uiWeb.bootstrapEngine();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: nomes.length,
                itemBuilder: (context, index) {
                  final item = nomes[index];
                  return Dismissible(
                      background: Container(
                        color: Colors.green,
                        child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )
                              ],
                            )),
                      ),
                      secondaryBackground: Container(
                        color: Colors.red,
                        child: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      direction: DismissDirection.horizontal,
                      onDismissed: (direction) {

                        setState(() {
                          nomes.removeAt(index);
                        });
                      },
                      key: Key(item),
                      child: ListTile(
                        title: Text(item),
                      ));
                }),
          ),
        ],
      ),
    );
  }
}
