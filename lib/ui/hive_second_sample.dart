import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_hive/data/models/phone_model.dart';

class HiveSecondSample extends StatefulWidget {
  const HiveSecondSample({super.key});

  @override
  State<HiveSecondSample> createState() => _HiveSecondSampleState();
}

class _HiveSecondSampleState extends State<HiveSecondSample> {
  TextEditingController name = TextEditingController();

  TextEditingController brand = TextEditingController();

  TextEditingController price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var phoneBox = Hive.box('phone');
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.black,
        title: Text(
          "H I V E",
          style: TextStyle(
              fontWeight: FontWeight.w800, color: Colors.deepPurple.shade200),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.deepPurple[200],
        child:Column(
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24,),
            TextField(
              controller: brand,
              decoration: const InputDecoration(
                hintText: "Brand",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24,),
            TextField(
              controller: price,
              decoration: const InputDecoration(
                hintText: "Price",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24,),

            ListView.builder(
                shrinkWrap: true,
                itemCount: phoneBox.values.length,
                itemBuilder: (context, index){
                  List<PhoneModel> phone = phoneBox.values.toList().cast();
                  return ListTile(
                    title: Text(phone[index].name),
                    subtitle: Text(phone[index].price.toString()),
                  );
                })

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        onPressed: (){
          setState(() {
          });
          phoneBox.add(PhoneModel(name: name.text, brand: brand.text, price: int.parse(price.text.trim())));
          name.clear();
          brand.clear();
          price.clear();
      },
      ),
    );
  }
}
