import 'dart:math';

class GameCheck{
  int answer = 0;
  int count = 0;
  bool isCorrect = false;
  int max = 0;
  GameCheck({int maxRandom = 100}){
    max = maxRandom;
    var r = Random();
    answer = r.nextInt(maxRandom)+1;

  }

  String? doGuess(int num){
    count++;
    if(num>answer){
      isCorrect = false;
      return '$num : มากเกินไป';
    }
    else if(num<answer){
      isCorrect = false;
      return '$num : น้อยเกินไป';
    }
    else{
      isCorrect = true;
      return '$num : ถูกต้อง 🎉 (ทาย $count ครั้ง)';
    }
  }
}