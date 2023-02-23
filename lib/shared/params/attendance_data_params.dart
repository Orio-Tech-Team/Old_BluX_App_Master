class AttendanceDataParams {
  final String token, date, time, type, comment;

  const AttendanceDataParams({
    this.token = '',
    this.date = '',
    this.time = '',
    this.type = '',
    this.comment = '',
  });
}
