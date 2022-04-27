import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommanFunction extends StatefulWidget {
  final name;
  const CommanFunction({Key? key, this.name}) : super(key: key);

  @override
  State<CommanFunction> createState() => _CommanFunctionState();
}

class _CommanFunctionState extends State<CommanFunction> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.25), width: 1),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.name,
                  style: GoogleFonts.arimo(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.black)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Text('IN: ' + '30 March ' + '09:00AM',
                  style: GoogleFonts.arimo(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.black)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Text('OUT: ' + '30 March ' + '06:00PM',
                  style: GoogleFonts.arimo(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.black)),
            ],
          ),
        ));
  }
}
