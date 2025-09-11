import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String? placeholder;
  final String? initialValue;
  final bool? isTextObscured;
  final TextInputAction? textInputAction;
  final bool isReadOnly;
  final int lines;
  final TextInputType? keyboardType;
  final Function(String)? onFiledSubmittedField;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String)? onChange;
  final Function()? onTap;
  final TextEditingController? controller;

  const Input({
    super.key,
    this.placeholder,
    this.initialValue,
    this.isTextObscured,
    this.textInputAction,
    this.isReadOnly = false,
    this.lines = 1,
    this.keyboardType,
    this.onFiledSubmittedField,
    this.focusNode,
    this.validator,
    this.onSaved,
    this.onChange,
    this.onTap,
    this.controller,
  });

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      controller: widget.controller,
      textAlign: TextAlign.left,
      textInputAction: widget.textInputAction,
      obscureText: widget.isTextObscured ?? false,
      onFieldSubmitted: widget.onFiledSubmittedField,
      keyboardType: widget.keyboardType,
      onTap: widget.onTap,
      focusNode: widget.focusNode,
      validator: widget.validator,
      onSaved: widget.onSaved,
      readOnly: widget.isReadOnly,
      onChanged: widget.onChange,
      minLines: widget.lines,
      maxLines: widget.lines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
      decoration: InputDecoration(
        filled: false,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        focusColor: Colors.deepOrangeAccent,
        hintText: widget.placeholder,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.4),
            width: 2.0,
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2.0,
          ),
        ),
        errorStyle: TextStyle(
          color: Theme.of(context).colorScheme.error,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
