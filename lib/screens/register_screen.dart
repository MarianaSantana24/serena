import 'package:flutter/material.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(4, 90, 118, 1),
              Color.fromRGBO(200, 237, 249, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            // Logo do Serena colada no topo
            Positioned(
              top: 0,  // Distância da parte superior da tela
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/logoserena.png',
                height: 150,  // Ajuste o tamanho conforme necessário
                width: 100,   // Ajuste o tamanho conforme necessário
                fit: BoxFit.contain,  // Mantém a proporção da imagem
              ),
            ),

            // Conteúdo abaixo da logo
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 10),  // Espaço para acomodar a logo

                      // Título "Crie sua conta"
                      const Text(
                        'Crie sua conta',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Container com fundo branco e borda arredondada
                      Container(
                        padding: const EdgeInsets.all(24.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            // Campo "Nome Completo"
                            _buildTextField(_nameController, 'Nome completo', TextInputType.text, false),
                            const SizedBox(height: 20.0),

                            // Campo "Celular"
                            _buildTextField(_phoneController, 'Celular', TextInputType.phone, false),
                            const SizedBox(height: 20.0),

                            // Campo "E-mail"
                            _buildTextField(_emailController, 'E-mail', TextInputType.emailAddress, false),
                            const SizedBox(height: 20.0),

                            // Campo "Senha"
                            _buildTextField(_passwordController, 'Senha', TextInputType.text, true),
                            const SizedBox(height: 24.0),

                            // Botão "Cadastrar"
                            SizedBox(
                              width: 300,
                              child: ElevatedButton(
                                onPressed: _isLoading ? null : _registerUser,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(4, 90, 118, 1),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                child: _isLoading
                                    ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                                    : const Text('Cadastrar'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, TextInputType keyboardType, bool obscureText) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.8),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, preencha este campo.';
          }
          if (label == 'E-mail' && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return 'Por favor, insira um e-mail válido.';
          }
          if (label == 'Celular' && value.length < 10) {
            return 'Por favor, insira um número de celular válido.';
          }
          return null;
        },
      ),
    );
  }

  void _registerUser() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;  // Inicia o indicador de carregamento
      });

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }).whenComplete(() {
        setState(() {
          _isLoading = false;  // Para o indicador de carregamento
        });
      });
    }
  }
}
