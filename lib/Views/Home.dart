import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../Model/Task.dart';
import '../Repository/Firebase_Service.dart';



class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: StreamBuilder(
            stream: database.getTasks(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  var task = snapshot.data?[index];
                  return itemAccount(context, ref, task);
                },
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add onPressed handler for adding new item
              _showMyDialog(context, ref);
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

Widget itemAccount(BuildContext context, WidgetRef ref, Task? task) {
  final database = ref.watch(databaseProvider);
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey, // Màu sắc của viền
        width: 1.0, // Độ dày của viền
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
    child: Row(
      children: [
        Expanded(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  task?.name ?? '',
                  style: const TextStyle(fontSize: 18),
                ))),
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            _showMyDialog(context, ref, task);
          },
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            database.delete(task!);
          },
        ),
      ],
    ),
  );
}

Future<void> _showMyDialog(BuildContext context, WidgetRef ref, [Task? task]) async {
  final form = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
  });
  final database = ref.watch(databaseProvider);
  if (task != null) {
    form.control('name').value = task.name;
  }
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(task == null ? 'Add task' : 'Update task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ReactiveFormBuilder(
              form: () => form,
              builder: (context, _, __) {
                return Column(
                  children: [
                    ReactiveTextField<String>(
                      formControlName: 'name',
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 20.0),
                      ),
                      style: const TextStyle(fontSize: 18.0),
                      validationMessages: {
                        'required': (error) => 'The name must not be empty',
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10.0), // Adjust the value as needed
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (form.valid) {
                task == null
                    ? database.addTask(Task(name: form.control('name').value))
                    : database.updateTask(Task(uid: task.uid, name: form.control('name').value));
                Navigator.of(context).pop();
              }
            },
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}
