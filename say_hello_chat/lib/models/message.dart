import '../constant.dart';

class MesageModel {
  final String textMessage;
  final String id;

  MesageModel(
    this.textMessage, this.id,
  );
  factory MesageModel.fromJson(jsonData) {
    return MesageModel(jsonData[KMessage],jsonData['id']);
  }
}
