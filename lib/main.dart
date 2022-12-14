import 'package:cryptograph/textField.dart';
import 'package:flutter/material.dart';

import 'manage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'CYPHER APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _inputTextController = TextEditingController();
  final TextEditingController _encryptKeyTextController =
      TextEditingController();
  final TextEditingController _resultTextController = TextEditingController();
  // final int encryptKey = 12;

  @override
  void dispose() {
    _inputTextController.dispose();
    _encryptKeyTextController.dispose();
    _resultTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(50),
      child: Center(
        child: SizedBox(
          width: 800,
          child: Material(
            elevation: 4,
            color: const Color(0xD3A6A4E3),
            borderRadius: BorderRadius.circular(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 40,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w400,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFieldS(
                  inputTextController: _inputTextController,
                  hintText: 'ادخل النص الذي تريد تشفيره',
                ),
                const SizedBox(
                  height: 20,
                ), //
                TextFieldS(
                  inputTextController: _inputTextController,
                  hintText: 'ادخل رمز التشفير',
                ),
                const SizedBox(
                  height: 20,
                ), //

                TextFieldS(
                  inputTextController: _inputTextController,
                  hintText: 'النص المشفر ',
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Material(
                          elevation: 4,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                _resultTextController.text = decrypt(
                                    _inputTextController.text,
                                    int.parse(_encryptKeyTextController.text));
                              });
                            },
                            height: 60,
                            child: const Text(
                              'فك تشفير',
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 20,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Material(
                          elevation: 4,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                          child: MaterialButton(
                            onPressed: () {
                              print('تشفير ${_inputTextController.text}');
                              setState(() {
                                _resultTextController.text = encrypt(
                                    _inputTextController.text,
                                    int.parse(_encryptKeyTextController.text));
                              });
                            },
                            height: 60,
                            child: const Text(
                              'تشفير',
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 20,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
