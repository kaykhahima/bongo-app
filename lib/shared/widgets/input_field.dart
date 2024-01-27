import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.controller,
    this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    this.onTap,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final VoidCallback? onTap;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText == null
            ? const SizedBox.shrink()
            : Text(widget.labelText!),
        widget.labelText == null ? const SizedBox.shrink() : const Gap(8.0),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          textCapitalization: widget.textCapitalization,
          // autofocus: true,
          maxLength: widget.maxLength,
          style: const TextStyle(
            fontSize: 15.0,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            hintText: widget.hintText ?? widget.labelText,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            isDense: true,
          ),
          validator: widget.validator,
          onTap: widget.onTap,
        ),
      ],
    );
  }
}
