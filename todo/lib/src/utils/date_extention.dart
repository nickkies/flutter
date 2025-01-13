extension DateTimeExtention on DateTime {
  String get getDateString => toString().split(' ')[0];

  String get relativeDays {
    final diffDays = difference(DateTime.now().onlyDate).inDays;
    final absDays = diffDays.abs();

    final checkCondition = (diffDays, diffDays.isNegative);
    return switch (checkCondition) {
      (0, _) => '오늘까지',
      (1, _) => '내일까지',
      (_, true) => '$absDays일 지남',
      _ => '$absDays일 남음',
    };
  }

  DateTime get onlyDate => DateTime(year, month, day);
}
