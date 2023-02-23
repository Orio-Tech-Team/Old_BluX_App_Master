import 'package:blueex_emp_app_flutter/shared/widgets/text.dart';
import 'package:flutter/material.dart';

class CorrectAlert extends StatelessWidget {
  const CorrectAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
                          content: SizedBox(
                            height: 170,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 216, 243, 209)
                                        .withOpacity(0.3),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    size: 70,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                MyText.h2("Request Send!"),
                              ],
                            ),
                          ),
                        );
  }
}