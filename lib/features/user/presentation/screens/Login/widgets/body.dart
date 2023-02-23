part of '../login_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _idController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onSuccess() => Navigate.to(context, OtpScreen.id);

  void _onSubmit(VoidCallback onSuccess) async {
    final form = _formKey.currentState;

    if (form!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      if (_idController.text != '') {
        await context.read<UserCubit>().login(_idController.text);
        if (context.read<UserCubit>().state.status == UserStatus.error) {
          _idController.clear();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const Alert(
                heading: 'Login Failed!',
                body: 'Employee ID is incorrect',
              );
            },
          );
        } else {
          onSuccess.call();
        }
        form.save();
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: SizedBox(
            height: size.height * 0.8,
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyText.h1('Login'),
                    const SizedBox(height: 10),
                    MyText.body('Please enter the details below to continue.'),
                    const SizedBox(height: 44),
                    TextFieldContainer(
                      child: MyTextField(
                        controller: _idController,
                        hintText: 'Employee ID',
                        keyboardType: TextInputType.number,
                        onChange: (value) {},
                      ),
                    ),
                    const SizedBox(height: 20),
                    Button(
                      child: context.watch<UserCubit>().state.status ==
                          UserStatus.loading
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : const Text('Login', style: TextStyle(fontSize: 18)),
                      onPressed: () => _onSubmit(_onSuccess),
                    ),
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
