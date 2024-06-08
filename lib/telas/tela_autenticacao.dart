import 'package:controle_financeiro/componentes/snackbar.dart';
import 'package:controle_financeiro/main.dart';
import 'package:controle_financeiro/servicos/autenticacao_servico.dart';
import 'package:flutter/material.dart';
import '../componentes/decoracao_campo_autentificacao.dart';

class TelaAutenticacao extends StatelessWidget {
  const TelaAutenticacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/image/logo.png', height: 120),
          const Text(
            'EconoMi',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.email_outlined, color: Theme.of(context).colorScheme.inverseSurface),
                        const SizedBox(width: 8),
                        Text(
                          'Continuar com E-mail',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            fontSize: 16
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                InkWell(
                  borderRadius: BorderRadius.circular(60),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cadastro()),
                    );
                  },
                  child: const Text(
                    'Não tem uma conta? Cadastre-se aqui',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKeyLogin = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  AutenticacaoServico _autenticacaoServico = AutenticacaoServico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKeyLogin,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/image/logo.png', height: 120),
                  const Text(
                    'EconoMi',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: _emailController,
                    decoration: getAuthenticationInputDecoration('E-mail', context),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Preencha o campo';
                      }
                      if (value.length < 5 || !value.contains('@')) {
                        return 'E-mail inválido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _senhaController,
                    decoration: getAuthenticationInputDecoration('Senha', context),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Preencha o campo';
                      }
                      if (value.length < 6) {
                        return 'A senha deve conter no minimo 6 caracteres';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      if (_formKeyLogin.currentState!.validate()) {
                        _autenticacaoServico.logarUsuario(
                          email: _emailController.text,
                          senha: _senhaController.text
                        ).then((String? erro){
                          if(erro != null){
                            mostrarSnackbar(context: context, mensagem: erro);
                          }
                          else{
                            Navigator.pushReplacement(context, 
                            MaterialPageRoute(
                              builder: (context) => const RoteadorTela()));
                          } 
                        });
                      }
                    },
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 16,
                         color: Theme.of(context).colorScheme.inverseSurface
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Cadastro extends StatefulWidget {
  Cadastro({super.key});

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKeyCadastro = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController = TextEditingController();

  AutenticacaoServico _autenticacaoServico = AutenticacaoServico();

  @override
  void dispose() {
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKeyCadastro,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/image/logo.png', height: 120),
                  const Text(
                    'EconoMi',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: _nomeController,
                    decoration: getAuthenticationInputDecoration('Nome', context),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Preencha o campo';
                      }
                      if (value.length < 6) {
                        return 'O nome deve conter no minimo 6 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    decoration: getAuthenticationInputDecoration('E-mail', context),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Preencha o campo';
                      }
                      if (value.length < 5 || !value.contains('@')) {
                        return 'E-mail inválido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _senhaController,
                    decoration: getAuthenticationInputDecoration('Senha', context),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Preencha o campo';
                      }
                      if (value.length < 6) {
                        return 'A senha deve conter no minimo 6 caracteres';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _confirmarSenhaController,
                    decoration: getAuthenticationInputDecoration('Confirme a senha', context),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Preencha o campo';
                      }
                      if (value != _senhaController.text) {
                        return 'As senhas não coincidem';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      if (_formKeyCadastro.currentState!.validate()) {
                        _autenticacaoServico.cadastrarUsuario(
                          nome: _nomeController.text, 
                          email: _emailController.text, 
                          senha: _senhaController.text,
                        ).then((String? erro){
                          //voltou com erro
                          if (erro != null) {
                            mostrarSnackbar(context: context, mensagem: erro);
                          }
                          else {
                            Navigator.pushReplacement(context, 
                            MaterialPageRoute(
                              builder: (context) => const TelaAutenticacao()));
                          }
                        });
                      }
                    },
                    child:Text(
                      'Cadastrar',
                      style: TextStyle(
                        fontSize: 16,
                         color: Theme.of(context).colorScheme.inverseSurface
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}