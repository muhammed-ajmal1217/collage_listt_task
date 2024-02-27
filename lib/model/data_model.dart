class DataModel{
  String? alphaCode;
  String? stateProvince;
  String? country;
  String? name;
  List? webPage;
  List? domain;

  DataModel({
    this.alphaCode,
    this.stateProvince,
    this.country,
    this.name,
    this.webPage,
    this.domain,
  });
  factory DataModel.fromJson(Map<String,dynamic>json){
    return DataModel(
      alphaCode: json["alpha_two_code"],
      stateProvince: json["state-province"],
      country: json["country"],
      name: json["name"],
      webPage: json["web_pages"],
      domain: json["domains"],
    );
  }
}