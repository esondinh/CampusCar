class Log {
  Map<String, dynamic> vehicle;
  String time;
  int direction;

  Log({
    this.vehicle,
    this.time,
    this.direction,
  });

  Map<String, dynamic> toMap() {
    return {
      'vehicle': vehicle,
      'time': time,
      'direction': direction,
    };
  }

  factory Log.fromMap(Map<dynamic, dynamic> data) {
    return Log(
      vehicle: data["vehicle"],
      time: data["time"],
      direction: data["direction"],
    );
  }
}
