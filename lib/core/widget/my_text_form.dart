import 'package:flutter/material.dart';

class MyTextForm extends StatefulWidget {
  final FocusNode? focus;
  final TextEditingController controller;
  final String label;
  final String? hint;
  final bool isObscure;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String?)? focusScope;
  final Widget? iconDroite;
  final Widget? iconGauche;

  const MyTextForm({
    super.key,
    required this.controller,
    required this.label,
    this.focus,
    this.hint,
    this.isObscure = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.focusScope,
    this.iconDroite,
    this.iconGauche,
  });
  @override
  State<MyTextForm> createState() => _MyTextForm();
}

class _MyTextForm extends State<MyTextForm> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focus,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.focusScope,
      obscureText: _isObscure,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        prefixIcon: widget.iconGauche != null
            ? Padding(
                padding: EdgeInsetsDirectional.only(start: 12),
                child: widget.iconGauche,
              )
            : null,
        suffixIcon: widget.isObscure
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: Icon(
                  _isObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              )
            : (widget.iconDroite != null
                  ? Padding(
                      padding: EdgeInsetsDirectional.only(start: 12),
                      child: widget.iconDroite,
                    )
                  : null),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }
}
