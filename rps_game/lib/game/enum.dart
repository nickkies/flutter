const imgPath = 'assets/images';

enum InputType {
  rock,
  scissors,
  paper;

  String get path => '$imgPath/$name.png';
}
