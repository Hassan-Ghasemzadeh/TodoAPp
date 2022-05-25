import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/constants.dart';
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
      body: Container(
        child: BlocBuilder<HomeBloc, HomeblocState>(
          buildWhen: (previous, current) {
            if (previous != current) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            if (state is AllPersonsState) {
              final persons = state.persons;
              return ListView.builder(
                itemCount: persons.length,
                itemBuilder: (context, index) {
                  final person = persons[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddEditPage(
                            onAddEntity: (entity) => {
                              entity.age = person.age,
                              entity.name = person.name,
                              entity.last = person.last
                            },
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
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
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
