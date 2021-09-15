import 'package:flutter/material.dart';
import '../models/dummy_students.dart';

class StudentHome extends StatelessWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Books'),
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
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.amberAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 400,
              width: 400,
              margin: const EdgeInsets.all(
                10.0,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.brown.shade100,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  width: 10,
                  color: Colors.black,
                ),
              ),
              child: Text(
                '$name of Student',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              height: 400,
              width: 400,
              margin: const EdgeInsets.all(
                10.0,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade300,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  width: 10,
                  color: Colors.black,
                ),
              ),
              child: Text(
                '$name studies at $studentClass',
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
