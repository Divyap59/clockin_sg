import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:zippy/helper/color_constant.dart';

//https://github.com/prestigegodson/pin-entry-text-field/tree/master/pin_entry_text_field

class PinEntryTextField extends StatefulWidget {
  final String lastPin;
  final int fields;
  final ValueChanged<String> onSubmit;
  final num fieldWidth;
  final num fontSize;
  final bool isTextObscure;
  final bool showFieldAsBox;
  final cursorColor;
  final boxColor;
  final textColor;

  PinEntryTextField({
    required this.lastPin,
    this.fields: 4,
    required this.onSubmit,
    this.fieldWidth: 60.0,
    this.fontSize: 20.0,
    this.isTextObscure: false,
    this.showFieldAsBox: false,
    this.cursorColor: Colors.grey,
    this.boxColor: Colors.grey,
    this.textColor: Colors.black,
  }) : assert(fields > 0);

  @override
  State createState() {
    return PinEntryTextFieldState();
  }
}

class PinEntryTextFieldState extends State<PinEntryTextField> {
  late List<String> _pin;
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _textControllers;

  Widget textFields = Container();

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    // _pin = List<String>(widget.fields);
    // _focusNodes = List<FocusNode>(widget.fields);
    // _textControllers = List<TextEditingController>(widget.fields);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (widget.lastPin != null) {
          for (var i = 0; i < widget.lastPin.length; i++) {
            _pin[i] = widget.lastPin[i];
          }
        }
        textFields = generateTextFields(context);
      });
    });
  }

  @override
  void dispose() {
    _textControllers.forEach((TextEditingController t) => t.dispose());
    super.dispose();
  }

  Widget generateTextFields(BuildContext context) {
    List<Widget> textFields = List.generate(widget.fields, (int i) {
      return buildTextField(i, context, i == 0);
    });

    if (_pin.first != null) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: textFields);
  }

  void clearTextFields() {
    _textControllers.forEach(
        (TextEditingController tEditController) => tEditController.clear());
    _pin.clear();
  }

  Widget buildTextField(int i, BuildContext context, [bool autofocus = false]) {
    if (_focusNodes[i] == null) {
      _focusNodes[i] = FocusNode();
    }
    if (_textControllers[i] == null) {
      _textControllers[i] = TextEditingController();
      if (widget.lastPin != null) {
        _textControllers[i].text = widget.lastPin[i];
      }
    }

    _focusNodes[i].addListener(() {
      if (_focusNodes[i].hasFocus) {}
    });

    final String lastDigit = _textControllers[i].text;

    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 10.0),
      child: TextField(
        controller: _textControllers[i],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        cursorColor: widget.cursorColor,
        maxLength: 1,
        autofocus: autofocus,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: widget.textColor,
          fontSize: 25,
        ),
        focusNode: _focusNodes[i],
        obscureText: widget.isTextObscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide.none,
          ),
          //contentPadding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          hintStyle: TextStyle(color: Colors.black12, fontFamily: "AppFont"),
          filled: true,
          fillColor: Colors.grey,
          hintText: '*',
          counterText: '',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
        ),
        onChanged: (String str) {
          setState(() {
            _pin[i] = str;
          });
          if (i + 1 != widget.fields) {
            _focusNodes[i].unfocus();
            if (lastDigit != null && _pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            } else {
              FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
            }
          } else {
            _focusNodes[i].unfocus();
            if (lastDigit != null && _pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            }
          }
          if (_pin.every((String digit) => digit != null && digit != '')) {
            widget.onSubmit(_pin.join());
          }
        },
        onSubmitted: (String str) {
          if (_pin.every((String digit) => digit != null && digit != '')) {
            widget.onSubmit(_pin.join());
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return textFields;
  }
}
