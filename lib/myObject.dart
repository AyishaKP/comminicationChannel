import 'dart:convert';

Welcome welcomeFromJson(String str) {
    final jsonData = json.decode(str);
    return Welcome.fromJson(jsonData);
}

String welcomeToJson(Welcome data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Welcome {
    String name;

    Welcome({
        this.name,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => new Welcome(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
