import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:smart_store/providers/addresses_provider.dart';
import 'package:smart_store/screens/app/address_screen.dart';

import 'package:smart_store/utilities/style_constants.dart';

class AddressesListScreen extends StatefulWidget {
  const AddressesListScreen({Key? key}) : super(key: key);

  @override
  State<AddressesListScreen> createState() => _AddressesListScreenState();
}

class _AddressesListScreenState extends State<AddressesListScreen> {
  int? _oneValue =1;

  @override
  Widget build(BuildContext context) {
    var addresses = Provider.of<AddressesProvider>(context)!.addresses;
    return Scaffold(
      backgroundColor: StyleConstants.mainColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: StyleConstants.thirdColor),
        titleSpacing: 0,
        centerTitle: true,
        title: Text(
          'saved addresses',
          style: GoogleFonts.breeSerif(color: StyleConstants.thirdColor),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: StyleConstants.thirdColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddressScreen(
                        address: null,
                      )),
            );
          },
          child: Icon(Icons.add)),
      body: Consumer<AddressesProvider>(
        builder: (context, AddressesProvider value, child) {
          if (value.addresses.isNotEmpty) {
            return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (direction) {
                      if (direction == DismissDirection.startToEnd) {
                        //Delete
                      } else if (direction == DismissDirection.endToStart) {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => AddressScreen(
                        //             address: value.addresses[index] ,
                        //           )),
                        // );
                      }
                    },
                    confirmDismiss: (DismissDirection direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Delete Confirmation"),
                              content: const Text(
                                  "Are you sure you want to delete this card?"),
                              actions: <Widget>[
                                ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: const Text("Delete")),
                                ElevatedButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text("Cancel"),
                                ),
                              ],
                            );
                          },
                        );
                      } else if (direction == DismissDirection.endToStart) {


                      //   Navigator.push(context, MaterialPageRoute(
                      //     builder: (context) {
                      //       return AddressScreen(address: value.addresses[index]);
                      //     },
                      //   ));
                       }
                    },
                    background: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red.shade900,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.delete, color: StyleConstants.mainColor),
                            Text('Delete',
                                style:
                                    TextStyle(color: StyleConstants.mainColor)),
                          ],
                        ),
                      ),
                    ),
                    secondaryBackground: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: StyleConstants.thirdColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('Edit',
                                style:
                                    TextStyle(color: StyleConstants.mainColor)),
                            Icon(Icons.edit, color: StyleConstants.mainColor),
                          ],
                        ),
                      ),
                    ),
                    key: UniqueKey(),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('images/mapbg.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.grey.shade400),
                      child: RadioListTile<int>(
                        activeColor: StyleConstants.secondColor,
                        value: addresses[index].id,
                        groupValue: _oneValue,
                        onChanged: (value) {
                          setState(() {
                            _oneValue = value;
                          });
                        },
                        title: Card(
                          shadowColor: StyleConstants.thirdColor,
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 8.h),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Text('name',
                                          style: GoogleFonts.breeSerif())),
                                  Expanded(
                                      child: Text('0245568852',
                                          style: GoogleFonts.breeSerif(
                                              fontWeight: FontWeight.w300)))
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Hamdan Street',
                                        style: GoogleFonts.breeSerif(),
                                      ),
                                    ],
                                  ),
                                  Text('Gaza', style: GoogleFonts.breeSerif())
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: Text(
                'NO DATA',
                style: GoogleFonts.cairo(
                  fontSize: 24,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
