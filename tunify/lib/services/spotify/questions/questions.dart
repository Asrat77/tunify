
class QuestionMappings{
  Map<String, String> questionMappings = {
    'Do you prefer fast or slow music?': 'tempo',
    'Do you prefer major or minor keys?': 'mode',
    'Do you like songs with vocals or without?': 'speechiness',
    'Do you prefer acoustic or electronic sounds?': 'acousticness',
    'Do you prefer complex or simple music?': 'instrumentalness',
};

}
  Map<String, double> questionWeights = {
    'Do you prefer fast or slow music?': 10,
    'Do you prefer major or minor keys?': 8,
    'Do you like songs with vocals or without?': 6,
    'Do you prefer acoustic or electronic sounds?': 4,
    'Do you prefer complex or simple music?': 2,
  };
  Map<String, int> questionScores = {
    'Do you prefer fast or slow music?': 8, // user answered "fast"
    'Do you prefer major or minor keys?': 5, // user answered "minor"
    'Do you like songs with vocals or without?': 9, // user answered "with vocals"
    'Do you prefer acoustic or electronic sounds?': 3, // user answered "acoustic"
    'Do you prefer complex or simple music?': 7, // user answered "complex"
  };
  Map<String, double> weightedScores = {};



}



