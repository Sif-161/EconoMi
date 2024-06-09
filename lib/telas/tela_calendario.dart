import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class TelaCalendario extends StatefulWidget {
  const TelaCalendario({super.key});

  @override
  _TelaCalendarioState createState() => _TelaCalendarioState();
}

class _TelaCalendarioState extends State<TelaCalendario> {
  CalendarFormat _formatoCalendario = CalendarFormat.month;
  DateTime _diaFocado = DateTime.now();
  DateTime? _diaSelecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Calendário'),
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(1990, 1, 01),
        lastDay: DateTime.utc(2099, 12, 31),
        calendarFormat: _formatoCalendario,
        focusedDay: _diaFocado,
        selectedDayPredicate: (dia) {
          return isSameDay(_diaSelecionado, dia);
        },
        onDaySelected: (diaSelecionado, diaFocado) {
          setState(() {
            _diaSelecionado = diaSelecionado;
            diaFocado = diaFocado; 
          });
        },
        onFormatChanged: (format) {
          setState(() {
            _formatoCalendario = format;
          });
        },
      ),
    );
  }
}