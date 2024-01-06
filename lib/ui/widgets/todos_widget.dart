import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spudly/ui/events/events.dart';

class TodosWidget extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: TodosUI()),
    );
  }
}
