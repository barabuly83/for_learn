class Rating {
  final double value;
  final int totalReviews;

  const Rating({
    required this.value,
    this.totalReviews = 0,
  });

  int get stars => value.round();
}

