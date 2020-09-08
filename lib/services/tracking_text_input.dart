import 'dart:async';

import 'package:White_Bear/services/input_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef void CaretMoved(Offset globalCaretPosition);
typedef void TextChanged(String text);

// Helper widget to track caret position.
class TrackingTextInput extends StatefulWidget {
  TrackingTextInput({
    Key key,
    this.onCaretMoved,
    this.onTextChanged,
    this.hint,
    this.label,
    this.isObscured = false,
    @required this.func,
  }) : super(key: key);
  final CaretMoved onCaretMoved;
  final TextChanged onTextChanged;
  final String hint;
  final String label;
  final bool isObscured;
  final Function func;
  @override
  _TrackingTextInputState createState() => _TrackingTextInputState();
}

class _TrackingTextInputState extends State<TrackingTextInput> {
  final GlobalKey _fieldKey = GlobalKey();
  final TextEditingController _textController = TextEditingController();
  Timer _debounceTimer;
  @override
  initState() {
    _textController.addListener(() {
      // We debounce the listener as sometimes the caret position is updated after the listener
      // this assures us we get an accurate caret position.
      if (_debounceTimer?.isActive ?? false) _debounceTimer.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 100), () {
        if (_fieldKey.currentContext != null) {
          // Find the render editable in the field.
          final RenderObject fieldBox = _fieldKey.currentContext
              .findRenderObject(); //to get the renderbox that is the textbox in Widgets layer
          Offset caretPosition = getCaretPosition(fieldBox);

          if (widget.onCaretMoved != null) {
            //whenever trackingtextinput widget is called and  oncaretmoved function is assigned something other than null
            //caretposition is passed as an argument , the function assigned to oncaretmoved uses the argument and performs its task
            widget.onCaretMoved(caretPosition); //
          }
        }
      });
      if (widget.onTextChanged != null) {
        //whenever trackingtextinput widget is called and  ontextchanged function is assigned something other than null
        //text value is passed as an argument , the function assigned to ontextchanged uses the argument and performs its task
        widget.onTextChanged(_textController.text);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _textController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: widget.hint,
          labelText: widget.label,
        ),
        key:
            _fieldKey, //is used to identify the widget , while finding renderobject
        controller: _textController,
        obscureText: widget.isObscured,
        validator: widget.func,
      ),
    );
  }
}
