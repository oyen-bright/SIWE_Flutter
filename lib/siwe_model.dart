// ignore_for_file: public_member_api_docs, sort_constructors_first
library siwe_flutter;

class SiweModel {
  String? message;
  String? signature;
  String? address;
  String? domain;
  String? statement;
  String? uri;
  String? version;
  String? chainId;
  Map<String, dynamic>? payload;
  String? nonce;
  String? bridge;
  String? name;
  String? description;
  String? url;
  String? icon;

  SiweModel({
    this.message,
    this.signature,
    this.address,
    this.domain,
    this.statement,
    this.uri,
    this.version,
    this.chainId,
    this.payload,
    this.nonce,
    this.bridge,
    this.name,
    this.description,
    this.url,
    this.icon,
  });

  factory SiweModel.fromJson(Map<String, dynamic> json) {
    return SiweModel(
      message: json['message'],
      signature: json['signature'],
      address: json['address'],
      domain: json['domain'],
      statement: json['statement'],
      uri: json['uri'],
      version: json['version'],
      chainId: json['chainId'],
      payload: json['payload'],
      nonce: json['nonce'],
      bridge: json['bridge'],
      name: json['name'],
      description: json['description'],
      url: json['url'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'signature': signature,
      'address': address,
      'domain': domain,
      'statement': statement,
      'uri': uri,
      'version': version,
      'chainId': chainId,
      'payload': payload,
      'nonce': nonce,
      'bridge': bridge,
      'name': name,
      'description': description,
      'url': url,
      'icon': icon,
    };
  }

  bool get canGenerateMessage {
    return [domain, address, statement, uri, version, chainId, nonce]
        .any((element) => element == null);
  }

  SiweModel copyWith({
    String? message,
    String? signature,
    String? address,
    String? domain,
    String? statement,
    String? uri,
    String? version,
    String? chainId,
    Map<String, dynamic>? payload,
    String? nonce,
    String? bridge,
    String? name,
    String? description,
    String? url,
    String? icon,
  }) {
    return SiweModel(
      message: message ?? this.message,
      signature: signature ?? this.signature,
      address: address ?? this.address,
      domain: domain ?? this.domain,
      statement: statement ?? this.statement,
      uri: uri ?? this.uri,
      version: version ?? this.version,
      chainId: chainId ?? this.chainId,
      payload: payload ?? this.payload,
      nonce: nonce ?? this.nonce,
      bridge: bridge ?? this.bridge,
      name: name ?? this.name,
      description: description ?? this.description,
      url: url ?? this.url,
      icon: icon ?? this.icon,
    );
  }
}
