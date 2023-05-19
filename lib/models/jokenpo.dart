enum GameOption {
  rock,
  paper,
  scissor;

  String get imageName {
    const images = [
      'assets/images/rock.png',
      'assets/images/paper.png',
      'assets/images/scissor.png',
    ];

    return images[index];
  }

  GameResult operator >(GameOption other) {
    if (this == other) return GameResult.draw;

    switch (this) {
      case rock:
        return other == scissor ? GameResult.win : GameResult.lose;
      case paper:
        return other == rock ? GameResult.win : GameResult.lose;
      case scissor:
        return other == paper ? GameResult.win : GameResult.lose;
    }
  }
}

enum GameResult {
  win,
  lose,
  draw;

  String get message {
    const messages = ['Você ganhou!', 'Você perdeu!', 'Empate!'];

    return messages[index];
  }
}
