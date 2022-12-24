import 'package:fifa_world_cup_2022/app/core/ui/styles/app_button_styles.dart';
import 'package:fifa_world_cup_2022/app/core/ui/styles/app_colors.dart';
import 'package:fifa_world_cup_2022/app/core/ui/styles/app_text_styles.dart';
import 'package:fifa_world_cup_2022/app/pages/auth/login/presenter/login_presenter.dart';
import 'package:fifa_world_cup_2022/app/pages/auth/login/view/login_view_impl.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/widgets/button.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;

  const LoginPage({super.key, required this.presenter});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginViewImpl {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        (MediaQuery.of(context).size.width > 350 ? .30 : .25),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Center(
                      child: Text(
                        'Login',
                        style: context.textStyles.titleWhite,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: emailEC,
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      label: Text('E-mail'),
                    ),
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo obrigatório'),
                      Validatorless.email('E-mail inválido'),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                      controller: passwordEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        label: Text('Senha'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Campo obrigatório'),
                        Validatorless.min(6, 'Mínimo 6 caracteres'),
                      ])),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0, top: 20, bottom: 25),
                    child: Text(
                      'Esqueceu a senha?',
                      style: context.textStyles.textSecondaryFontMedium.copyWith(
                        color: context.colors.yellow,
                      ),
                    ),
                  ),
                  Button(
                    width: MediaQuery.of(context).size.width * .9,
                    style: context.buttonStyles.yellowButton,
                    onPressed: () {
                      showLoader();
                      final valid = formKey.currentState?.validate() ?? false;
                      if (valid) {
                        widget.presenter.login(emailEC.text, passwordEC.text);
                      }
                    },
                    label: 'Entrar',
                    labelStyle: context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
                  ),
                ]),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Spacer(),
                    Text.rich(
                      style: context.textStyles.textSecondaryFontMedium.copyWith(
                        color: Colors.white,
                      ),
                      TextSpan(text: 'Não possui uma conta?', children: [
                        TextSpan(
                          text: 'Cadastre-se',
                          style: context.textStyles.textSecondaryFontMedium.copyWith(
                            color: context.colors.yellow,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.of(context).pushNamed('/auth/register'),
                        ),
                      ]),
                    ),
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
