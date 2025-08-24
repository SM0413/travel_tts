abstract class TransConst {
  static final double minRate = 0.1;
  static final double maxRate = 2;
  static final int divisions = ((maxRate - minRate) / 0.1).round();
}
