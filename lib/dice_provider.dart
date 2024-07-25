import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiceModel {
  final int diceNumber1;
  final int diceNumber2;

  DiceModel({required this.diceNumber1, required this.diceNumber2});

  DiceModel copyWith({int? diceNumber1, int? diceNumber2}) {
    return DiceModel(
      diceNumber1: diceNumber1 ?? this.diceNumber1,
      diceNumber2: diceNumber2 ?? this.diceNumber2,
    );
  }
}

class DiceProvider extends StateNotifier<DiceModel> {
  DiceProvider() : super(DiceModel(diceNumber1: 1, diceNumber2: 2));

  void generateRandomDiceNumber() {
    Random random = Random();
    int dice1 = random.nextInt(6) + 1;
    int dice2 = random.nextInt(6) + 1;
    state = state.copyWith(diceNumber1: dice1, diceNumber2: dice2);
  }
}

final diceProvider = StateNotifierProvider<DiceProvider, DiceModel>(
  (ref) => DiceProvider(),
);
