class FetchedAudiobook{
  var author_name,title,description,image,category,rate,Chapters,id,narrator_name,email,cell,createdAt,updatedAt;

  FetchedAudiobook({this.author_name, this.title, this.description, this.image, this.category, this.rate, this.Chapters, this.id,this.narrator_name,this.email,this.cell,this.createdAt,this.updatedAt});

  factory FetchedAudiobook.fromJson(Map<String, dynamic> json) => FetchedAudiobook(
    id: json['_id'],
    author_name: json['author_name'],
    title: json['title'],
    description: json['description'],
    image: json['image'],
    category: json['category'],
    rate: json['rate'],
    Chapters: json['Chapters'],
    narrator_name: json['narrator_name'],
    email: json['email'],
    cell: json['cell'],
    createdAt: json['createdAt'],
    updatedAt: json['updatedAt']
  );
}