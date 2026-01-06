import 'package:flutter/material.dart';
import '../models/product.dart';
import '../constants/app_constants.dart';

class ProductImageSection extends StatelessWidget {
  final Product product;
  final VoidCallback onImageTap;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const ProductImageSection({
    super.key,
    required this.product,
    required this.onImageTap,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onImageTap,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppConstants.cardBorderRadius),
              topRight: Radius.circular(AppConstants.cardBorderRadius),
            ),
            child: SizedBox(
              height: AppConstants.imageHeight,
              width: double.infinity,
              child: Image.network(
                product.imageUrls.isNotEmpty ? product.imageUrls.first : '',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // Иконка избранного в правом верхнем углу
        Positioned(
          top: AppConstants.badgeTopOffset,
          right: AppConstants.badgeTopOffset,
          child: IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: onFavoriteTap,
            style: IconButton.styleFrom(
              backgroundColor: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        // Бейдж "Акция" в левом верхнем углу
        if (product.isOnSale)
          Positioned(
            top: AppConstants.badgeTopOffset,
            left: AppConstants.badgeTopOffset,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.badgeHorizontalPadding,
                vertical: AppConstants.badgeVerticalPadding,
              ),
              decoration: BoxDecoration(
                color: AppConstants.orangeBadge,
                borderRadius: BorderRadius.circular(AppConstants.badgeBorderRadius),
              ),
              child: const Text(
                'Акция',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: AppConstants.badgeFontSize,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

