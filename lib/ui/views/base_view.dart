// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:infi_devtest/services/service_locator.dart';
import 'package:provider/provider.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  const BaseView({
    super.key,
    required this.builder,
    this.onModelReady,
  });
  final Function(T)? onModelReady;
  final Widget Function(BuildContext, T, Widget?) builder;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> with AutomaticKeepAliveClientMixin {
  T model = serviceLocator<T>();

  @override
  void initState() {
    widget.onModelReady?.call(
      model,
    );
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    super.build(context);
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
