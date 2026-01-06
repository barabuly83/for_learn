import 'package:flutter/material.dart';
import '../models/product.dart';
import '../constants/app_constants.dart';

class ProductInfoSection extends StatelessWidget {
  final Product product;

  const ProductInfoSection({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: const TextStyle(
              fontSize: AppConstants.titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppConstants.smallPadding),
          _buildRating(),
          const SizedBox(height: AppConstants.smallPadding),
          Text(
            product.description,
            style: const TextStyle(
              fontSize: AppConstants.descriptionFontSize,
              color: Colors.grey,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildRating() {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < product.rating.stars
              ? Icons.star
              : Icons.star_border,
          color: Colors.amber,
          size: AppConstants.iconSize,
        );
      }),
    );
  }
}

