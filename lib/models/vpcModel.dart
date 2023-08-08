class DBModel {
  //final int id;
  final String vpcName;
  final String cloudName;
  final String accessKeyId;
  final String secretAccessKey;
  final String region;

  DBModel(
      {
      //required this.id,
      required this.vpcName,
      required this.cloudName,
      required this.accessKeyId,
      required this.secretAccessKey,
      required this.region});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      //"id": id,
      "vpcName": vpcName,
      "cloudName": cloudName,
      "accessKeyId": accessKeyId,
      "secretAccessKey": secretAccessKey,
      "region": region,
    };
  }
}
