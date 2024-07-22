import 'dart:io';

Future<void> encryptFile({
  required String inputFilePath,
  required String outputFilePath,
  required int key,
}) async {
  final inputFile = File(inputFilePath);
  final outputFile = File(outputFilePath);

  // Merubah content file menjadi byte
  final fileContent = await inputFile.readAsBytes();

  // Membuat list dari byte dan meng XOR kan tiap elemend dengan nilai key
  // (^) ini adalah operator XOR
  final encryptedContent = fileContent.map((byte) => byte ^ key).toList();

  outputFile.writeAsBytesSync(encryptedContent);
}

void main(List<String> args) {
  const key = 007;
  encryptFile(
    inputFilePath: 'input.txt',
    outputFilePath: 'result/cipher_text.txt',
    key: key,
  );
}
