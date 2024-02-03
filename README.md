<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
# siwe_flutter

SIWE Flutter is a Flutter plugin that enables Sign-In with Ethereum, allowing users to use their Ethereum accounts to access web services.

## Overview

Today’s login experiences often rely on accounts controlled by centralized identity providers, such as Google, Facebook, and Apple. SIWE aims to provide an alternative by leveraging Ethereum accounts for authentication, offering users greater control over their digital identities.

The Ethereum ecosystem already has tens of millions of monthly active wallet users, making it an excellent foundation for secure authentication across various services.

## Benefits

### For Web2

- Empowers users with control over their identifiers.
- Introduces dedicated user bases to Web3.
- Provides a strict specification for seamless integration.

### For Web3

- Standardizes the sign-in workflow for improved interoperability.
- Enhances UX by offering a reliable method for wallet vendors to identify sign-in requests.

## Getting Started

### 1. Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  siwe_flutter: ^1.0.0

```


### 2. Generating Message

```dart
import 'package:flutter/material.dart';
import 'package:siwe_flutter/siwe.dart';

// ... (your app code)

// Step 1: Replace these values with your actual data
String walletAddress = '0xYourWalletAddress';
String nonce = '123456'; // Replace with a valid nonce

// ### Generating a Version 1 Message ###
// Step 2: Generate message for version 1
var messageV1 = SiweFlutter(
  domain: 'example.com',
  statement: 'Sign in with your Ethereum account',
  version: '1',
  uri: 'example-uri',
  chainId: '1',
).createMessage(walletAddress: walletAddress, nonce: nonce);

// Print or use the generated message for version 1
print('Message for Version 1: ${messageV1.message}');

// ### Generating a Version 2 Message ###
// Step 3: Generate message for version 2
var messageV2 = SiweFlutter(
  domain: 'example.com',
  statement: 'Sign in with your Ethereum account',
  version: '1',
  uri: 'example-uri',
  chainId: '1',
).createMessageV2(
  walletAddress: walletAddress,
  nonce: nonce,
  expirationTime: '1639459200', // Replace with a valid expiration time
  notBefore: '1639459200', // Replace with a valid notBefore value
  requestId: '123', // Replace with a valid requestId
  resources: ['resource1', 'resource2'], // Replace with valid resources
);

// Print or use the generated message for version 2
print('Message for Version 2: ${messageV2.message}');

```
 ### Step 3: Send the Message to User's Wallet for Signing ###
 For this step, you would typically send the generated message (messageV2.message)
to the user's wallet for them to sign. The actual implementation may vary depending
 on the wallet and signing method (personal sign or eth sign) you are using.
Consult the documentation of the wallet you're integrating with for specific details.




