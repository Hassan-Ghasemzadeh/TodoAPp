import 'package:flutter/material.dart';

import '../../domain/entities/person_entities.dart';

class AddEditPage extends StatelessWidget {
  const AddEditPage({
    Key? key,
    this.personEntity,
    required this.onAddEntity,
  }) : super(key: key);
  final PersonEntity? personEntity;
  final void Function(PersonEntity) onAddEntity;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: AddEditView(
        entity: personEntity ?? PersonEntity(age: 0, last: '', name: ''),
        onAddEntity: onAddEntity,
      ),
    );
  }
}

class AddEditView extends StatefulWidget {
  final PersonEntity entity;

  final void Function(PersonEntity) onAddEntity;

  const AddEditView(
      {super.key, required this.entity, required this.onAddEntity});

  @override
  State<StatefulWidget> createState() => _AddEditViewState();
}

class _AddEditViewState extends State<AddEditView> {
  late Map<String, InputFieldPrams> controllers;
  @override
  void initState() {
    super.initState();
    controllers = {
      'name': InputFieldPrams(
        TextEditingController(text: widget.entity.name)
          ..addListener(() {
            widget.entity.name = controllers['name']!.controller.text;
          }),
        TextInputType.name,
      ),
      'last name': InputFieldPrams(
        TextEditingController(text: widget.entity.last)
          ..addListener(() {
            widget.entity.last = controllers['last name']!.controller.text;
          }),
        TextInputType.name,
      ),
      'age': InputFieldPrams(
        TextEditingController(text: widget.entity.age.toString())
          ..addListener(() {
            widget.entity.age =
                int.tryParse(controllers['age']!.controller.text) ?? 0;
          }),
        TextInputType.number,
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
        child: Column(
          children: [
            //name text field
            ...controllers.entries.map(
              (e) {
                return SizedBox(
                  width: 200.0,
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
