import 'package:dicethrow_app/dice_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: diceeapp()));
}

class diceeapp extends ConsumerWidget {
  const diceeapp({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
      final diceState = ref.watch(diceProvider);
    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          print("screen is pressed");
          ref.read(diceProvider.notifier).generateRandomDiceNumber(); 
        },
        child: Scaffold(
          backgroundColor: Colors.red,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Diceeee",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/images/dice${diceState.diceNumber1}.png",
                    height: 110,
                  ),
                  Image.asset(
                    "assets/images/dice${diceState.diceNumber2}.png",
                    height: 110,
                  ),
                ],
              ),
              Text(
                "let's rollll !",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
