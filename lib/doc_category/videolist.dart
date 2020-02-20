class Video{

  final String title;
  final String image;
  final String url;
  final String description;

  Video({this.title,this.image,this.url,this.description});

  static List<Video> allCities() {
    var lstOfCities = new List<Video>();

    lstOfCities.add(new Video(title:"Phase1",
                              image: "phase1image.png",
                              url: "wUHqa4m6DO8", 
                              description: "Think of Phase One like the station rotation model of Blended Learning."));

    lstOfCities.add(new Video(title:"Phase2",
                              image: "phase2image.png",
                              url: "vIHL7XRThzc",
                              description: "Phase Two is the 'Magic Sauce of Blended Learning'"));

    lstOfCities.add(new Video(title:"Future Ready Ideas",
                              image: "futureready.png", 
                              url: "zNiIJXlms-s",
                              description: "Ideas that include creating, collaborating, communicating, connecting, and using critical thinking skills."));

    lstOfCities.add(new Video(title:"Progression Boards",
                              image: "progressionboard1.png",
                              url: "tCq5AAB2HbE", 
                              description: "Great way to keep track of data and progress in a BL Classroom"));

    lstOfCities.add(new Video(title:"Data Meetings",
                              image: "datameetings.png",
                              url: "tMpFgzvrNl0", 
                              description: "The use of data pushes educators from a Phase 1 to Phase 2 learning environment in four out of the ten areas on the Blended Learning Continuum."));

    return lstOfCities;
}
}