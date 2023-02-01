import 'package:flutter/material.dart';

class TextInputDecoration {
  static InputDecoration inputDecoration(BuildContext context) {
    return InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      hintText: 'Search',
      filled: true,
      hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
            color: Theme.of(context).secondaryHeaderColor.withOpacity(0.8),
          ),
      suffixIcon: IconButton(
        icon: const Icon(
          Icons.search,
          size: 22,
        ),
        onPressed: () {},
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      fillColor: const Color(0xff11D0A2),
      errorStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
            color: Theme.of(context).errorColor,
          ),
    );
  }
}
