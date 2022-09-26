import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:todo_app/moduls/todo.dart';

import '../app_configurations/app_common.dart';

class AddTodoScreen extends StatefulWidget {
  static String routeName = 'add_todo';

  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final Map<String, Priority> _mapPriority = {
    Priority.minor.toString(): Priority.minor,
    Priority.major.toString(): Priority.major,
    Priority.unclassified.toString(): Priority.unclassified,
  };
  final Map<String, Status> _mapStatus = {
    Status.active.toString(): Status.active,
    Status.deleted.toString(): Status.deleted,
    Status.disabled.toString(): Status.disabled,
    Status.inProgress.toString(): Status.inProgress,
    Status.terminated.toString(): Status.terminated,
  };

  String? statusValue;
  String? priorityValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Todo'),
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 10, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText('Todo title'),
              roundedTextField(hint: 'title'),
              const SizedBox(
                height: 20,
              ),
              titleText('Todo description'),
              roundedTextField(hint: 'descriptions', isMultiLine: true),
              const SizedBox(
                height: 20,
              ),
              titleText('Todo priority'),
              dropDownWidget(_mapPriority.keys.toList(), this.priorityValue),
              const SizedBox(
                height: 20,
              ),
              titleText('Todo status'),
              dropDownWidget(_mapStatus.keys.toList(), this.statusValue),
              const SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }

  Widget dropDownWidget(List<String> items, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Neumorphic(
        style: const NeumorphicStyle(
            depth: 1, color: Colors.white70, shadowLightColor: Colors.grey),
        child: Container(
          width: 170,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DropdownButton(
              alignment: AlignmentDirectional.center,
              value: value,
              underline: const SizedBox(),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              items: items.map((item) {
                String temp = item.split(r'.')[1];
                return DropdownMenuItem(
                  value: item,
                  child: Text(temp),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  value = newValue;
                  if (newValue!.split('.')[0] ==
                      _mapStatus.keys.toList()[0].split(r'.')[0]) {
                    statusValue = newValue;
                  } else {
                    priorityValue = newValue;
                  }
                });
              }),
        ),
      ),
    );
  }



}
