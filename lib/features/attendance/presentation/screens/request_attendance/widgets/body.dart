part of '../request_attendance_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime date = DateTime.now();
  String type = 'Check in';
  TimeOfDay time = TimeOfDay.now();
  String comment = '';
  bool isLoading = false;

  void _onSuccess() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: SizedBox(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 216, 243, 209)
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
          ));

  void _onSubmit(VoidCallback onSuccess) async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      //form.save();
      setState(() => isLoading = true);
      AttendanceDataParams params = AttendanceDataParams(
        date: '${date.year}-${date.month}-${date.day}',
        type: type,
        comment: comment,
        time: '${time.hour}:${time.minute}',
        token: context.read<UserCubit>().state.user.token,
      );
      String res =
          await context.read<AttendanceDataCubit>().requestAttendance(params);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      _onSuccess();
      setState(() => isLoading = false);
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // requestAttendanceController.getAttendanceRequest(context.read<UserCubit>().state.user.token,);
    //Network.getAttendanceRequest(context.read<UserCubit>().state.user.token,);
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: SizedBox(
            // height: size.height * 0.8,
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    MyText.h2('Request Attendance'),
                    const SizedBox(height: 30),
                    TextFieldContainer(
                      child: DateSelector(
                          name: 'Select Date',
                          onChange: (value) {
                            date = value;
                            print("========>Date=$date");
                          }),
                    ),
                    const SizedBox(height: 20),
                    TextFieldContainer(
                      child: TimeSelector(
                        name: 'Select Time',
                        onChange: (value) {
                          time = value;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFieldContainer(
                      child: MyDropdown(
                        items: const ['Check in', 'Check out'],
                        selected: type,
                        onChange: (value) {
                          setState(() => type = value);
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFieldContainer(
                      child: MyTextArea(
                        required: false,
                        hintText: 'Comment',
                        onChange: (value) {
                          comment = value;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Button(
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Send Request',
                              style: TextStyle(fontSize: 18)),
                      onPressed: () => _onSubmit(_onSuccess),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
