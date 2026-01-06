import 'package:flutter/material.dart';
import '../models/product.dart';
import '../constants/app_constants.dart';
import '../utils/price_formatter.dart';

class ProductActionsSection extends StatelessWidget {
  final Product product;
  final int quantity;
  final double totalPrice;
  final double? totalOldPrice;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onAddToCart;
  final VoidCallback onShowDetails;
  final bool isLoading;

  const ProductActionsSection({
    super.key,
    required this.product,
    required this.quantity,
    required this.totalPrice,
    this.totalOldPrice,
    required this.onIncrement,
    required this.onDecrement,
    required this.onAddToCart,
    required this.onShowDetails,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPrice(),
          const SizedBox(height: AppConstants.defaultPadding),
          _buildQuantityAndCartButton(context),
          const SizedBox(height: AppConstants.smallPadding),
          _buildDetailsButton(context),
        ],
      ),
    );
  }

  Widget _buildPrice() {
    return Row(
      children: [
        Text(
          PriceFormatter.format(totalPrice),
          style: const TextStyle(
            fontSize: AppConstants.priceFontSize,
            fontWeight: FontWeight.bold,
            color: AppConstants.primaryBlue,
          ),
        ),
        if (totalOldPrice != null) ...[
          const SizedBox(width: AppConstants.smallPadding),
          Text(
            PriceFormatter.format(totalOldPrice!),
            style: TextStyle(
              fontSize: AppConstants.oldPriceFontSize,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildQuantityAndCartButton(BuildContext context) {
    return Row(
      children: [
        // Счетчик количества
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(AppConstants.smallPadding),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: isLoading ? null : onDecrement,
                padding: const EdgeInsets.all(AppConstants.smallPadding),
                constraints: const BoxConstraints(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.quantityHorizontalPadding,
                ),
                child: Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: AppConstants.quantityFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: isLoading ? null : onIncrement,
                padding: const EdgeInsets.all(AppConstants.smallPadding),
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppConstants.smallPadding),
        // Кнопка "В корзину"
        Expanded(
          child: ElevatedButton(
            onPressed: isLoading ? null : onAddToCart,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: AppConstants.buttonVerticalPadding,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.buttonBorderRadius),
              ),
              backgroundColor: AppConstants.lightPurple,
              foregroundColor: AppConstants.primaryPurple,
              elevation: AppConstants.buttonElevation,
            ),
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppConstants.primaryPurple,
                      ),
                    ),
                  )
                : const Text('В корзину'),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsButton(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: isLoading ? null : onShowDetails,
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.primary,
        ),
        child: const Text('Подробнее'),
      ),
    );
  }
}

