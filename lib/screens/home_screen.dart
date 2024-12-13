import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:serena_app/screens/agenda_screen.dart';
import 'package:serena_app/screens/consultation_screen.dart';
import 'package:serena_app/screens/content_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0; // índice da página selecionada

  // Atualiza o índice da página selecionada
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // Lista de páginas
  final List<Widget> pages = [
    const HomeScreen(),
    const ContentScreen(),
    const AgendaScreen(),
    const ConsultationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 241, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Foto de perfil e nome
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('assets/images/profile_pic.jpg'),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nome do Usuário',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(10, 17, 40, 1),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/profileSettings');
                          },
                          child: const Text(
                            'Perfil e configurações',
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Carrossel de Emojis
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _emojiItem('😄'),
                    _emojiItem('😢'),
                    _emojiItem('😡'),
                    _emojiItem('😱'),
                    _emojiItem('😎'),
                    _emojiItem('😍'),
                    _emojiItem('🤔'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Botão "Registrar Emoções"
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navegação para a tela de registro de emoções
                    Navigator.pushNamed(context, '/registroEmocional');
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    backgroundColor: const Color.fromRGBO(7, 149, 197, 1),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Registrar Emoções'),
                ),
              ),
              const SizedBox(height: 30),

              // Seção "Meu conteúdo diário - hoje"
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Meu Conteúdo Diário - Hoje',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromRGBO(10, 17, 40, 1),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Carrossel de Cards
              SizedBox(
                height: 119,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _contentCardWithDate(context),
                    _contentCard(
                      title: 'Entendendo a Ansiedade',
                      imagePath: 'assets/images/anxiety.png',
                      gradientStart: const Color.fromRGBO(255, 191, 145, 1),
                      gradientEnd: const Color.fromRGBO(255, 131, 42, 1),
                    ),
                    _contentCard(
                      title: 'Gerenciamento de Estresse',
                      imagePath: 'assets/images/alert.png',
                      gradientStart: const Color.fromRGBO(255, 166, 166, 1),
                      gradientEnd: const Color.fromRGBO(252, 69, 69, 1),
                    ),
                    _contentCard(
                      title: 'Dificuldade de Dormir',
                      imagePath: 'assets/images/insomnia.png',
                      gradientStart: const Color.fromRGBO(166, 186, 255, 1),
                      gradientEnd: const Color.fromRGBO(40, 58, 221, 1),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Seção "Nos dias de ansiedade..."
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: 349,
                  height: 171,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nos dias de ansiedade...',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(10, 17, 40, 1),
                          ),
                        ),
                        const SizedBox(height: 16),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _iconButton(
                              context,
                              imagePath: 'assets/images/relaxamento.png',
                              label: 'Relaxamento',
                              route: '/relaxationPage',
                            ),
                            _iconButton(
                              context,
                              imagePath: 'assets/images/meditacao.png',
                              label: 'Meditação',
                              route: '/meditationPage',
                            ),
                            _iconButton(
                              context,
                              imagePath: 'assets/images/respiracao.png',
                              label: 'Respiração',
                              route: '/breathingPage',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Seção para as próximas consultas
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: 349,
                  height: 148,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(200, 237, 249, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Suas Próximas Consultas',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 1),
                        const Text(
                          'Você ainda não tem consulta agendada.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(10, 17, 40, 0.548),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/marcarConsulta');
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(260, 30),
                              backgroundColor:
                                  const Color.fromRGBO(7, 149, 197, 1),
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Marcar Consulta'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex, // Define o índice da página selecionada
        onTap: onItemTapped, // Chama o método onItemTapped quando um item for tocado
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png', // Caminho da imagem do ícone Home
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/content.png', // Caminho da imagem do ícone Content
              width: 24,
              height: 24,
            ),
            label: 'Conteúdo',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/calendar.png', // Caminho da imagem do ícone Agenda
              width: 24,
              height: 24,
            ),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/medical.png', // Caminho da imagem do ícone Consulta
              width: 24,
              height: 24,
            ),
            label: 'Consulta',
          ),
        ],
      ),
    );
  }


  // Widget para cada item de emoji
  Widget _emojiItem(String emoji) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: CircleAvatar(
        radius: 35,
        backgroundColor: const Color.fromRGBO(200, 237, 249, 1),
        child: Text(
          emoji,
          style: const TextStyle(
              fontSize: 30, color: Color.fromRGBO(7, 149, 197, 1)),
        ),
      ),
    );
  }

  // Widget para cada card de conteúdo
  Widget _contentCard({
    required String title,
    required String imagePath,
    required Color gradientStart,
    required Color gradientEnd,
  }) {
    return Container(
      width: 105,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [gradientStart, gradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Image.asset(
            imagePath,
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }

  // Widget para o card com data
  Widget _contentCardWithDate(BuildContext context) {
    Intl.defaultLocale = 'pt_BR';
    final now = DateTime.now();
    final formattedDate = DateFormat('dd MMMM, yyyy', 'pt_BR').format(now);

    return Container(
      width: 105,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromRGBO(7, 149, 197, 1).withOpacity(0.28),
            const Color.fromRGBO(108, 210, 239, 1).withOpacity(0.12)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            formattedDate,
            style: const TextStyle(
                color: Color.fromRGBO(37, 103, 144, 1), fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Image.asset(
            'assets/images/add.png', // Caminho da imagem
            width: 30, // Largura da imagem
            height: 30, // Altura da imagem
            color: const Color.fromRGBO(37, 103, 144, 1),
          ),
        ],
      ),
    );
  }

  // Widget para os botões com ícones
  Widget _iconButton(
    BuildContext context, {
    required String imagePath,
    required String label,
    required String route,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, route); // Navega para a página correspondente
          },
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(10, 17, 40, 1),
          ),
        ),
      ],
    );
  }
}
