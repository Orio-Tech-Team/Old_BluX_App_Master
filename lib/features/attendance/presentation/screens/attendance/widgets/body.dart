part of '../attendance_screen.dart';

bool isRoute = true;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends RouteAwareState<Body> {
  bool isInRange = false;
  bool isLoading = false;
  RequestAttendanceController requestAttendanceController = Get.put(RequestAttendanceController());

  void fetchAttendance(String token) async {
    isLoading = true;
    //setState(() => isLoading = true);
    await context.read<TodayAttendanceCubit>().get(token);
    //requestAttendanceController.data!.outtime = '';

    //setState(() => isLoading = false);
    isLoading = false;
  }
  void start() async {
    List<Station> stations = context.read<StationCubit>().state.stations;

    while (isRoute) {
      Position? position;
      bool isFound = false;
      await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      ).then((Position pos) {
        position = pos;
      }).catchError((e) {});
      double distanceInMeters = 0.0;
      for (var station in stations) {
        distanceInMeters = Geolocator.distanceBetween(
          position?.latitude ?? 0,
          position?.longitude ?? 0,
          double.parse(station.latitude),
          double.parse(station.longtitude),
        );
        if (distanceInMeters <= station.radius) {
          isFound = true;
        }
      }
      if (isInRange != isFound) {
        setState(() {
          isInRange = isFound;
        });
      }
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  void didPush() {
    isRoute = true;
    start();
  }

  @override
  void didPopNext() {
    isRoute = true;
    start();
  }

  @override
  void didPushNext() {
    isRoute = false;
  }

  @override
  void dispose() {
    isRoute = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child:Column(
        children: [
          const Spacer(),
          const DateTimeShow(),
          const SizedBox(height: 20),
          //AttendanceButton(isInRange: isInRange,),
        GestureDetector(
          onTap: (() {
            if (isInRange) {
              String token = context.read<UserCubit>().state.user.token;
              fetchAttendance(token);
              requestAttendanceController.getAttendanceRequest(context.read<UserCubit>().state.user.token,);
            }
          }),
          child: Container(
            width: 172,
            height: 172,
            decoration: BoxDecoration(
              color: isInRange ? null : kGray500,
              gradient: isInRange
                  ? (context
                  .watch<TodayAttendanceCubit>()
                  .state
                  .attendanceData
                  .checkIn ==
                  null
                  ? kGradient
                  : kGradient2)
                  : null,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : context
                    .watch<TodayAttendanceCubit>()
                    .state
                    .attendanceData
                    .checkIn ==
                    null
                    ? SvgPicture.asset(
                  'assets/icons/attendance/attendance_click.svg',
                  color: Colors.white,
                  width: 70,
                  height: 70,
                )
                    : SvgPicture.asset(
                  'assets/icons/attendance/checkout.svg',
                  color: Colors.white,
                  width: 70,
                  height: 70,
                ),
                const SizedBox(height: 10),
                Text(
                  context
                      .watch<TodayAttendanceCubit>()
                      .state
                      .attendanceData
                      .checkIn ==
                      null
                      ? 'Check In'
                      : 'Check Out',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
          const SizedBox(height: 20),
          InRangeText(isInRange: isInRange),
          const Expanded(child: SizedBox(height: 20)),
          FutureBuilder(
              future: requestAttendanceController.getAttendanceRequest(context.read<UserCubit>().state.user.token,),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return  const Center(child: CircularProgressIndicator());
                }
                return SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CheckItem(
                        icon: 'assets/icons/attendance/check_in.svg',
                        text: 'Check In',
                        time: requestAttendanceController.data != null
                            ? requestAttendanceController.data!.intime.substring(0, 5)
                            :context
                            .watch<TodayAttendanceCubit>()
                            .state
                            .attendanceData
                            .checkIn !=
                            null
                            ? context
                            .watch<TodayAttendanceCubit>()
                            .state
                            .attendanceData
                            .checkIn!
                            .substring(0, 5)
                            : "--:--",
                        /*time: context
                        .watch<TodayAttendanceCubit>()
                        .state
                        .attendanceData
                        .checkIn !=
                    null
                ? context
                    .watch<TodayAttendanceCubit>()
                    .state
                    .attendanceData
                    .checkIn!
                    .substring(0, 5)
                : '--:--',*/
                      ),
                      CheckItem(
                        icon: 'assets/icons/attendance/check_out.svg',
                        text: 'Check Out',
                        time:
                        requestAttendanceController.data != null?
                        requestAttendanceController.data!.outtime != null?
                            requestAttendanceController.data!.outtime.substring(0, 5)
                            :"--:--": context
                            .watch<TodayAttendanceCubit>()
                            .state
                            .attendanceData
                            .checkOut !=
                            null
                            ? context
                            .watch<TodayAttendanceCubit>()
                            .state
                            .attendanceData
                            .checkOut!
                            .substring(0, 5)
                            :"--:--",/*context
                            .watch<TodayAttendanceCubit>()
                            .state
                            .attendanceData
                            .checkOut !=
                            null
                            ? context
                            .watch<TodayAttendanceCubit>()
                            .state
                            .attendanceData
                            .checkOut!
                            .substring(0, 5)
                            : '--:--',*/
                      ),
                      CheckItem(
                        icon: 'assets/icons/attendance/hours.svg',
                        text: 'Working Hours',
                        time: requestAttendanceController.data != null?
                        requestAttendanceController.data!.workingHours != null?
                        requestAttendanceController.data!.workingHours.substring(0, 5)
                            :"--:--":context
                            .watch<TodayAttendanceCubit>()
                            .state
                            .attendanceData
                            .workingHours !=
                            null
                            ? context
                            .watch<TodayAttendanceCubit>()
                            .state
                            .attendanceData
                            .workingHours!
                            .substring(0, 5)
                            : '--:--',
                      ),
                    ],
                  ),
                );
              }
          ),
          /*GetX<RequestAttendanceController>(
              init: RequestAttendanceController(),
              //initState: (_) => RequestAttendanceController().getAttendanceRequest,
              builder: (controller){
                if(controller.isLoading.value == false){
                  controller.getAttendanceRequest(context.read<UserCubit>().state.user.token,);
                  return const CircularProgressIndicator();

                }else{
                  return SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CheckItem(
                          icon: 'assets/icons/attendance/check_in.svg',
                          text: 'Check In',
                          time: controller.data!.intime != null?controller.data!.intime:"--;--",
                          *//*time: context
                        .watch<TodayAttendanceCubit>()
                        .state
                        .attendanceData
                        .checkIn !=
                    null
                ? context
                    .watch<TodayAttendanceCubit>()
                    .state
                    .attendanceData
                    .checkIn!
                    .substring(0, 5)
                : '--:--',*//*
                        ),
                        CheckItem(
                          icon: 'assets/icons/attendance/check_out.svg',
                          text: 'Check Out',
                          time: context
                              .watch<TodayAttendanceCubit>()
                              .state
                              .attendanceData
                              .checkOut !=
                              null
                              ? context
                              .watch<TodayAttendanceCubit>()
                              .state
                              .attendanceData
                              .checkOut!
                              .substring(0, 5)
                              : '--:--',
                        ),
                        CheckItem(
                          icon: 'assets/icons/attendance/hours.svg',
                          text: 'Working Hours',
                          time: context
                              .watch<TodayAttendanceCubit>()
                              .state
                              .attendanceData
                              .workingHours !=
                              null
                              ? context
                              .watch<TodayAttendanceCubit>()
                              .state
                              .attendanceData
                              .workingHours!
                              .substring(0, 5)
                              : '--:--',
                        ),
                      ],
                    ),
                  );
                }
              }
              ),*/
          /*requestAttendanceController.isLoading.value == true ?
          const CircularProgressIndicator():
          Obx(() => SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CheckItem(
                  icon: 'assets/icons/attendance/check_in.svg',
                  text: 'Check In',
                  time: requestAttendanceController.data!.intime != null?requestAttendanceController.data!.intime:"--;--",
                  *//*time: context
                        .watch<TodayAttendanceCubit>()
                        .state
                        .attendanceData
                        .checkIn !=
                    null
                ? context
                    .watch<TodayAttendanceCubit>()
                    .state
                    .attendanceData
                    .checkIn!
                    .substring(0, 5)
                : '--:--',*//*
                ),
                CheckItem(
                  icon: 'assets/icons/attendance/check_out.svg',
                  text: 'Check Out',
                  time: context
                      .watch<TodayAttendanceCubit>()
                      .state
                      .attendanceData
                      .checkOut !=
                      null
                      ? context
                      .watch<TodayAttendanceCubit>()
                      .state
                      .attendanceData
                      .checkOut!
                      .substring(0, 5)
                      : '--:--',
                ),
                CheckItem(
                  icon: 'assets/icons/attendance/hours.svg',
                  text: 'Working Hours',
                  time: context
                      .watch<TodayAttendanceCubit>()
                      .state
                      .attendanceData
                      .workingHours !=
                      null
                      ? context
                      .watch<TodayAttendanceCubit>()
                      .state
                      .attendanceData
                      .workingHours!
                      .substring(0, 5)
                      : '--:--',
                ),
              ],
            ),
          ),),*/
          //AttendanceInfo(requestAttendanceController.data!),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
