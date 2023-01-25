import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    Key? key,
    required TextEditingController nameController,
    required this.validate,
  })  : _nameController = nameController,
        super(key: key);

  final TextEditingController _nameController;
  final validate;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _nameController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        hintText: 'Name',
      ),
      validator: validate(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
