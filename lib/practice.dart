import 'package:flutter/widgets.dart';

abstract class Animal {
  void eat();
  void makeSound();
  void hunt();
}

class Cat implements Animal {
  @override
  void makeSound() {}
  @override
  void hunt() {}
  @override
  void eat() {}
}
