import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:siwe_flutter/siwe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: _GenerateMessageButton(),
        ),
      ),
    );
  }
}

class _GenerateMessageButton extends StatefulWidget {
  @override
  _GenerateMessageButtonState createState() => _GenerateMessageButtonState();
}

class _GenerateMessageButtonState extends State<_GenerateMessageButton> {
  String domain = 'example.com';
  String statement = 'Sign in with your Ethereum account';
  String version = '1';
  String uri = 'example-uri';
  String chainId = '1';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            String walletAddress = '0xYourWalletAddress';
            String nonce = '123456'; // Replace with a valid nonce

            // Generate message for version 1
            var messageV1 = SiweFlutter(
              domain: domain,
              statement: statement,
              version: version,
              uri: uri,
              chainId: chainId,
            ).createMessage(walletAddress: walletAddress, nonce: nonce);

            // Print or use the generated message for version 1
            print('Message for Version 1: ${messageV1.message}');

            // Generate message for version 2
            var messageV2 = SiweFlutter(
              domain: domain,
              statement: statement,
              version: version,
              uri: uri,
              chainId: chainId,
            ).createMessageV2(
              walletAddress: walletAddress,
              nonce: nonce,
              expirationTime:
                  '1639459200', // Replace with a valid expiration time
              notBefore: '1639459200', // Replace with a valid notBefore value
              requestId: '123', // Replace with a valid requestId
              resources: [
                'resource1',
                'resource2'
              ], // Replace with valid resources
            );

            // Print or use the generated message for version 2
            print('Message for Version 2: ${messageV2.message}');
          },
          child: const Text('Generate Messages'),
        ),
      ],
    );
  }
}
