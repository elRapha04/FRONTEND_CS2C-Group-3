import 'package:flutter/material.dart';

class BookRentalScreen extends StatefulWidget {
  const BookRentalScreen({super.key});

  @override
  State<BookRentalScreen> createState() => _BookRentalScreenState();
}

class _BookRentalScreenState extends State<BookRentalScreen> {
  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();

  String? selectedDurationOption = "dateRange"; // default selection

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      controller.text =
      "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
    }
  }

  @override
  Widget build(BuildContext context) {
    bool disableDateFields = selectedDurationOption == "noDuration";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.cyan,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                "Rent duration",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: disableDateFields
                          ? null
                          : () => _selectDate(context, startController),
                      child: AbsorbPointer(
                        absorbing: true,
                        child: TextField(
                          controller: startController,
                          enabled: !disableDateFields,
                          decoration: InputDecoration(
                            hintText: "Start",
                            hintStyle: TextStyle(color: Colors.cyan),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Color(0xFFA0CBF0)),
                            ),
                            isDense: true,
                            fillColor:
                            disableDateFields ? Colors.grey[300] : null,
                            filled: disableDateFields,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: disableDateFields
                          ? null
                          : () => _selectDate(context, endController),
                      child: AbsorbPointer(
                        absorbing: true,
                        child: TextField(
                          controller: endController,
                          enabled: !disableDateFields,
                          decoration: InputDecoration(
                            hintText: "End",
                            hintStyle: TextStyle(color: Colors.cyan),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Color(0xFFA0CBF0),
                              ),
                            ),
                            isDense: true,
                            fillColor:
                            disableDateFields ? Colors.grey[300] : null,
                            filled: disableDateFields,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: "dateRange",
                        groupValue: selectedDurationOption,
                        onChanged: (value) {
                          setState(() {
                            selectedDurationOption = value;
                          });
                        },
                        activeColor: Colors.lightBlue,
                      ),
                      const Text(
                        "Set Date Range",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: "noDuration",
                        groupValue: selectedDurationOption,
                        onChanged: (value) {
                          setState(() {
                            selectedDurationOption = value;
                            startController.clear();
                            endController.clear();
                          });
                        },
                        activeColor: Colors.lightBlue,
                      ),
                      const Text("No Duration",
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                "Bed Spacers",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xFFA0CBF0)),
                  ),
                  isDense: true,
                ),
                hint: Center(
                  child: Text(
                    "Enter Amount",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 15,
                    ),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: "1", child: Text("1")),
                  DropdownMenuItem(value: "2", child: Text("2")),
                  DropdownMenuItem(value: "3", child: Text("3")),
                ],
                onChanged: (value) {},
              ),
              const SizedBox(height: 12),
              const Text(
                "Payment Method",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xFFA0CBF0),
                    ),
                  ),
                  isDense: true,
                ),
                hint: Center(
                  child: Text(
                    "Select Payment Method",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.cyan, fontSize: 15),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: "GCash", child: Text("GCash")),
                  DropdownMenuItem(value: "PayMaya", child: Text("PayMaya")),
                  DropdownMenuItem(value: "Cash", child: Text("Cash")),
                ],
                onChanged: (value) {},
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {},
                  child: const Text("Book rental",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
