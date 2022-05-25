import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/constants.dart';
import '../../data/models/task.dart';
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
              return ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  final task = state.tasks[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddEditPage(
                            onAddEntity: (entity) => {
                              entity.title = task.title,
                              entity.description = task.description
                            },
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(task.title),
                      subtitle: Text(task.description),
                      contentPadding: const EdgeInsets.all(5.0),
                    ),
                  );
                },
              );
            }
            return const CircularProgressIndicator();
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
