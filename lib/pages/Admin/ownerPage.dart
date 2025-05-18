import 'package:flutter/material.dart';
import 'package:frontend_appdev/themes/Colors.dart';
import 'package:frontend_appdev/themes/Fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/api_service.dart';

void main() {
  runApp(MaterialApp(
    home: OwnerManager(),
    debugShowCheckedModeBanner: false,
  ));
}

class Owner {
  TextEditingController controller;
  bool isEditing;

  Owner({required this.controller, this.isEditing = false});
}

class OwnerManager extends StatefulWidget {
  @override
  _OwnerManagerState createState() => _OwnerManagerState();
}

class _OwnerManagerState extends State<OwnerManager> {
  List<Owner> owners = [];

  @override
  void initState() {
    super.initState();
    loadOwners();
  }

  Future<void> loadOwners() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> names = prefs.getStringList('owners') ?? [];

    setState(() {
      if (names.isEmpty) {
        // Load 8 default if none
        owners = List.generate(8, (_) => Owner(controller: TextEditingController(text: "Owner name")));
      } else {
        owners = names
            .map((name) => Owner(controller: TextEditingController(text: name)))
            .toList();
      }
    });
  }

  Future<void> saveOwners() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> names = owners.map((o) => o.controller.text).toList();
    await prefs.setStringList('owners', names);
  }

  void addOwner() {
    setState(() {
      owners.add(Owner(controller: TextEditingController(text: "Owner name")));
    });
    saveOwners();
  }

  void deleteOwner(int index) {
    setState(() {
      owners.removeAt(index);
    });
    saveOwners();
  }

  void toggleEdit(int index) {
    setState(() {
      owners[index].isEditing = !owners[index].isEditing;
    });
  }

  void onTextChanged() {
    saveOwners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Container(
          width: 280,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Admin profile name',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 13,
                    fontFamily: AppFonts.primaryFont,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: owners.length,
                  itemBuilder: (context, index) {
                    final owner = owners[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: owner.controller,
                              enabled: owner.isEditing,
                              style: TextStyle(color: Colors.white, fontFamily: AppFonts.primaryFont,),
                              onChanged: (_) => onTextChanged(),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: owner.isEditing ? AppColors.primary : Colors.white,
                            ),
                            onPressed: () => toggleEdit(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.white),
                            onPressed: () => deleteOwner(index),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: addOwner,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("+", style: TextStyle(fontSize: 20, fontFamily: AppFonts.primaryFont,)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
