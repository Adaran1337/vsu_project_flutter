import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class EmailComponent extends StatelessWidget {
  final Function(String) onChanged;

  const EmailComponent({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('Введите почту'),
      TextFormField(
        decoration: const InputDecoration(hintText: 'email'),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            // TODO: валидация почты
            return 'Введите почту';
          } else if (!EmailValidator.validate(value)) {
            return 'Введите корректную почту';
          }
          return null;
        },
      ),
    ]);
  }
}
