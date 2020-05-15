class NewNormalVideo{

  final String title;
  final String image;
  final String url;
  final String description;

  NewNormalVideo({this.title,this.image,this.url,this.description});

  static List<NewNormalVideo> allVideos() {
    var listOfVideos = new List<NewNormalVideo>();

    listOfVideos.add(new NewNormalVideo(title:"The New Norm - Part 1",
                              image: "newnormal.png",
                              url: "1JWFNHi1VS4", 
                              description: "Part 1 discusses the four different types of Blended Learning."));

    listOfVideos.add(new NewNormalVideo(title:"The New Norm - Part 2",
                              image: "newnormal.png",
                              url: "pUw6uwLB67M",
                              description: "Part 2 describes what Blended Learning looks like in Elementary, Middle, and High School.'"));

    listOfVideos.add(new NewNormalVideo(title:"The New Norm - Part 3",
                              image: "newnormal.png",
                              url: "jseqfWQQW9U",
                              description: "Part 3 explains the 'WHY' of Blended Learning.'"));

    listOfVideos.add(new NewNormalVideo(title:"The New Norm - Part 4",
                              image: "newnormal.png",
                              url: "fwdQREZJkdQ",
                              description: "Part 4 discusses how to get started and how to deploy Blended Learning at your school.'"));

    listOfVideos.add(new NewNormalVideo(title:"The New Norm - Part 5",
                              image: "newnormal.png",
                              url: "FKrVY-QGYDw",
                              description: "Part 5 reviews some technology tools that can improve the Blended Learning Process.'"));

    return listOfVideos;
}
}