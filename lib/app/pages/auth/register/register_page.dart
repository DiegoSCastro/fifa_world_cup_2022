import 'package:fifa_world_cup_2022/app/core/ui/styles/app_text_styles.dart';
import 'package:fifa_world_cup_2022/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:fifa_world_cup_2022/app/pages/auth/register/view/register_view_impl.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/widgets/button.dart';

class RegisterPage extends StatefulWidget {
  final RegisterPresenter presenter;
  const RegisterPage({super.key, required this.presenter});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                height: 106,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bola.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 30),
                child: Text(
                  'Cadastrar usuário',
                  style: context.textStyles.titleBlack,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameEC,
                      decoration: const InputDecoration(
                        label: Text('Nome Completo'),
                      ),
                      validator: Validatorless.required('Campo obrigatório'),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: emailEC,
                      decoration: const InputDecoration(
                        label: Text('E-mail'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Campo obrigatório'),
                        Validatorless.email('E-mail inválido')
                      ]),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Senha'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Campo obrigatório'),
                        Validatorless.min(6, 'A senha deve ter ao menos 6 caracteres')
                      ]),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                        controller: confirmPasswordEC,
                        obscureText: true,
                        decoration: const InputDecoration(
                          label: Text('Confirmar senha'),
                        ),
                        validator: Validatorless.multiple([
                          Validatorless.required('Campo obrigatório'),
                          Validatorless.min(6, 'A senha deve ter ao menos 6 caracteres'),
                          Validatorless.compare(passwordEC, 'As senhas devem ser iguais'),
                        ])),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Button.primary(
                        width: MediaQuery.of(context).size.width * .9,
                        onPressed: () {
                          final formValid = formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            showLoader();
                            widget.presenter.register(
                              name: nameEC.text,
                              email: emailEC.text,
                              password: passwordEC.text,
                              passwordConfirmation: confirmPasswordEC.text,
                            );
                          }
                        },
                        label: 'Cadastrar',
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
