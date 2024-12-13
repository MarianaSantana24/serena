import 'package:flutter/material.dart';
import 'package:serena_app/models/consulta.dart';

class MinhasConsultasScreen extends StatelessWidget {
  final Consulta consulta;

  MinhasConsultasScreen({Key? key, required this.consulta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 241, 255), // Cor de fundo
      appBar: AppBar(
        title: const Text('Minhas Consultas'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Card com os dados da consulta
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0), // Bordas arredondadas
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Consulta Agendada',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade700, // Cor do título
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Data: ${consulta.data.toLocal()}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Horário: ${consulta.horario}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Profissional: ${consulta.profissional}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}