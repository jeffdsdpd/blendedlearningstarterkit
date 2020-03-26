class TeachAtHomeVideo{

  final String title;
  final String image;
  final String url;
  final String description;

  TeachAtHomeVideo({this.title,this.image,this.url,this.description});

  static List<TeachAtHomeVideo> allVideos() {
    var listOfVideos = new List<TeachAtHomeVideo>();

    listOfVideos.add(new TeachAtHomeVideo(title:"Getting Started - Webinar",
                              image: "teachingfromhome1.png",
                              url: "s6CdKkh-tu0", 
                              description: "This video webinar discusses some topics and tools to utilize for learning at home."));

    listOfVideos.add(new TeachAtHomeVideo(title:"Part 1 - Making Videos",
                              image: "teachingfromhome1.png",
                              url: "PNM6byJBswk",
                              description: "Part One discusses different tools to create and manage your videos.'"));

    listOfVideos.add(new TeachAtHomeVideo(title:"Part 2 - Google Classroom",
                              image: "teachingfromhome1.png",
                              url: "BUlhlQH92Uc",
                              description: "Part Two deals with digging into Google Classrom and how you can set it up to get started.'"));

    listOfVideos.add(new TeachAtHomeVideo(title:"Part 3 - Connect Students",
                              image: "teachingfromhome1.png",
                              url: "UbGBur7ZVuA",
                              description: "Part Three continues with discussing ways to continue building connections with the students.'"));

    listOfVideos.add(new TeachAtHomeVideo(title:"Part 4 - Free Tech Tools",
                              image: "teachingfromhome1.png",
                              url: "vflJTnJlj4c",
                              description: "Part Four explains several of our favorite tech tools used in schools across the country.'"));

    listOfVideos.add(new TeachAtHomeVideo(title:"Part 5 - Lesson Design",
                              image: "teachingfromhome1.png",
                              url: "rDhCAjrqHH8",
                              description: "Part Five demonstrates how to design a lesson for home.'"));

    listOfVideos.add(new TeachAtHomeVideo(title:"Teaching At Home Toolkit",
                              image: "3PhasesBL1.png",
                              description: "Teaching At Home Toolkit.'"));

    return listOfVideos;
}
}