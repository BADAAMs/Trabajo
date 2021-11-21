import 'package:flutter/material.dart';
import 'package:flutter_ayuda/1/persona.dart';
import 'package:flutter_ayuda/3/base_de_datos.dart';

class MyTablePage extends StatefulWidget {
  const MyTablePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyTablePage> createState() => _MyTablePageState();
}

class _MyTablePageState extends State<MyTablePage> {
  List<Persona> personas = [];

  @override
  void initState() {
    cargaPersonas();
    super.initState();
  }

  cargaPersonas() async {
    List<Persona> auxPersonas = await DB.personas();

    setState(() {
      personas = auxPersonas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        //height: 220,
        width: double.maxFinite,
        child: ListView.builder(
          itemCount: personas.length,
          itemBuilder: (context, i) => Dismissible(
            key: Key(i.toString()),
            child: Card(
                child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                  title: Text('Nombre: ' + personas[i].nombre),
                  subtitle: Text('Correo electrónico: ' + personas[i].correo),
                  leading: Icon(Icons.account_circle),
                ),
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                  title: Text('Habitantes: ' + personas[i].totalHabitantes),
                  subtitle: Text('Personas vacunadas: ' +
                      personas[i].numPersonasVacunadas),
                  leading: Icon(Icons.accessibility),
                ),
                ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                    title: Text('Dirección: ' + personas[i].direccion),
                    subtitle:
                        Text('Código postal: ' + personas[i].codigoPostal),
                    leading: Icon(Icons.fmd_good_sharp)),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
