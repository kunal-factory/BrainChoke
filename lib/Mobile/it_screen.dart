import 'package:flutter/material.dart';

class ItScreen extends StatefulWidget {
  const ItScreen({super.key});

  @override
  ItScreenState createState() => ItScreenState();
}

class ItScreenState extends State<ItScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: 10,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, i) {
                return i % 2 == 0
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 80, 101, 218),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: const Color.fromARGB(255, 66, 66, 69)
                                    .withOpacity(0.5),
                                offset: const Offset(2, 5),
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Text(
                              'Hey this is my long text appbar title',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 251, 251, 253),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.red, // red as border color
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Text(
                              'Hey this is my long text appbar title',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 11, 11, 11),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      );
              },
            )),
      ),
    );
  }
}
