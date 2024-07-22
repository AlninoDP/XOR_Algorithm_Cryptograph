import 'dart:io';

void decryptFile({
  required String inputFilePath,
  required String outputFilePath,
  required int key,
}) {
  final inputFile = File(inputFilePath);
  final outputFile = File(outputFilePath);

  final fileContent = inputFile.readAsBytesSync();
  final decryptedContent = fileContent.map((byte) => byte ^ key).toList();

  outputFile.writeAsBytesSync(decryptedContent);
}

void main() {
  const key = 007; // XOR key
  decryptFile(
      inputFilePath: 'result/cipher_text.txt',
      outputFilePath: 'result/plain_text.txt',
      key: key);
}
