class PlanningGuideVideo{

  final String title;
  final String image;
  final String url;
  final String description;

  PlanningGuideVideo({this.title,this.image,this.url,this.description});

  static List<PlanningGuideVideo> allVideos() {
    var listOfVideos = new List<PlanningGuideVideo>();

    listOfVideos.add(new PlanningGuideVideo(title:"BL Planning Guide - Part 1",
                              image: "planningguide.png",
                              url: "XB4lBrX4yGY", 
                              description: "Part 1 explains how you can start planning for a Blended type classroom."));

    listOfVideos.add(new PlanningGuideVideo(title:"BL Planning Guide - Part 2",
                              image: "planningguide.png",
                              url: "oNFaENcBVHw",
                              description: "Part 2 details out how to plan a lesson.'"));

    listOfVideos.add(new PlanningGuideVideo(title:"BL Planning Guide - Part 3",
                              image: "planningguide.png",
                              url: "2a293kWWVs0",
                              description: "Part 3 describes the learning studios and time management.'"));

    listOfVideos.add(new PlanningGuideVideo(title:"BL Planning Guide - Part 4",
                              image: "planningguide.png",
                              url: "mHrANv6KSm0",
                              description: "Part 4 explains how our Virtual PD Workshops are delivered.'"));

    return listOfVideos;
}
}