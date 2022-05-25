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
    return BlocBuilder<HomeBloc, HomeblocState>(
      buildWhen: (previous, current) {
        if (previous != current) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is AllPersonsState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(kMaterialAppTitle),
            ),
            body: Container(
              margin: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  final task = state.tasks[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddEditPage(
                            onAddEntity: (entity) => {
                              setState(() {
                                entity.title = task.title;
                                entity.description = task.description;
                              })
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
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                print('${state.tasks}');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddEditPage(onAddEntity: (entity) {}),
                  ),
                );
              },
              child: const Icon(Icons.add, color: Colors.white),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
