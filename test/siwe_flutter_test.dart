import 'package:flutter_test/flutter_test.dart';
import 'package:siwe_flutter/siwe_flutter.dart';

void main() {
  test('createMessage creates a valid message and payload', () {
    // Arrange
    final siweFlutter = SiweFlutter(
      domain: 'example.com',
      statement: 'Sign in request',
      version: '1',
      uri: 'https://example.com',
      chainId: '1',
    );

    // Act
    final result = siweFlutter.createMessage(
      walletAddress: '0x123456789abcdef',
      nonce: '123456',
    );

    // Assert
    expect(result.message, isNotNull);
    expect(result.payload, isNotNull);

    // Add more specific assertions based on your requirements
  });

  test('createMessageV2 creates a valid message and payload', () {
    // Arrange
    final siweFlutter = SiweFlutter(
      domain: 'example.com',
      statement: 'Sign in request',
      version: '2',
      uri: 'https://example.com',
      chainId: '1',
    );

    // Act
    final result = siweFlutter.createMessageV2(
      walletAddress: '0x123456789abcdef',
      nonce: '123456',
      expirationTime: '2023-01-01T12:00:00Z',
      notBefore: '2022-12-01T00:00:00Z',
      requestId: 'request123',
      resources: ['resource1', 'resource2'],
    );

    // Assert
    expect(result.message, isNotNull);
    expect(result.payload, isNotNull);

    // Add more specific assertions based on your requirements
  });
}
