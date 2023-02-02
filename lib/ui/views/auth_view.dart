// ignore_for_file: use_build_context_synchronously
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:infi_devtest/buisness_logic/models/auth_credential_data_model.dart';
import 'package:infi_devtest/buisness_logic/utils/api_constants.dart';
import 'package:infi_devtest/buisness_logic/utils/routes.dart';
import 'package:infi_devtest/buisness_logic/view_models/database_view_model.dart';
import 'package:infi_devtest/services/service_locator.dart';
import 'package:infi_devtest/ui/widgets/background_grad.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const BackgroundGradient(),
          SingleChildScrollView(
            child: SizedBox(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      padding: EdgeInsets.symmetric(
                          vertical: sizeConfig.getPropHeight(10), horizontal: sizeConfig.getPropWidth(60)),
                      transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.primary,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Text(
                        'InfiBox Shop',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 35),
                      ),
                    ),
                  ),
                  const AuthCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({super.key});

  @override
  AuthCardState createState() => AuthCardState();
}

class AuthCardState extends State<AuthCard> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var _isLoading = false;

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text('An Error Occured!'),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    navigationService.pop();
                  },
                  child: const Text('Okay'),
                )
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      final res = await apiService.postRequest(
        ApiConstants.signIn,
        {
          "username": _usernameController.text,
          "password": _passwordController.text,
        },
      );
      debugPrint(res.exception.toString());
      if (res.data != null) {
        Provider.of<LocalDatabase>(context, listen: false).saveAuthCred(
          AuthCredDataModel.fromJson(res.data!),
        );
        navigationService.pushReplacementScreen(Routes.homeScreen);
      }
    } catch (error) {
      const errorMessage = 'Could not authenticate you. Please try again later';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 8.0,
      child: Container(
        height: sizeConfig.getPropHeight(230),
        width: sizeConfig.getPropWidth(270),
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Invalid Username!';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty || value.length < 5) {
                    return 'Password is too short!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text('LOGIN'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
