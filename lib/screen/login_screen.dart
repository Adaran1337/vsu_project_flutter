import 'package:flutter/material.dart';
import 'package:vsu_project/dto/http/auth/login_user_request.dart';
import 'package:vsu_project/screen/component/email_component.dart';
import 'package:vsu_project/screen/component/password_component.dart';
import 'package:vsu_project/service/authentication_service.dart';
import 'package:vsu_project/utils/navigation_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _loginUserRequest = LoginUserRequest();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            EmailComponent(
                onChanged: (value) => _loginUserRequest.email = value),
            const SizedBox(
              height: 50.0,
            ),
            PasswordComponent(
                onChanged: (value) => _loginUserRequest.password = value),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: _onLoginPressed,
              child: const Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }

  _onLoginPressed() async {
    if (_formKey.currentState!.validate()) {
      try {
        await AuthenticationService().login(_loginUserRequest);
      } catch (error) {
        _showSnackBar('Проверьте учётные данные', true);
        return;
      }
      _showSnackBar('Вход был успешно выполнен', false);
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
