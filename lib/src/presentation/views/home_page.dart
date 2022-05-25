import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/constants.dart';
import '../../data/models/person.dart';
import '../bloc/homebloc_dart_bloc.dart';
import 'add_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kMaterialAppTitle),
      ),
      body: Container(child: BlocBuilder<HomeBloc, HomeblocState>(
        builder: (context, state) {
          List<Person>? persons;
          if (state is AllPersonsState) {
            persons = state.persons;
          } else {
            return Container(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: persons.length,
            itemBuilder: (context, index) {
              final person = persons![index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddEditPage(
                        onAddEntity: (entity) =>
                            {entity.age = person.age, entity.name = person.name, entity.last = person.last},
                      ),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(person.name),
                  subtitle: Text(person.last),
                  isThreeLine: true,
                  leading: Text('${person.age}'),
                  contentPadding: const EdgeInsets.all(5.0),
                ),
              );
            },
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddEditPage(onAddEntity: (entity) {}),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
