class BallMenuModel {
  BallMenuModel({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.url,
    required this.skinSupport,
    required this.homepageMode,
    required this.resourceState,
  });

  final int id;
  final String name;
  final String iconUrl;
  final String url;
  final bool skinSupport;
  final String homepageMode;
  final dynamic resourceState;

  factory BallMenuModel.fromJson(Map<String, dynamic> json) => BallMenuModel(
        id: json["id"],
        name: json["name"],
        iconUrl: json["iconUrl"],
        url: json["url"],
        skinSupport: json["skinSupport"],
        homepageMode: json["homepageMode"],
        resourceState: json["resourceState"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "iconUrl": iconUrl,
        "url": url,
        "skinSupport": skinSupport,
        "homepageMode": homepageMode,
        "resourceState": resourceState,
      };
}
