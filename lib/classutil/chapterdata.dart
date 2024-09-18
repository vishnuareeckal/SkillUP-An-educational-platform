class ChapterData {
  late List<List<String>> textdata;
  ChapterData()
      : textdata = [
          [
            "Hello World!",
            "If you are wondering what is the world is programming?. Then stick till the end of the topic",
          ],
          [
            "Imagine you are playing with your dog and you instruct him to bring the ball that you just threw.",
            "Dog will surely run towards the dog and fetch it for you.",
                "You might be thinking what this example has to do with programming?",
            "So,let me tell you what you did was just instructed the dog to accomplish a task.",
            "That is you just 'Programmed'Your dog to do so",
          ]
        ];

//get methed

  List<String> getTextData() {
    return ["Item 1", "Item 2", "Item 3"];
  }
}
