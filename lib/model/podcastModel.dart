class FetchedPodcast{
  var podcasters,title,description,image,episodes,rate,id;

  FetchedPodcast({required this.podcasters,required this.title,required this.description,required this.image,required this.episodes,required this.rate,required this.id});

  factory FetchedPodcast.fromJson(Map<String, dynamic> json) => FetchedPodcast(
    id: json['_id'],
    podcasters: json['podcasters'],
    title: json['title'],
    description: json['description'],
    image: json['image'],
    episodes: json['episodes'],
    rate: json['rate'],
  );
}