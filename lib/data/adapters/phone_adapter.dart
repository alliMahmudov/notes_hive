import 'package:hive/hive.dart';
import 'package:notes_hive/data/models/phone_model.dart';

class PhoneAdapter extends TypeAdapter<PhoneModel>{
  @override
   final int typeId = 0;

  @override
  PhoneModel read(BinaryReader reader){
    final name = reader.read() as String;
    final brand = reader.read() as String;
    final price = reader.read() as num;

    return PhoneModel(name: name, brand: brand, price: price);
  }

  @override
  void write(BinaryWriter writer, PhoneModel obj){
    writer.write(obj.name);
    writer.write(obj.brand);
    writer.write(obj.price);
  }

}