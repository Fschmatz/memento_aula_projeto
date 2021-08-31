import 'package:flutter/material.dart';
import 'package:memento_aula_projeto/classes/dialogChangelog.dart';
import 'package:memento_aula_projeto/memento_classes/randomisePropertiesCommand.dart';
import 'package:memento_aula_projeto/widgets/shapeContainer.dart';
import 'memento_classes/commandHistory.dart';
import 'memento_classes/iCommand.dart';
import 'memento_classes/originator.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeMementoExample extends StatefulWidget {
  const HomeMementoExample();

  @override
  _HomeMementoExampleState createState() => _HomeMementoExampleState();
}

class _HomeMementoExampleState extends State<HomeMementoExample> {
  final CommandHistory _commandHistory = CommandHistory();
  final Originator _originator = Originator();
  int _contador = 0;

  _launchGithub() {
    const url = 'https://github.com/Fschmatz/memento_aula_projeto';
    launch(url);
  }

  void _randomiseProperties() {
    final command = RandomisePropertiesCommand(_originator);
    _executeCommand(command);
  }

  void _executeCommand(ICommand command) {
    setState(() {
      command.execute();
      _contador++;
      _commandHistory.add(command);
    });
  }

  void _undo() {
    setState(() {
      _contador--;
      _commandHistory.undo();
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color(0xFF303030),
            contentPadding: EdgeInsets.fromLTRB(6, 10, 6, 0),
            title: Text('Info'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.notes_outlined),
                  title: Text(DialogChangelog.changelog),
                ),
                Divider(
                  height: 0,
                ),
              ],
            ),
            actions: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                onTap: () {
                  Navigator.of(context).pop();
                  _launchGithub();
                },
                leading: Icon(Icons.open_in_new_outlined),
                title: Text("GitHub",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue)),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memento Exemplo'),
        backgroundColor: Colors.grey[800],
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                _showDialog();
              },
              icon: Icon(Icons.info_outline))
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              ListTile(
                title: Text(
                  'Contador : ' + _contador.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ShapeContainer(
                shape: _originator.state,
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Container(
                  height: 80,
                  child: Card(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.library_add_outlined,
                              size: 28,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Randomizar",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        onTap: _randomiseProperties,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Container(
                  height: 70,
                  child: Card(
                    color: _commandHistory.isEmpty
                        ? Colors.grey
                        : Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.history_outlined,
                              size: 28,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Voltar",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        onTap: _commandHistory.isEmpty ? null : _undo,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
