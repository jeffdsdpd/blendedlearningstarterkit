class CovidSlideVideo{

  final String title;
  final String image;
  final String url;
  final String description;

  CovidSlideVideo({this.title,this.image,this.url,this.description});

  static List<CovidSlideVideo> allVideos() {
    var listOfVideos = new List<CovidSlideVideo>();

    listOfVideos.add(new CovidSlideVideo(title:"Fix to the COVID Slide - Part 1",
                              image: "covidslide.jpg",
                              url: "AZepUn8c5OA", 
                              description: "Part 1 explores data from NWEA and the possible slide learning loss."));

    listOfVideos.add(new CovidSlideVideo(title:"Fix to the COVID Slide - Part 2",
                              image: "covidslide.jpg",
                              url: "fss4gZQiYrI",
                              description: "Part 2 describes what a possible Summer Fix might look like.'"));

    listOfVideos.add(new CovidSlideVideo(title:"Fix to the COVID Slide - Part 3",
                              image: "covidslide.jpg",
                              url: "yf-v4f-QrOA",
                              description: "Part 3 explains how to prepare the teachers.'"));

    listOfVideos.add(new CovidSlideVideo(title:"Fix to the COVID Slide - Part 4",
                              image: "covidslide.jpg",
                              url: "ApD5-XUHq8E",
                              description: "Part 4 digs in to what some sample checklists might look like.'"));

    return listOfVideos;
}
}