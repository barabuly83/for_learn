import 'constants.dart';

class LayoutCalculator {
  static double calculateStatsOffset() {
    const double userInfoHeight = AppDimens.userInfoHeight;
    double userInfoBottom = AppDimens.avatarSizeLarge / 2 -
        AppDimens.userInfoVerticalOffset +
        userInfoHeight;
    const double minGap = AppDimens.paddingMedium;
    double baseOffset = AppDimens.avatarSizeLarge / 2;
    double calculatedOffset = userInfoBottom + minGap;
    return (calculatedOffset > baseOffset ? calculatedOffset : baseOffset) +
        AppDimens.statsOffsetSafetyMargin;
  }
}
