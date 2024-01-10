import 'package:flutter/material.dart';
import 'package:vsu_project/dto/http/auth/register_user_request.dart';
import 'package:vsu_project/screen/component/email_component.dart';
import 'package:vsu_project/screen/component/password_component.dart';
import 'package:vsu_project/service/authentication_service.dart';
import 'package:vsu_project/utils/navigation_utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final _registerUserRequest = RegisterUserRequest();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text('Введите никнейм'),
            TextFormField(
              decoration: const InputDecoration(hintText: 'никнейм'),
              onChanged: (value) => _registerUserRequest.nickname = value,
              maxLength: 30,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Введите никнейм';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            EmailComponent(
              onChanged: (value) => _registerUserRequest.email = value,
            ),
            const SizedBox(
              height: 30.0,
            ),
            PasswordComponent(
                onChanged: (value) => _registerUserRequest.password = value),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: _onRegistrationPressed,
              child: const Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }

  _onRegistrationPressed() async {
    if (_formKey.currentState!.validate()) {
      try {
        await AuthenticationService().register(_registerUserRequest);
      } catch (error) {
        _showSnackBar('Проверьте учётные данные', true);
        return;
      }
      _showSnackBar('Аккаунт успешно зарегистрирован', false);
      _pushToMain();
    }
  }

  _showSnackBar(String text, bool hasError) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: hasError ? Colors.red : Colors.green,
      ),
    );
  }

  _pushToMain() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      NavigationUtils.list,
      (Route<dynamic> route) => false,
    );
  }
}
