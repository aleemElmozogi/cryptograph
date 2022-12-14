import 'kinstant.dart';

String encrypt(String text, int encryptKey) {
  String encrypted = '';
  for (int i = 0; i < text.length; i++) {
    encrypted =
        encrypted + letters[(letters.indexOf(text[i]) + encryptKey) % 27];
  }
  return encrypted;
}

String decrypt(text, int encryptKey) {
  String decrypted = '';
  for (int i = 0; i < text.length; i++) {
    letters.indexOf(text[i]);
    decrypted =
        decrypted + letters[(letters.indexOf(text[i]) - encryptKey) % 27];
  }
  return decrypted;
}
