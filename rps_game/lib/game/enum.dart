const imgPath = 'assets/images';

enum InputType {
  rock,
  scissors,
  paper;

  String get path => '$imgPath/$name.png';
}

enum Result {
  playerWin('승리!'),
  draw('무승부'),
  cpuWin('패배...');

  const Result(this.displayString);

  final String displayString;
}
