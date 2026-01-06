import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/product_card_view_model.dart';
import '../models/product.dart';
import '../models/product_details.dart';
import '../constants/app_constants.dart';
import 'product_image_section.dart';
import 'product_info_section.dart';
import 'product_actions_section.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  void _showImageDialog(BuildContext context, List<String> imageUrls) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Image.network(
            imageUrls.isNotEmpty ? imageUrls.first : '',
            fit: BoxFit.contain,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Закрыть'),
            ),
          ],
        );
      },
    );
  }

  void _showDetailsDialog(BuildContext context, Product product) {
    final productDetails = ProductDetails(product);
    final detailedDescription = productDetails.fullDescription;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  // Ручка для перетаскивания
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  // Заголовок
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: AppConstants.titleFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  // Контент с прокруткой
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        detailedDescription,
                        style: const TextStyle(
                          fontSize: AppConstants.descriptionFontSize,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductCardViewModel>(
      builder: (context, viewModel, child) {
        final product = viewModel.product;

        return InkWell(
          onTap: () {
            // Эффект ripple при нажатии на карточку
          },
          borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: AppConstants.maxCardWidth),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImageSection(
                  product: product,
                  isFavorite: viewModel.isFavorite,
                  onFavoriteTap: viewModel.toggleFavorite,
                  onImageTap: () => _showImageDialog(context, product.imageUrls),
                ),
                ProductInfoSection(product: product),
                ProductActionsSection(
                  product: product,
                  quantity: viewModel.quantity,
                  totalPrice: viewModel.totalPrice,
                  totalOldPrice: viewModel.totalOldPrice,
                  onIncrement: viewModel.incrementQuantity,
                  onDecrement: viewModel.decrementQuantity,
                  onAddToCart: () async {
                    final message = await viewModel.addToCart();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                          duration: const Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  onShowDetails: () => _showDetailsDialog(context, product),
                  isLoading: viewModel.isLoading,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

