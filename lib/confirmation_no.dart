import 'package:flutter/material.dart';

class ConfirmationNoScreen extends StatefulWidget {
  const ConfirmationNoScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmationNoScreen> createState() => _ConfirmationNoScreenState();
}

class _ConfirmationNoScreenState extends State<ConfirmationNoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        centerTitle: true,
        title: Text('Confirmaton NO'),
      ),
      body: Column(
        children: [Text('no')],
      ),
    );
  }
}
