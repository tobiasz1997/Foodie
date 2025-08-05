import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/common/models/select.dart';

class Dropdown<T> extends StatefulWidget {
  final Key? fieldKey;
  final String? placeholder;
  final T? initialValue;
  final bool? enabled;
  final TextEditingController? controller;
  final List<SelectionItem<Object?>> list;
  final String? Function(Object?)? validator;
  final Function(Object?)? onSaved;
  final Function(Object?)? onChange;

  const Dropdown({
    super.key,
    this.placeholder,
    this.controller,
    required this.list,
    this.validator,
    this.onSaved,
    this.onChange,
    this.initialValue,
    this.enabled,
    this.fieldKey,
  });

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FormField(
            key: widget.fieldKey,
            validator: widget.validator,
            onSaved: widget.onSaved,
            initialValue: widget.initialValue,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enabled: widget.enabled ?? true,
            builder: (state) {
              return DropdownMenu(
                controller: _controller,
                hintText: widget.placeholder,
                expandedInsets: EdgeInsets.zero,
                initialSelection: state.value,
                errorText: state.errorText,
                enableFilter: true,
                enabled: widget.enabled ?? true,
                requestFocusOnTap: true,
                menuHeight: MediaQuery.of(context).size.height / 4,
                onSelected: (value) {
                  print(value);
                  state.didChange(value);
                  widget.onChange?.call(value);

                  if (value == null) {
                    _controller.clear();
                  }
                },
                dropdownMenuEntries: widget.list
                    .map(
                      (option) => DropdownMenuEntry(
                        label: option.label,
                        value: option.value,
                        enabled: option.value != null,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                          state.value == option.value
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                        )),
                        labelWidget: Text(
                          option.label,
                          style: TextStyle(
                            fontWeight: state.value == option.value
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        trailingIcon: state.value == option.value
                            ? FaIcon(
                                FontAwesomeIcons.check,
                                size: 20,
                                color: Theme.of(context).colorScheme.secondary,
                              )
                            : null,
                      ),
                    )
                    .toList(),
                menuStyle: MenuStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                trailingIcon: FaIcon(
                  FontAwesomeIcons.caretDown,
                  size: 20,
                  color: Theme.of(context).iconTheme.color,
                ),
                selectedTrailingIcon: FaIcon(
                  FontAwesomeIcons.caretUp,
                  size: 20,
                  color: Theme.of(context).iconTheme.color,
                ),
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 18),
                inputDecorationTheme: InputDecorationTheme(
                  filled: false,
                  focusColor: Colors.deepOrangeAccent,
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.4),
                      width: 2.0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.error, width: 2.0),
                  ),
                  errorStyle: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
