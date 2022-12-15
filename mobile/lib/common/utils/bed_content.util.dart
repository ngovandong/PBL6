abstract class BedCode {
  static const String oneSingleBed = '1s';
  static const String oneSingleBedOneTwiceBed = '1s1d';
  static const String twoSingleBed = '2d';
}

abstract class BedContentUtil {
  static String getLabel(String code) {
    switch (code) {
      case BedCode.oneSingleBed:
        return '1 giường đơn';
      case BedCode.oneSingleBedOneTwiceBed:
        return '1 giường đơn, 1 giường đôi';
      default:
        return '2 giường đôi';
    }
  }
}
