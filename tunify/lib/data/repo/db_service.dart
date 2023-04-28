import 'package:tunify/data/models/track.dart';


import 'local_db.dart';

class ServiceLocal {
  Repository? _repository;

  ServiceLocal() {
    _repository = Repository();
  }

  saveLiked(Track track) async {
    return await _repository!.insertData('liked-songs', track.toJson());
  }

  readLiked() async {
    return await _repository!.readData('liked-songs');
  }

}