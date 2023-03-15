class Functions {
  bool checkLetters(String letters) {
    bool isEnglish = false;
    if (RegExp(r'^[0-9]').hasMatch(letters[0])) {
      letters = letters.split(' ')[1];
    }
    if (RegExp(r'^[A-Za-z]+$').hasMatch(letters[0])) {
      isEnglish = true;
    }

    return isEnglish;
  }

  String arrangeVideoTime(int hours, int minutes, int seconds) {
    String result = '';
    if (hours < 10) {
      result = '0$hours';
    } else {
      result = '$hours';
    }
    if (hours == 0) {
      result = '';
    }
    if (minutes < 10) {
      result = hours == 0 ? '0$minutes' : '$result:0$minutes';
    } else {
      result = hours == 0 ? '$minutes' : '$result:$minutes';
    }
    if (seconds < 10) {
      result = '$result:0$seconds';
    } else {
      result = '$result:$seconds';
    }
    return result;
  }
}
