import 'package:flutter/material.dart';

class FormCheckbox extends StatefulWidget {
  final String label;
  final bool? initialValue;
  final bool? enabled;
  final String? Function(Object?)? validator;
  final Function(bool?)? onSaved;
  final Function(bool?)? onChange;

  const FormCheckbox({
    super.key,
    required this.label,
    this.initialValue,
    required this.onChange,
    this.validator,
    this.onSaved,
    this.enabled,
  });

  @override
  State<FormCheckbox> createState() => _FormCheckboxState();
}

class _FormCheckboxState extends State<FormCheckbox> {
  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: widget.validator,
      onSaved: widget.onSaved,
      initialValue: widget.initialValue ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (state) {
        return CheckboxListTile(
          title: Text(
            widget.label,
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
          ),
          value: state.value,
          onChanged: (value) {
            state.didChange(value);
            widget.onChange?.call(value);
          },
          enabled: widget.enabled ?? true,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
        );
      },
    );
  }
}
