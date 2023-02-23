part of '../hrdesk_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MyText.h2('HR-DESK'),
      const SizedBox(height: 30),
      const Padding(
        padding: EdgeInsets.only(left: 8),
        child: RequestAttendanceGrid(),
      )
    ]);
  }
}
