import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:serena_app/models/consulta.dart';
import 'package:serena_app/screens/minhas_consultas.dart';
import 'screens/home_screen.dart';
import 'screens/agenda_screen.dart';
import 'screens/consultation_screen.dart';
import 'screens/content_screen.dart';
import 'screens/register_screen.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Assegura que o Flutter está pronto
  await initializeDateFormatting(
      'pt_BR', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/content': (context) => const ContentScreen(),
        '/agenda': (context) =>  const AgendaScreen(),
        '/consulta': (context) => const ConsultationScreen(),
        '/minhasconsultas': (context) {
          final Consulta consulta = ModalRoute.of(context)?.settings.arguments as Consulta;
          return MinhasConsultasScreen(consulta: consulta); // Passando o parâmetro consulta
        },
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira um e-mail.';
    }
    String pattern = r'^[^@]+@[^@]+\.[^@]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Por favor, insira um e-mail válido.';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira a senha.';
    }
    return null;
  }

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Coloca os itens no topo
              children: <Widget>[
                const SizedBox(height: 10), // Espaçamento fixo do topo
                // Logo acima do título
                Image.asset(
                  'assets/images/logoserena.png', // Caminho da logo
                  height: 172, // Aumente o valor para o tamanho desejado
                  width: 129, // Opcional: se quiser definir a largura também
                ),
                const SizedBox(height: 10), // Espaço entre a logo e o título
                Text(
                  'Bem-vindo(a)!',
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                          color: Colors.transparent), // Borda transparente
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                          color: Colors.transparent), // Borda transparente
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                          color: Colors.transparent), // Borda transparente
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: _validateEmail, // Adicionando validação
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                          color: Colors.transparent), // Borda transparente
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                          color: Colors.transparent), // Borda transparente
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                          color: Colors.transparent), // Borda transparente
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: _validatePassword, // Adicionando validação
                ),
                const SizedBox(height: 24.0),
                // Botão com tamanho de 303x40
                SizedBox(
                  width: 303, // Largura do botão
                  height: 40, // Altura do botão
                  child: ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _isLoading = true;
                              });

                              // Simulação de carregamento
                              Future.delayed(const Duration(seconds: 2), () {
                                // Redireciona para a HomeScreen
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeScreen()),
                                );
                              }).whenComplete(() {
                                setState(() {
                                  _isLoading = false;
                                });
                              });
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(4, 90, 118, 1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white))
                        : const Text('Entrar'),
                  ),
                ),
                const SizedBox(height: 16), // Espaçamento entre os botões
                // Botão "Não tem uma conta?"
                SizedBox(
                  width: 303, // Largura do botão
                  height: 40, // Altura do botão
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()),
                      );
                    },
                    child: const Text(
                      'Não tem uma conta? Cadastre-se',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Espaçamento entre os botões
                TextButton(
                  onPressed: () {
                    // Lógica para redirecionar para a tela de redefinição de senha
                  },
                  child: const Text(
                    'Esqueceu a senha?',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
