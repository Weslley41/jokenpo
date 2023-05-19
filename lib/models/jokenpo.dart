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
}
