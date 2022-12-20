import 'package:flutter/material.dart';

Future<void> addWhitelist(BuildContext context) {
  return showDialog(
           context: context,
           builder: (BuildContext context) {
                    return const Expanded(
                      child: AlertDialog( 
                        title: Text('empty pop up'),
                ),
          );
       },
  );
}
