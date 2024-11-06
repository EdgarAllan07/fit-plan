import 'package:fit_plan_proyecto/paginas/Configuraciones/configuracionMenu.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fit_plan_proyecto/paginas/Cronometro/Cronometro.dart';
import 'package:fit_plan_proyecto/paginas/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Calendario extends StatefulWidget {
  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  int _selectedIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Map<String, dynamic>>> _events = {};

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    final user = _auth.currentUser;
    if (user != null) {
      final snapshot = await _firestore
          .collection('NotasCalendario')
          .where('userId', isEqualTo: user.uid)
          .get();

      Map<DateTime, List<Map<String, dynamic>>> newEvents = {};

      for (var doc in snapshot.docs) {
        final data = doc.data();
        final date = (data['fecha'] as Timestamp).toDate();
        final dateKey = DateTime.utc(date.year, date.month, date.day);

        if (newEvents[dateKey] == null) {
          newEvents[dateKey] = [];
        }
        newEvents[dateKey]!.add({
          'id': doc.id,
          'nota': data['nota'],
        });
      }

      setState(() {
        _events = newEvents;
      });
    }
  }

  List<Map<String, dynamic>> _getEventsForDay(DateTime day) {
    final dateKey = DateTime.utc(day.year, day.month, day.day);
    return _events[dateKey] ?? [];
  }

  Future<void> _addNote(DateTime date, String note) async {
    final user = _auth.currentUser;
    if (user != null) {
      final docRef = await _firestore.collection('NotasCalendario').add({
        'userId': user.uid,
        'fecha': Timestamp.fromDate(date),
        'nota': note,
      });

      final dateKey = DateTime.utc(date.year, date.month, date.day);
      setState(() {
        if (_events[dateKey] != null) {
          _events[dateKey]!.add({
            'id': docRef.id,
            'nota': note,
          });
        } else {
          _events[dateKey] = [
            {
              'id': docRef.id,
              'nota': note,
            }
          ];
        }
      });
    }
  }

  Future<void> _updateNote(
      DateTime date, String noteId, String updatedNote) async {
    await _firestore.collection('NotasCalendario').doc(noteId).update({
      'nota': updatedNote,
    });

    final dateKey = DateTime.utc(date.year, date.month, date.day);
    setState(() {
      final noteIndex =
          _events[dateKey]!.indexWhere((note) => note['id'] == noteId);
      if (noteIndex != -1) {
        _events[dateKey]![noteIndex]['nota'] = updatedNote;
      }
    });
  }

  Future<void> _deleteNote(DateTime date, String noteId) async {
    await _firestore.collection('NotasCalendario').doc(noteId).delete();

    final dateKey = DateTime.utc(date.year, date.month, date.day);
    setState(() {
      _events[dateKey]!.removeWhere((note) => note['id'] == noteId);
      if (_events[dateKey]!.isEmpty) {
        _events.remove(dateKey);
      }
    });
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
                eventLoader: (day) => _getEventsForDay(day),
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
                    if (_getEventsForDay(day).isNotEmpty) {
                      return Container(
                        margin: const EdgeInsets.all(4.0),
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
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
                        color: Colors.redAccent,
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
                          final noteData =
                              _getEventsForDay(_selectedDay!)[index];
                          return ListTile(
                            title: Text(
                              noteData['nota'],
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            onTap: () => _showEditDeleteDialog(_selectedDay!,
                                noteData['id'], noteData['nota']),
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
              onPressed: () async {
                if (newNote.isNotEmpty) {
                  await _addNote(dateTime, newNote);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Agregar',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  void _showEditDeleteDialog(DateTime date, String noteId, String note) {
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
              onPressed: () async {
                if (updatedNote.isNotEmpty) {
                  await _updateNote(date, noteId, updatedNote);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Guardar',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () async {
                await _deleteNote(date, noteId);
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
