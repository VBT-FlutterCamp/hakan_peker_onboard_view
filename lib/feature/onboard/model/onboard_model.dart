class OnBoardModel {
  String title;
  String description;
  String image;

  OnBoardModel({required this.title, required this.description, required this.image});
}

List<OnBoardModel> models = [
  OnBoardModel(
      title: 'Symptoms of Covid-19',
      description: 'COVID-19 affects different people in different ways.'
          'Most infected people will develop mild to moderate illness.',
      image: "assets/images/medical_care.png"),
  OnBoardModel(
      title: 'Covid-19 Information',
      description: 'Most people who fall sick with COVID-19 will experience mild to moderate symptoms.',
      image: "assets/images/social_distance.png"),
  OnBoardModel(
      title: 'Just Stay at Home',
      description: 'stay at home to self quarantine ourself from covid-19, hopefully everything gonna be fine soon.',
      image: "assets/images/stay_home.png"),
];
