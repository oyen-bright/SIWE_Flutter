library siwe_flutter;

import 'siwe_model.dart';

class SiweFlutter {
  late SiweModel siweModel;

  SiweFlutter(
      {required String domain,
      required String statement,
      required String version,
      required String uri,
      required String chainId}) {
    siweModel = SiweModel(
        statement: statement, domain: domain, uri: uri, chainId: chainId);
  }

  ({String message, Map<String, dynamic> payload}) createMessage(
      {required String walletAddress, required String nonce}) {
    // Address must be EIP55 compliant, if using web3dart, use the hexEip55 method.
    DateTime now = DateTime.now();
    int millisecondsSinceEpoch = now.millisecondsSinceEpoch;
    String iso8601 = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch)
        .toIso8601String();
    // Remove microseconds from the ISO 8601 string
    int indexOfDot = iso8601.indexOf('.');
    String iso8601WithoutMicroseconds =
        '${iso8601.substring(0, indexOfDot + 4)}Z';

    siweModel = siweModel.copyWith(address: walletAddress, nonce: nonce);

// final message
    final message =
        "${siweModel.domain} wants you to sign in with your Ethereum account:\n${siweModel.address}\n\n${siweModel.statement}\n\nURI: ${siweModel.uri}\nVersion: ${siweModel.version}\nChain ID: ${siweModel.chainId}\nNonce: ${siweModel.nonce}\nIssued At: $iso8601WithoutMicroseconds";
    siweModel = siweModel.copyWith(payload: {
      "domain": siweModel.domain,
      "address": siweModel.address,
      "statement": siweModel.statement,
      "uri": siweModel.uri,
      "version": siweModel.version,
      "chainId": siweModel.chainId,
      "nonce": nonce,
      "issuedAt": iso8601WithoutMicroseconds
    });

    return (message: message, payload: siweModel.payload!);
  }

  ({String message, Map<String, dynamic> payload}) createMessageV2(
      {required String walletAddress,
      required String nonce,
      String? expirationTime,
      String? notBefore,
      String? requestId,
      List<String>? resources}) {
    siweModel = siweModel.copyWith(address: walletAddress, nonce: nonce);

    final header =
        '${siweModel.domain} wants you to sign in with your Ethereum account:';
    final uriField = 'URI: ${siweModel.uri}';
    var prefix = '$header\n${siweModel.address}';
    final versionField = 'Version: ${siweModel.version}';
    final chainField = 'Chain ID: ${siweModel.chainId ?? '1'}';
    final nonceField = 'Nonce: ${siweModel.nonce}';

    final suffixArray = [uriField, versionField, chainField, nonceField];

    final issuedAt = DateTime.now().toIso8601String();

    suffixArray.add('Issued At: $issuedAt');

    if (expirationTime != null) {
      final expiryField = 'Expiration Time: $expirationTime';
      suffixArray.add(expiryField);
    }

    if (notBefore != null) {
      suffixArray.add('Not Before: $notBefore');
    }

    if (requestId != null) {
      suffixArray.add('Request ID: $requestId');
    }

    if (resources != null) {
      suffixArray
          .add(['Resources:', ...resources.map((x) => '- $x')].join('\n'));
    }

    final suffix = suffixArray.join('\n');
    prefix = '$prefix\n${siweModel.statement}';
    if (siweModel.statement != null && siweModel.statement!.isNotEmpty) {
      prefix += '\n';
    }
    final message = '$prefix\n$suffix';

    siweModel = siweModel.copyWith(payload: {
      "domain": siweModel.domain,
      "address": siweModel.address,
      "statement": siweModel.statement,
      "uri": siweModel.uri,
      "version": siweModel.version,
      "chainId": siweModel.chainId,
      "nonce": nonce,
      "issuedAt": issuedAt
    });
    return (message: message, payload: siweModel.payload!);
  }
}
