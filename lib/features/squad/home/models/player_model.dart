class PlayerModel {
  final String id;
  final String name;
  final String overallRating;
  final String dateOfBirth;
  final String nationality;
  final String club;
  final String height;
  final String weight;
  final List<String> preferrdFoot;
  final List<String> positions;
  final String image;

  PlayerModel({
    required this.id,
    required this.name,
    required this.overallRating,
    required this.dateOfBirth,
    required this.nationality,
    required this.club,
    required this.height,
    required this.weight,
    required this.preferrdFoot,
    required this.positions,
    required this.image,
  });

factory PlayerModel.fromJson(Map<String, dynamic> json) {
  final preferredFootList = (json['preferred_foot']?['foot'] as List?)?.cast<String>() ?? [];
  final positionList = (json['primary_position']?['positions'] as List?)?.cast<String>() ?? [];

  return PlayerModel(
    id: json['id'] ?? '',
    name: json['full_name'] ?? '',
    overallRating: json['overall_rating'] ?? '',
    dateOfBirth: json['date_of_birth'] ?? '',
    nationality: json['nationality'] ?? '',
    club: json['current_club'] ?? '',
    height: json['height'] ?? '',
    weight: json['weight'] ?? '',
    preferrdFoot: preferredFootList,
    positions: positionList,
    image: json['image'] ?? '',
  );
}


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': name,
      'overall_rating': overallRating,
      'date_of_birth': dateOfBirth,
      'nationality': nationality,
      'current_club': club,
      'height': height,
      'weight': weight,
      'preferred_foot': {'foot': preferrdFoot},
      'primary_position': {'positions': positions},
      'image': image,
    };
  }

  @override
  String toString() {
    return 'PlayerModel{id: $id, name: $name, overallRating: $overallRating, dateOfBirth: $dateOfBirth, nationality: $nationality, club: $club, height: $height, weight: $weight, preferrdFoot: $preferrdFoot, positions: $positions, image: $image}';
  }
}
