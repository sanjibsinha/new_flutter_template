import 'package:flutter/material.dart';
import '../models/dummy_students.dart';

class StudentHome extends StatelessWidget {
  const StudentHome({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Students'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: dummyStudents.map((e) {
          return StudentLists(
            id: e.id,
            name: e.name,
            studentClass: e.studentClass,
          );
        }).toList(),
      ),
    );
  }
}

class StudentLists extends StatelessWidget {
  final String id;
  final String name;
  final String studentClass;

  const StudentLists({
    Key? key,
    required this.id,
    required this.name,
    required this.studentClass,
  }) : super(key: key);

  void selectStudent(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return StudentDetailPage(id: id, name: name, studentClass: studentClass);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectStudent(context),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(
          10.0,
        ),
        margin: const EdgeInsets.all(
          10.0,
        ),
        color: Colors.amberAccent,
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class StudentDetailPage extends StatelessWidget {
  final String id;
  final String name;
  final String studentClass;

  const StudentDetailPage({
    Key? key,
    required this.id,
    required this.name,
    required this.studentClass,
  }) : super(key: key);

  static const routeName = '/student_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              height: 100,
              width: 100,
              margin: const EdgeInsets.all(
                10.0,
              ),
              alignment: Alignment.center,
              color: Colors.amberAccent,
              child: Text(
                'Student\'s name: $name',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              height: 100,
              width: 100,
              margin: const EdgeInsets.all(
                10.0,
              ),
              alignment: Alignment.center,
              color: Colors.redAccent,
              child: Text(
                '$name studies in class $studentClass',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
