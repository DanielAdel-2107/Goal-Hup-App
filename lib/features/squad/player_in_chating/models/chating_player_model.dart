class ChatingPlayerModel {
  final String id;
  final String squadId;
  final String playerId;
  final String playerName;
  final String playerImage;
  final String squadName;

  ChatingPlayerModel(
      {required this.id,
      required this.squadId,
      required this.playerId,
      required this.playerImage,
      required this.squadName,
      required this.playerName});

  factory ChatingPlayerModel.fromJson(Map<String, dynamic> json) {
    return ChatingPlayerModel(
      id: json['id'],
      squadId: json['squad_id'],
      playerId: json['player_id'],
      playerName: json['player_name'],
      playerImage: json['player_image'],
      squadName: json['squad_name'],
    );
  }
}
