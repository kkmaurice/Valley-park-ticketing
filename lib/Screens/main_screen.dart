import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Controller>();
    final provider2 = context.read<Controller>();
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),

                  /// DOWNER PART
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.49,
                        padding: const EdgeInsets.only(
                            top: 12, left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(35),
                            bottomRight: Radius.circular(15),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.red.withOpacity(0.5),
                              const Color.fromARGB(255, 192, 132, 132),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Pick your seat',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 19,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            dropDownMenu(),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 12, left: 10, right: 10, bottom: 10),
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.48,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(35),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.red.withOpacity(0.5),
                              const Color.fromARGB(255, 192, 132, 132),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Seats number',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 19,
                              ),
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Container(
                              height: 45,
                              width: 170,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  provider.selectedValue != null
                                      ? InkWell(
                                          onTap: provider2.decrement,
                                          child: const Chip(
                                              label: Text(
                                            '-',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          )),
                                        )
                                      : const SizedBox(),
                                  Text(
                                      provider.selectedValue != null
                                          ? 
                                          provider.selectedValue.toString()
                                          : '0',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  provider.selectedValue != null
                                      ? InkWell(
                                          onTap: provider2.increment,
                                          child: Chip(
                                              label: Text(
                                            '+',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          )),
                                        )
                                      // IconButton(
                                      //     onPressed: () {
                                      //       context
                                      //           .read<Controller>()
                                      //           .increment();
                                      //     },
                                      //     icon: const Icon(Icons.add))
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: Chip(
                                label: Text(
                                  '${provider.selectedValue ?? 0}: Seats',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 35,
                                  ),
                                ),
                                backgroundColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: const EdgeInsets.only(
                          top: 10, left: 12, right: 12, bottom: 10),
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 62, 61, 61),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Chip(
                            label: Text(
                              'Seats filled: ${provider.paidSeatsCount}',
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                            labelPadding: const EdgeInsets.only(
                                left: 7, right: 7, top: 10, bottom: 10),
                            backgroundColor:
                                const Color.fromARGB(255, 35, 32, 32),
                          ),
                          Chip(
                            label: Text(
                              'Total: Ugx ${provider.totalAmount}',
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                            labelPadding: const EdgeInsets.only(
                                left: 7, right: 7, top: 10, bottom: 10),
                            backgroundColor:
                                const Color.fromARGB(255, 35, 32, 32),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 62, 61, 61),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                       
                        ),
                      ),
                      child: ListView.builder(
                        // itemCount: provider.selectedValue != null
                        //     ? int.parse(provider.selectedValue.toString())
                        //     : 0,
                        itemCount: provider.selectedValue != null
                            ? provider.seats.length
                            : 0,
                        itemBuilder: (context, index) {
                          // var item = Seats(
                          //     seatNumber: provider.data[index], isPaid: false);
                          final seat = provider.seats[index];

                          return Builder(
                            builder: (context) {
                              final isPaid = context.select<Controller, bool>(
                                  (controller) => controller.isPaid(seat));

                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<Controller>()
                                      .addToPaidList(seat);
                                  // print(provider.paidSeats.length);
                                  // print(isPaid);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    top: 10,
                                    left: 12,
                                    right: 12,
                                  ),
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 12, right: 12, bottom: 10),
                                  height:
                                      MediaQuery.of(context).size.height * 0.09,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: isPaid
                                        ? Colors.green
                                        : const Color.fromARGB(255, 35, 32, 32),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Chip(
                                        label: Text(
                                          '${provider.seats[index].seatNumber}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 35,
                                          ),
                                        ),
                                        backgroundColor: Colors.black,
                                      ),
                                      Chip(
                                        label: Text(
                                          isPaid ? 'Paid' : "Unpaid",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                        labelPadding: EdgeInsets.only(
                                            left: 7,
                                            right: 7,
                                            top: 10,
                                            bottom: 10),
                                        backgroundColor:
                                            Color.fromARGB(255, 35, 32, 32),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ]),
          )),
    );
  }

  DropdownButtonHideUnderline dropDownMenu() {
    final provider = context.watch<Controller>();
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: const [
            Icon(
              Icons.arrow_drop_down,
              size: 16,
              color: Colors.yellow,
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                'Pick Seats',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: provider.data
            .map((item) => DropdownMenuItem<String>(
                  value: item.toString(),
                  child: Text(
                    '${item.toString()} Seats',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: provider.selectedValue,
        onChanged: (value) {
          setState(() {
            provider.selectedValue = value as String;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: 160,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.black26,
            ),
            color: Colors.redAccent,
          ),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.yellow,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: 200,
            padding: null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.redAccent,
            ),
            elevation: 8,
            offset: const Offset(-20, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all(6),
              thumbVisibility: MaterialStateProperty.all(true),
            )),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
