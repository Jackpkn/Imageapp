class PicModel {
  String? name;
  String? image;
}

List<PicModel> getpic() {
  List<PicModel> model = [];
  PicModel url = PicModel();
  url.image =
      'https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500';
  url.name = 'Motivation';
  model.add(url);
  url = PicModel();
  url.image =
      'https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500';
  url.name = 'Tiger';
  model.add(url);
  url = PicModel();
  url.image =
      'https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500';
  url.name = 'Street Art';
  model.add(url);
  url = PicModel();
  url.image =
      'https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500';
  url.name = 'Wild life';
  model.add(url);
  url = PicModel();
  url.image =
      'https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500';
  url.name = 'Nature';
  model.add(url);
  url = PicModel();
  url.image =
      'https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500';
  url.name = 'Bikes';
  model.add(url);
  url = PicModel();
    url.image =
      'https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500';
  url.name = 'Cars';
  model.add(url);
  url = PicModel();
  return model;
}
