import 'package:flutter/material.dart';

class PasswordComponent extends StatelessWidget {
  final Function(String) onChanged;

  const PasswordComponent({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Введите пароль'),
        TextFormField(
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          decoration: const InputDecoration(hintText: 'пароль'),
          onChanged: onChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Введите пароль';
            }
            return null;
          },
        ),
      ],
    );
  }
}
