import 'package:flutter/material.dart';

class ConsultationScreen extends StatefulWidget {
  const ConsultationScreen({super.key});

  @override
  _ConsultationScreenState createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen> {
  int selectedIndex = 0; // Variável para armazenar o índice selecionado

  // Método para mudar a tela de acordo com o item selecionado
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    // Navegar para a tela correspondente com base no índice selecionado
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home'); // Navega para a tela Home
        break;
      case 1:
        Navigator.pushNamed(context, '/conteudo'); // Navega para a tela Conteúdo
        break;
      case 2:
        Navigator.pushNamed(context, '/agenda'); // Navega para a tela Agenda
        break;
      case 3:
        Navigator.pushNamed(context, '/consulta'); // Navega para a tela Consulta
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FF),
      appBar: AppBar(
        title: const Text('Consultas'),
        centerTitle: true, // Alinha o título ao centro
        backgroundColor: Colors.transparent, // Remove a barra azul
        elevation: 0, // Remove a sombra da AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Espaçamento maior entre o título e o conteúdo
            const SizedBox(height: 50), // Ajuste do espaçamento

            // Ícones para "Marcar Consulta" e "Minhas Consultas"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _iconButton(
                  context,
                  imagePath: 'assets/images/marcar_consulta.png',
                  label: 'Marcar Consulta',
                  route: '/agenda',  // Direciona para a tela de "Marcar Consulta"
                ),
                _iconButton(
                  context,
                  imagePath: 'assets/images/minhas_consultas.png',
                  label: 'Minhas Consultas',
                  route: '/minhasConsultas', // Direciona para a tela de "Minhas Consultas"
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Caixa com "Suas Próximas Consultas"
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(200, 237, 249, 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Suas Próximas Consultas',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(10, 17, 40, 1),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Você não tem consultas agendadas.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(10, 17, 40, 0.548),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Barra de navegação
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

  // Widget para cada botão de ícone
  Widget _iconButton(BuildContext context, {
    required String imagePath,
    required String label,
    required String route,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route); // Navega para a tela correspondente
      },
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 100, // Ajuste o tamanho conforme necessário
            height: 100,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 16, color: Color.fromRGBO(10, 17, 40, 1)),
          ),
        ],
      ),
    );
  }
}
