import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_hive/ui/hive_second_sample.dart';

class HiveFirstSample extends StatefulWidget {
  const HiveFirstSample({super.key});

  @override
  State<HiveFirstSample> createState() => _HiveFirstSampleState();
}

class _HiveFirstSampleState extends State<HiveFirstSample> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
   var notesBox = Hive.box('notes');
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text(
          "H I V E",
          style: TextStyle(
              fontWeight: FontWeight.w800, color: Colors.deepPurple.shade200),
        ),
        backgroundColor: Colors.black,
      ),
     body: Container(
        padding: const EdgeInsets.all(24),
        color: Colors.deepPurple.shade200,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextButton(
                onPressed: () {
                  notesBox.add(controller.text);
                  controller.clear();
                  setState(() {

                  });
                },
                style: TextButton.styleFrom(
                    elevation: 10,
                    surfaceTintColor: Colors.blueAccent,
                    foregroundColor: Colors.deepPurple[200],
                    backgroundColor: Colors.black,
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                )),
            const SizedBox(
              height: 100,
            ),
            ListView.builder(
              shrinkWrap: true,
                itemCount: notesBox.values.length,
                itemBuilder: (context, index){
              return ListTile(
                title: Text(notesBox.values.toList()[index]),
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
          backgroundColor: Colors.black87,
          onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => HiveSecondSample()));
      }),
    );
  }
}
