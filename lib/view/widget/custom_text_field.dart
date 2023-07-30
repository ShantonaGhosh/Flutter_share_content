import 'package:flutter/material.dart';


import 'my_text_style.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.prefixIcon,
    this.inputType,
    this.lebelText,
    this.maxLines,
    this.data,
    this.hintText,
    this.initialText,
    this.suffixIcon,
    this.formatter,
    this.obscureText,
    required this.controller,
    this.onChanged,
    this.fillColor,
    this.validatorText,
    this.padding,
    this.radius,
    this.readOnly,
    this.minLines,
    this.textInputAction,
    this.maxLength,
    this.textAlign,
    this.textAlignVertical,
    this.counterText,
    this.onTap,
    this.textStyle,
    this.hintStyle,
    this.textCopyPaste,
    this.floatingLabelBehavior,
    this.textFieldHeight,
  });

  final TextEditingController controller;
  final dynamic data;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialText;
  final String? hintText;
  final int? maxLines;
  final String? lebelText;
  final dynamic formatter;
  final TextInputType? inputType;
  final bool? obscureText;
  final Color? fillColor;
  final void Function(String)? onChanged;
  final String? validatorText;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final bool? readOnly;
  final int? minLines;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final String? counterText;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final bool? textCopyPaste;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final double? textFieldHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 6.0),
      height: textFieldHeight,
      child: TextFormField(
        // showCursor: true,
        onTap: onTap,
        readOnly: readOnly ?? false,
        minLines: minLines ?? 1,
        maxLines: maxLines ?? 1,
        initialValue: initialText,
        keyboardType: inputType ?? TextInputType.text,
        controller: controller,
        inputFormatters: formatter,
        // autocorrect: true,
        enableInteractiveSelection: textCopyPaste ?? true,

        obscureText: obscureText ?? false,
        obscuringCharacter: '*',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$validatorText';
          }
          return null;
        },
        //onSaved: (String value) => data[keyy] = value,
        // onChanged: (initialText) => {},
        onChanged: onChanged,
        textInputAction: textInputAction ?? TextInputAction.done,
        autofocus: false,
        style: textStyle ??
            myTextStyle(clr: Colors.black87, lSpace: 1.0, size: 16.0),

        maxLength: maxLength,
        textAlign: textAlign ?? TextAlign.start,
        textAlignVertical: textAlignVertical,
        decoration: InputDecoration(
          counterText: counterText,
          fillColor: fillColor ?? Colors.white,
          filled: true,
          floatingLabelBehavior:
              floatingLabelBehavior ?? FloatingLabelBehavior.always,
          floatingLabelStyle: myTextStyle(
            size: 18.0,
            clr: Colors.blueGrey,
            fw: FontWeight.w500,
          ),
          border: InputBorder.none,
          labelText: lebelText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          labelStyle: const TextStyle(color: Colors.black54, fontSize: 16),
          hintText: hintText,
          hintStyle: hintStyle ??
              myTextStyle(
                clr: Colors.black38,
                fw: FontWeight.w400,
                size: 14.0,
              ),
          contentPadding:
              padding ?? const EdgeInsets.fromLTRB(36.0, 10.0, -20.0, 10.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400, width: 0.6),
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 50.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color:  Colors.blueGrey, width: 0.8),
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 50.0)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400, width: 0.8),
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 50.0)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color:  Colors.blueGrey, width: 0.8),
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 50.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color:  Colors.blueGrey, width: 0.8),
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 50.0)),
          ),
        ),
      ),
    );
  }
}
