import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class Department {
  @primaryKey
  @ColumnInfo(name: 'diachitram', nullable: false)
  final String diachitram;
  @ColumnInfo(name: 'matram', nullable: false)
  final String matram;
  @ColumnInfo(name: 'sdttram', nullable: false)
  final String sdttram;
  @ColumnInfo(name: 'mac', nullable: false)
  String mac;


  Department(this.diachitram, this.matram, this.sdttram, this.mac);

  String get departmentDiachiDecode {
    try {
      String s = diachitram;
      List<int> ints = List();
      s = s.replaceAll('[', '');
      s = s.replaceAll(']', '');
      List<String> strings = s.split(',');
      for (int i = 0; i < strings.length; i++) {
        ints.add(int.parse(strings[i]));
      }
      return utf8.decode(ints);
    } catch (e) {
      return diachitram;
    }
  }

  Department.fromJson(Map<String, dynamic> json)
      : diachitram = json['diachitram'],
        matram = json['matram'],
        sdttram = json['sdttram'],
        mac = json['mac'];

  Map<String, dynamic> toJson() => {
        'diachitram': diachitram,
        'matram': matram,
        'sdttram': sdttram,
        'mac': mac,
      };
// Room.fromJson(Map<String, dynamic> json)
//     : email = json['email'],
//       pass = json['pass'],
//       ten = json['ten'],
//       sdt = json['sdt'],
//       nha = json['nha'],
//       mac = json['mac'];
//
// Map<String, dynamic> toJson() => {
//   'email': email,
//   'pass': pass,
//   'ten': ten,
//   'sdt': sdt,
//   'nha': nha,
//   'mac': mac,
// };
}
