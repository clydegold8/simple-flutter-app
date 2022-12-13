import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class KBlockLoginForm extends StatefulWidget {
  const KBlockLoginForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<KBlockLoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 91, 0, 72),
            child: Center(
              child: Text('K-BLOCK',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Color(0xFF656565),
                  )),
            ),
          ),
          // Id Field
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
            child: Center(
              child: Text(AppLocalizations.of(context)!.id,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Color(0xFF656565),
                  )),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(34, 0, 34, 0),
              child: SizedBox(
                height: 40.0,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  )
                ),
              )),
          // password field
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 6),
            child: Center(
              child: Text(AppLocalizations.of(context)!.password,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Color(0xFF656565),
                  )),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(34, 0, 34, 0),
              child: SizedBox(
                height: 40.0,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: const BorderSide(color: Color(0xFF898989)),
                    ),
                  ),
                ),
              )),
          // forgot password link
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 7),
            child: Center(
              child: Text(AppLocalizations.of(context)!.forgot_password,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Color(0xFF656565),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(34, 30, 34, 7),
            child: Center(
              child: OutlinedButton(
                onPressed: null,
                style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFFFFFFFF),
                    side: const BorderSide(color: Color(0xFF898989)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    )),
                child: SizedBox(
                  width: double.infinity,
                  height: 40.0,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 12),
                      child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            AppLocalizations.of(context)!.login,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF656565),
                            )
                          ))),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(AppLocalizations.of(context)!.terms,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xFF656565),
                      )),
                    Text('@Stock Tech.Inc',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xFF656565),
                      )),
                  ]
                )
              )
            )
          )
        ],
      ),
    );
  }
}
