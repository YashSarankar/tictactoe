class Player{
  static const x="X";
  static const o="O";
  static const empty="";
}

class Game{
  static final boardlength=9; // 3x3 block board;
  static final blockSize=100.0;
  
  //Creating the empty board;
  List<String>?board;
  
  static List<String>? initGameBoard()=>List.generate(boardlength, (index) => Player.empty);
}