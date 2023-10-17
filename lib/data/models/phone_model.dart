import 'package:hive/hive.dart';

class PhoneModel extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(0)
  String brand;
  @HiveField(2)
  num price;

  PhoneModel({required this.name, required this.brand, required this.price});
}