import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Por Hacer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const CosasPorHacer(
        title: 'Cosas X Hacer',
      ),
    );
  }
}

class CosasPorHacer extends StatefulWidget {
  const CosasPorHacer({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CosasPorHacer> createState() => _CosasPorHacerState();
}

class _CosasPorHacerState extends State<CosasPorHacer> {
  final List<Tarea> _tareas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cosas X Hacer'),
      ),
      body: ListaDeTareas(tasks: _tareas),
      floatingActionButton: FloatingActionButton(
        onPressed: _agregarTarea,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _agregarTarea() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();
        return AlertDialog(
          title: const Text("Agregar nueva tarea"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: "Nombre de la tarea"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                String nombre = controller.text;
                if (nombre.isNotEmpty) {
                  setState(() {
                    _tareas.add(Tarea(nombre: nombre));
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }
}

class ListaDeTareas extends StatefulWidget {
  final List<Tarea> tasks;

  const ListaDeTareas({super.key, required this.tasks});

  @override
  State<ListaDeTareas> createState() => _ListaDeTareasState();
}

class _ListaDeTareasState extends State<ListaDeTareas> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(widget.tasks[index].nombre),
          trailing: Checkbox(
            value: widget.tasks[index].completada,
            onChanged: (bool? value) {
              if (value != null) {
                setState(() {
                  widget.tasks[index].completada = value;
                });
              }
            },
          ),
          onLongPress: () {
            _eliminarTarea(context, index);
          },
        );
      },
    );
  }

  void _eliminarTarea(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Eliminar tarea"),
          content:
              const Text("¿Estás seguro de que quieres eliminar esta tarea?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  widget.tasks.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text("Eliminar"),
            ),
          ],
        );
      },
    );
  }
}

class Tarea {
  String nombre;
  bool completada;

  Tarea({required this.nombre, this.completada = false});
}
