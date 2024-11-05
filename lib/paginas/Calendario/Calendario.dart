import 'package:fit_plan_proyecto/paginas/Configuraciones/configuracionMenu.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fit_plan_proyecto/paginas/Cronometro/Cronometro.dart';
import 'package:fit_plan_proyecto/paginas/menu.dart';

class Calendario extends StatefulWidget {
  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  int _selectedIndex = 0;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<DateTime, List<String>> _events = {
    DateTime.utc(2023, 9, 15): ['Reunión de trabajo', 'Entrega de proyecto'],
    DateTime.utc(2023, 9, 17): ['Cena familiar', 'Presentación en la escuela'],
  };

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        print("Rutinas");
        break;
      case 1:
        print("Comidas");
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Menu()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Cronometro()),
        );
        break;
      case 4:
        print("Estas en Calendario");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCalendarView(),
      bottomNavigationBar: GNav(
        color: Colors.white,
        activeColor: Colors.white,
        backgroundColor: const Color(0xFFFFA07A),
        padding: const EdgeInsets.all(25),
        tabs: const [
          GButton(icon: Icons.run_circle, text: 'Rutinas', gap: 8),
          GButton(icon: Icons.restaurant, text: 'Comidas', gap: 8),
          GButton(icon: Icons.home, text: 'Inicio', gap: 8),
          GButton(icon: Icons.timer, text: 'Cronómetro', gap: 8),
          GButton(icon: Icons.calendar_today, text: 'Calendario', gap: 8),
        ],
        onTabChange: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_selectedDay != null) {
            _showAddNoteDialog(_selectedDay!);
          }
        },
        backgroundColor: const Color(0xFFFFA07A),
        child: Icon(Icons.add, color: Colors.white),
        tooltip: 'Agregar nota',
      ),
    );
  }

  Widget _buildCalendarView() {
    return Column(
      children: [
        AppBar(
          centerTitle: false,
          title: const Text(
            'Horarios',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Menu()));
            },
          ),
          backgroundColor: const Color(0xFFFFA07A),
          actions: [
            IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConfiguracionMenu()),
                  );
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        Expanded(
          child: Column(
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                calendarFormat: _calendarFormat,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                eventLoader: _getEventsForDay,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekendStyle: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                  weekdayStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  dowTextFormatter: (date, locale) {
                    return date.weekday == 7
                        ? 'D'
                        : date.weekday == 6
                            ? 'S'
                            : 'LMMJVS'[date.weekday - 1].toUpperCase();
                  },
                ),
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    if (_events[day] != null && _events[day]!.isNotEmpty) {
                      return Container(
                        margin: const EdgeInsets.all(4.0),
                        decoration: const BoxDecoration(
                          color: Colors
                              .blueAccent, // Morado claro para días con notas
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                    return null;
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      decoration: const BoxDecoration(
                        color:
                            Colors.redAccent, // Color para el día seleccionado
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 40,
                width: 450,
                child: Text(
                  'Notas: ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 30),
                ),
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: _selectedDay != null
                    ? ListView.builder(
                        itemCount: _getEventsForDay(_selectedDay!).length,
                        itemBuilder: (context, index) {
                          final note = _getEventsForDay(_selectedDay!)[index];
                          return ListTile(
                            title: Text(
                              note,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            onTap: () => _showEditDeleteDialog(
                                _selectedDay!, index, note),
                          );
                        },
                      )
                    : const Center(
                        child: Text('Selecciona una fecha para ver notas')),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showAddNoteDialog(DateTime dateTime) {
    String newNote = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Agregar nota'),
          content: TextField(
            onChanged: (value) {
              newNote = value;
            },
            decoration: const InputDecoration(hintText: 'Escribe tu nota'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (_events[dateTime] != null) {
                    _events[dateTime]!.add(newNote);
                  } else {
                    _events[dateTime] = [newNote];
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text('Agregar',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  void _showEditDeleteDialog(DateTime date, int index, String note) {
    String updatedNote = note;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar/Eliminar nota'),
          content: TextField(
            controller: TextEditingController(text: note),
            onChanged: (value) {
              updatedNote = value;
            },
            decoration: const InputDecoration(hintText: 'Editar tu nota'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (updatedNote.isNotEmpty) {
                    _events[date]![index] = updatedNote;
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text('Guardar',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _events[date]!.removeAt(index);
                  if (_events[date]!.isEmpty) {
                    _events.remove(date);
                  }
                });
                Navigator.of(context).pop();
              },
              child:
                  const Text('Eliminar', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
