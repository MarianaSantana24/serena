import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/consulta.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({super.key});

  @override
  _AgendaScreenState createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  String? _selectedTime;
  String? _selectedProfessional;
  int selectedIndex = 2;

  final List<String> availableTimes = [
    '09:00',
    '10:00',
    '11:00',
    '13:00',
    '14:00',
    '15:00'
  ];

  final List<String> availableProfessionals = [
    'Dra. Ana Silva',
    'Dr. Carlos Souza',
    'Dra. Maria Oliveira'
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    // Navegação para diferentes telas
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/content');
        break;
      case 2:
        Navigator.pushNamed(context, '/agenda');
        break;
      case 3:
        Navigator.pushNamed(context, '/consulta');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar Consulta'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Widget do Calendário
            TableCalendar(
              locale: 'pt_BR', // Define o idioma como português
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarFormat: CalendarFormat.week,
              headerStyle: HeaderStyle(formatButtonVisible: false),
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Dropdown de Seleção de Horário
            Text('Escolha um horário disponível:'),
            DropdownButton<String>(
              hint: Text('Selecione um horário'),
              value: _selectedTime,
              isExpanded: true,
              items: availableTimes.map((time) {
                return DropdownMenuItem<String>(
                  value: time,
                  child: Text(time),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedTime = value;
                });
              },
            ),
            SizedBox(height: 16),
            // Dropdown de Seleção de Profissional
            Text('Escolha um profissional:'),
            DropdownButton<String>(
              hint: Text('Selecione um profissional'),
              value: _selectedProfessional,
              isExpanded: true,
              items: availableProfessionals.map((professional) {
                return DropdownMenuItem<String>(
                  value: professional,
                  child: Text(professional),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedProfessional = value;
                });
              },
            ),
            Spacer(),
            // Botão de Confirmar
            ElevatedButton(
              onPressed: (_selectedTime != null && _selectedProfessional != null)
                  ? () {
                      // Cria a instância de Consulta
                      final consulta = Consulta(
                        data: _selectedDay,
                        horario: _selectedTime!,
                        profissional: _selectedProfessional!,
                      );

                      // Ação de Confirmação e navegação
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Confirmação'),
                          content: Text(
                            'Você selecionou:\nData: ${_selectedDay.toLocal()}\nHorário: $_selectedTime\nProfissional: $_selectedProfessional',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);

                                // Navegar para Minhas Consultas passando a consulta
                                Navigator.pushNamed(
  context,
  '/minhasconsultas', // Rota nomeada
  arguments: consulta, // Passando o parâmetro consulta
);

                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  : null,
              child: Text('Confirmar'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home.png', width: 24, height: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/content.png', width: 24, height: 24),
            label: 'Conteúdo',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/calendar.png', width: 24, height: 24),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/medical.png', width: 24, height: 24),
            label: 'Consulta',
          ),
        ],
      ),
    );
  }
}
