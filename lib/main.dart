import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/ui/theme/color.dart';
import 'package:tictactoe/utils/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String lastValue = "X";
  bool gameOver = false;
  int turn = 0;
  //declare a new Game components;

  Game game = Game();

  //Let's init the Game;
  @override
  void initState() {
    super.initState();
    game.board = Game.initGameBoard();
    if (kDebugMode) {
      print(game.board);
    }
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "It'S $lastValue turn".toUpperCase(),
            style: const TextStyle(color: Colors.white, fontSize: 58),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            width: boardWidth,
            height: boardWidth,
            child: GridView.count(
              crossAxisCount: Game.boardlength ~/ 3,
              padding: const EdgeInsets.all(16.0),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(Game.boardlength, (index) {
                return InkWell(
                  onTap: gameOver
                      ? null
                      : () {
                          setState(() {
                            if (game.board![index] == "") {
                              game.board![index] = lastValue;
                              if (lastValue == "X") {
                                lastValue = "O";
                              } else {
                                lastValue = "X";
                              }
                            }
                          });
                        },
                  child: Container(
                    width: Game.blockSize,
                    height: Game.blockSize,
                    decoration: BoxDecoration(
                        color: MainColor.secondaryColor,
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Center(
                      child: Text(
                        game.board![index],
                        style: TextStyle(
                            color: game.board![index] == "X"
                                ? Colors.blue
                                : Colors.pink,
                            fontSize: 64.0),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          ElevatedButton.icon(onPressed: (){
            setState(() {
              game.board=Game.initGameBoard();
              lastValue="X";
            });
          }
            , icon: const Icon(Icons.replay),
            label: const Text("Repeat the Game"),
          )
        ],
      ),
    );
  }
}
