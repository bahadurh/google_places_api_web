import 'dart:math';

String generateSessionToken() {
  const hexDomain = '0123456789abcdef';
  final random = Random(DateTime.now().millisecond);
  final stringBuffer = StringBuffer();

  for (int i = 0; i < 36; i++) {
    if (i == 8 || i == 13 || i == 18 || i == 23) {
      stringBuffer.write('-');
    } else {
      final randIndex = random.nextInt(hexDomain.length);
      stringBuffer.write(hexDomain[randIndex]);
    }
  }
  return stringBuffer.toString();
}
