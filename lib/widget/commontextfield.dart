
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final validator;
  final String? labelText;
  final bool? isTextHidden;
  final String? hintText;
  final IconData? buttonIcon;
  final IconData? prefixIcon;
  final bool? togglePassword;
  final toggleFunction;
  final IconData? toggleIcon;
  final TextInputType? keyboardType;
  final Color? borderColor;
  final bool? readOnly;
  final onTap;
  final onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focus;
  CommonTextField(
      {@required this.controller,
        this.validator,
        this.labelText,
        this.hintText,
        this.isTextHidden,
        this.buttonIcon,
        this.prefixIcon,
        this.onChanged,
        this.togglePassword=false,
        this.toggleFunction,
        this.toggleIcon,
        this.keyboardType,
        this.borderColor,
        this.readOnly,
        this.onTap,
        this.inputFormatters,
        this.focus}
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      obscureText: isTextHidden!,readOnly: readOnly==null ? false : true,
      onTap:onTap,
      focusNode: focus!=null ? focus : null,
      keyboardType: keyboardType==null ? TextInputType.text : keyboardType,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon:prefixIcon!=null ? Icon(prefixIcon) : null,
        suffixIcon: togglePassword! ? GestureDetector(child: Icon(toggleIcon),onTap: toggleFunction) : null,
        enabledBorder: OutlineInputBorder(
          borderSide:BorderSide(color:borderColor ?? Color(0xff8D99B2),),
          borderRadius: BorderRadius.all(Radius.circular(2.0),),
        ),

        focusedBorder:OutlineInputBorder(
          borderSide:BorderSide(color:borderColor ?? Color(0xffEDA024),),
          borderRadius: BorderRadius.all(Radius.circular(2.0),),
        ),

        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(color: Color(0xffB2B2B2).withOpacity(0.7),fontSize: 9,fontWeight: FontWeight.w400,fontFamily: 'Roboto',letterSpacing: 0.0),
        contentPadding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 18.0),
        labelText: labelText,
        labelStyle: TextStyle(color: Color(0xffB2B2B2),fontSize: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(2.0),
          ),
        ),
      ),
      controller: controller,
      validator: validator,

    );
  }
}
