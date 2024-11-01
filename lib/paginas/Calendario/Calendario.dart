import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fit_plan_proyecto/paginas/Cronometro/Cronometro.dart';
import 'package:fit_plan_proyecto/paginas/menu.dart';


class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    CalendarWithNotes(),
    CalendarWithNotes(),
    const Menu(),
    const Cronometro(),
    const Menu(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>const Menu()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Menu()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Cronometro()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Menu()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      _screens[_selectedIndex],
      // Eliminar esta parte para quitar la barra de navegación inferior
      bottomNavigationBar: GNav(
        color: Colors.white,
        activeColor: Colors.white,

        backgroundColor:const  Color(0xFFFFA07A),

        padding: const EdgeInsets.all(25),
        tabs: const [
          GButton(
            icon: Icons.run_circle,
            text: 'Rutinas',
            gap: 8
          ),
          GButton(
            icon: Icons.restaurant,
            text: 'Comidas',
            gap: 8),
          GButton(
            icon: Icons.home,
            text: 'Inicio',
            gap: 8
            ),
          GButton(icon: Icons.calculate,
          text: 'Calcular',
            gap: 8),
          GButton(icon: Icons.menu,
          text: 'Menu',
            gap: 8),
        ],
        onTabChange: _onItemTapped
      ),
    );
  }
}

class CalendarWithNotes extends StatefulWidget {
  const CalendarWithNotes({super.key});

  @override
  _CalendarWithNotesState createState() => _CalendarWithNotesState();
}

class _CalendarWithNotesState extends State<CalendarWithNotes> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<DateTime, List<String>> _events = {
    DateTime.utc(2023, 9, 15): ['Reunión de trabajo', 'Entrega de proyecto'],
    DateTime.utc(2023, 9, 17): ['Cena familiar', 'Presentación en la escuela'],
  };

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Horarios', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
        leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: (){
          Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                            const Menu()));
        },
        ),

        backgroundColor:const  Color(0xFFFFA07A), // Color de la barra superior

      ),
      body: Column(
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

              weekendStyle:const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              weekdayStyle:const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),

              dowTextFormatter: (date, locale) {
                return date.weekday == 7 ? 'D' : date.weekday == 6 ? 'S' : 'LMMJVS'[date.weekday - 1].toUpperCase();
              },
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                if (_events[day] != null && _events[day]!.isNotEmpty) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),

                    decoration:const BoxDecoration(

                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${day.day} ',

                        style:const TextStyle(color: Colors.white),

                      ),
                    ),
                  );
                }
                return null;
              },
              selectedBuilder: (context, day, focusedDay) {
                return Container(
                  margin: const EdgeInsets.all(4.0),

                  decoration:const BoxDecoration(
                    color:Color(0xFFFFA07A),

                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',

                      style:const TextStyle(color: Colors.white),

                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 40,
            width: 450,
            child: Text('Notas: ',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w700, color: Colors.black ,fontSize: 30
            ))
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: _selectedDay != null
                ? ListView.builder(
                    itemCount: _getEventsForDay(_selectedDay!).length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_getEventsForDay(_selectedDay!)[index], 

                        style:const TextStyle(

                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),),
                      );
                    },
                  )

                :const Center(child: Text('Selecciona una fecha para ver notas')),

          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_selectedDay != null) {
            _showAddNoteDialog(_selectedDay!);
          }
        },

        backgroundColor:const Color(0xFFFFA07A),
        child: Icon(Icons.add, color: Colors.white),

        tooltip: 'Agregar nota',
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showAddNoteDialog(DateTime day) {
    String newNote = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(

          title:const Text('Agregar nota'),

          content: TextField(
            onChanged: (value) {
              newNote = value;
            },

            decoration:const InputDecoration(hintText: 'Escribe tu nota'),

          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },

              child:const Text('Cancelar'),

            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (_events[day] != null) {
                    _events[day]!.add(newNote);
                  } else {
                    _events[day] = [newNote];
                  }
                });
                Navigator.of(context).pop();
              },

              child:const Text('Agregar', style: TextStyle(fontWeight: FontWeight.bold)),

            ),
          ],
        );
      },
    );
  }
}