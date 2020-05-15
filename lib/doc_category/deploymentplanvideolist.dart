class DeploymentPlanVideo{

  final String title;
  final String image;
  final String url;
  final String description;

  DeploymentPlanVideo({this.title,this.image,this.url,this.description});

  static List<DeploymentPlanVideo> allVideos() {
    var listOfVideos = new List<DeploymentPlanVideo>();

    listOfVideos.add(new DeploymentPlanVideo(title:"Virtual Learning Deployment Plan",
                              image: "deploymentplan.jpg",
                              url: "R9TmDdv_2Sk", 
                              description: "Sample rollout plan on how to deploy an engaging blended learning environment for the students."));

    return listOfVideos;
}
}