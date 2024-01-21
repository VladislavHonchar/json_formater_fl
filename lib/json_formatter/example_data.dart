import 'package:json_formater_fl/json_formatter/address.dart';
import 'package:json_formater_fl/json_formatter/human.dart';

final humans = [
  Human(
    name: "Ivan", 
    surname: "Ivanov", 
    age: 17, 
    address: [
      Address(city: "Berlin",street: "Hitler",house: "12a",flat: 12,),
      Address(city: "Paris", street: "Napoleon", house: "13a", flat: 1),
      Address(city: "Kyiv", street: "Bandera", house: "228", flat: 345),
    ], 
  ),
  Human(
    name: "Julia", 
    surname: "Roberts", 
    age: 34, 
    address: [
      Address(city: "Washinghton", street: "Biden", house: "12a", flat: 12),
      Address(city: "New-York", street: "Justin Timberlake", house: "13a", flat: 1),
      Address(city: "Odesa", street: "Greece", house: "28", flat: 345),
    ],
  ),

];
const jsonString = '''
[
  {
    "name": "Ivan",
    "surname": "Ivanov",
    "age": 22,
    "address": [
      {
        "city": "Berlin",
        "street": "Hitler",
        "house": "12a",
        "flat": 12
      },
      {
        "city": "Paris",
        "street": "Napoleon",
        "house": "13a",
        "flat": 1
      },
      {
        "city": "Kyiv",
        "street": "Bandera",
        "house": "228",
        "flat": 345
      }
    ]
  },
  {
    "name": "Julia",
    "surname": "Roberts",
    "age": 34,
    "address": [
      {
        "city": "Washinghton",
        "street": "Biden",
        "house": "12a",
        "flat": 12
      },
      {
        "city": "New-York",
        "street": "Justin Timberlake",
        "house": "13a",
        "flat": 1
      },
      {
        "city": "Odesa",
        "street": "Greece",
        "house": "28",
        "flat": 345
      }
    ]
  } 
]''';