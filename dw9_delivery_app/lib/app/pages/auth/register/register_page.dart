import 'package:dw9_delivery_app/app/core/ui/base_state/base_state.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_controller.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          register: () => showLoader(),
          error: () {
            hideLoader();
            showError('Erro ao cadastrar');
          },
          success: () {
            hideLoader();
            showSucess('Cadastro realizado com sucesso');
            Navigator.pop(context);
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textStyles.textTitle,
                  ),
                  Text(
                    'Preencha os campos abaixo para se cadastrar',
                    style: context.textStyles.textMedium.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: Validatorless.required('Nome Obrigatório'),
                    controller: _nameEC,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Email Obrigatório'),
                        Validatorless.email('Email Inválido'),
                      ],
                    ),
                    controller: _emailEC,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Senha Obrigatória'),
                        Validatorless.min(
                          6,
                          'Senha deve ter no mínimo 6 caracteres',
                        ),
                      ],
                    ),
                    controller: _passwordEC,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Confirmação Obrigatória'),
                        Validatorless.compare(
                            _passwordEC, 'Senha diferente de confirma senha')
                      ],
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Confirmar Senha',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: DeliveryButton(
                      width: double.infinity,
                      label: 'Cadastrar',
                      onPressed: () {
                        final isValid =
                            _formKey.currentState?.validate() ?? false;
                        if (isValid) {
                          controller.register(
                            _nameEC.text,
                            _emailEC.text,
                            _passwordEC.text,
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
