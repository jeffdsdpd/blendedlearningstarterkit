class ZOOMVideo{

  final String title;
  final String image;
  final String url;
  final String description;

  ZOOMVideo({this.title,this.image,this.url,this.description});

  static List<ZOOMVideo> allVideos() {
    var listOfVideos = new List<ZOOMVideo>();

    listOfVideos.add(new ZOOMVideo(title:"Getting Started with ZOOM - Part 1",
                              image: "zoom.png",
                              url: "-JQvuJXT8g", 
                              description: "Part 1 discusses how to use the ZOOM features."));

    listOfVideos.add(new ZOOMVideo(title:"Getting Started with ZOOM - Part 2",
                              image: "zoom.png",
                              url: "HerxbBT3pZ0",
                              description: "Part 2 steps through opening up ZOOM and managing participants.'"));

    listOfVideos.add(new ZOOMVideo(title:"Getting Started with ZOOM - Part 3",
                              image: "zoom.png",
                              url: "L5zVJU9rSRE",
                              description: "Part 3 explains some extra features in ZOOM.'"));

    return listOfVideos;
}
}