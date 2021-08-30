import 'package:flutter/material.dart';
import 'package:memento_aula_projeto/platformButton.dart';
import 'package:memento_aula_projeto/randomisePropertiesCommand.dart';
import 'package:memento_aula_projeto/shapeContainer.dart';

import 'commandHistory.dart';
import 'icommand.dart';

import 'originator.dart';

class MementoExample extends StatefulWidget {
  const MementoExample();

  @override
  _MementoExampleState createState() => _MementoExampleState();
}

class _MementoExampleState extends State<MementoExample> {
  final CommandHistory _commandHistory = CommandHistory();
  final Originator _originator = Originator();

  void _randomiseProperties() {
    final command = RandomisePropertiesCommand(_originator);
    _executeCommand(command);
  }

  void _executeCommand(ICommand command) {
    setState(() {
      command.execute();
      _commandHistory.add(command);
    });
  }

  void _undo() {
    setState(() {
      _commandHistory.undo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memento Exemplo'),
        backgroundColor: Colors.grey.shade800,
        elevation: 0,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
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
                            Icon(Icons.library_add_outlined,size: 28,),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Randomizar",
                              style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),
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
                    color:
                        _commandHistory.isEmpty ? Colors.grey : Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.history_outlined,size: 28,),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Voltar",
                              style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        onTap: _commandHistory.isEmpty ? null : _undo,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
