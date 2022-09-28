import 'dart:math';

String formatCount(int count) {
  const double k = 10000;
  final List<String> sizes = ['', '万', '亿', '万亿'];

  if (count < k) {
    return count.toString();
  } else {
    int i = (log(count) / log(k)).floor();
    // 数字部分
    final String value = (count / pow(k, i)).toStringAsFixed(0);
    // 单位部分
    final String unit = sizes[i];

    return value + unit;
  }
}
