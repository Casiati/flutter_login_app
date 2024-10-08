import 'package:default_login_screen/models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Consumer<AuthModel>(
          builder: (context, authModel, child) {
            return Card(
              elevation: 8, 
              margin: const EdgeInsets.all(16), 
              child: Padding(
                padding: const EdgeInsets.all(16), 
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min, 
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu email';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Senha'),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira sua senha';
                          }
                          return null;
                        },
                      ),
                      if (authModel.isLoading) 
                        const CircularProgressIndicator(),
                      const SizedBox(height: 20), 
                      ElevatedButton(
                        onPressed: authModel.isLoading 
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  
                                  await authModel.login(); 

                                  
                                  if (context.mounted) {
                                    Navigator.pushNamed(context, '/home');
                                  }
                                }
                              },
                        child: const Text('Entrar'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}