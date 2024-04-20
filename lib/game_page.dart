import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var score = 0;
  static const maxScore = 10;
  var isPlayerOneTurn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (isPlayerOneTurn) ...{
            const SetText(
              message: 'P L A Y E R 1',
              size: 20,
              color: Colors.blueAccent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                addScore(1),
                addScore(2),
                addScore(3),
              ],
            ),
          },
          SetText(
            message: '$score',
            size: 180,
            color: Colors.black,
          ),
          if (!isPlayerOneTurn) ...{
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                addScore(1),
                addScore(2),
                addScore(3),
              ],
            ),
            const SetText(
              message: 'P L A Y E R 2',
              size: 20,
              color: Colors.redAccent,
            ),
          }
        ],
      ),
    );
  }

  ElevatedButton addScore(int addition) {
    var expectedScore = score + addition;
    return ElevatedButton(
      onPressed: expectedScore <= maxScore
          ? () {
              setState(
                () {
                  score = expectedScore;
                  isPlayerOneTurn = !isPlayerOneTurn;
                },
              );
            }
          : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: Text(addition.toString()),
    );
  }
}

class SetText extends StatelessWidget {
  final String message;
  final double size;
  final Color color;

  const SetText({
    super.key,
    required this.message,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w900,
        color: color,
      ),
    );
  }
}
