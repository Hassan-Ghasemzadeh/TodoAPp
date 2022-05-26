import 'package:flutter/material.dart';

import '../../domain/entities/task_entities.dart';

class AddEditPage extends StatelessWidget {
  //constructure
  const AddEditPage({
    Key? key,
    this.personEntity,
    required this.onAddEntity,
  }) : super(key: key);

  //fields
  final TaskEntity? personEntity;
  final void Function(TaskEntity) onAddEntity;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AddEditView(
        entity: personEntity ?? TaskEntity(description: '', title: ''),
        onAddEntity: onAddEntity,
      ),
    );
  }
}

class AddEditView extends StatefulWidget {
  final TaskEntity entity;

  final void Function(TaskEntity) onAddEntity;

  const AddEditView({
    super.key,
    required this.entity,
    required this.onAddEntity,
  });

  @override
  State<StatefulWidget> createState() => _AddEditViewState();
}

class _AddEditViewState extends State<AddEditView> {
  late Map<String, InputFieldPrams> controllers;
  @override
  void initState() {
    super.initState();
    controllers = {
      'title': InputFieldPrams(
        TextEditingController(text: widget.entity.title)
          ..addListener(() {
            widget.entity.title = controllers['title']!.controller.text;
          }),
        TextInputType.name,
      ),
      'description': InputFieldPrams(
        TextEditingController(text: widget.entity.description)
          ..addListener(() {
            widget.entity.description =
                controllers['description']!.controller.text;
          }),
        TextInputType.name,
      ),
    };
  }

  @override
  void dispose() {
    for (final conroller in controllers.values) {
      conroller.controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        height: 200,
        child: Column(
          children: [
            //name text field
            ...controllers.entries.map(
              (e) {
                return SizedBox(
                  width: 300.0,
                  child: TextField(
                    controller: e.value.controller,
                    keyboardType: e.value.type,
                    decoration: InputDecoration(
                      hintText: 'Input your ${e.key} here',
                      labelText: e.key,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                    ),
                  ),
                );
              },
            ),
            Container(height: 10),
            //a row of two button
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      //navigate back to home
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ),
                Container(width: 10),
                //save btn
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // save task
                      widget.onAddEntity(widget.entity);

                      //navigate back
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Save',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                )
                //end of save
              ],
            )
          ],
        ),
      ),
    );
  }
}

class InputFieldPrams {
  final TextEditingController controller;
  final TextInputType type;

  InputFieldPrams(this.controller, this.type);
}
