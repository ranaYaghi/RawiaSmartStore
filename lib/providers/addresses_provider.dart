
import 'package:flutter/material.dart';
import 'package:smart_store/models/address.dart';

class AddressesProvider extends ChangeNotifier {



  List<Address> addresses = <Address>[
    Address(name: 'Name', info: 'Info', contact: 1, city: 'USA' ,id: 1),
    Address(name: 'Name', info: 'Info', contact: 1, city: 'USA' ,id: 2),
    Address(name: 'Name', info: 'Info', contact: 1, city: 'USA' ,id: 3),
    Address(name: 'Name', info: 'Info', contact: 1, city: 'USA' ,id: 4),
    Address(name: 'Name', info: 'Info', contact: 1, city: 'USA' ,id: 5),
    Address(name: 'Name', info: 'Info', contact: 1, city: 'USA' ,id: 6),
    Address(name: 'Name', info: 'Info', contact: 1, city: 'USA' ,id: 7),
    Address(name: 'Name', info: 'Info', contact: 1, city: 'USA' ,id: 8),

  ];


}