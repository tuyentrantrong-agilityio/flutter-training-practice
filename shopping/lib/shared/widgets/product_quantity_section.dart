import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProductQuantitySection extends HookWidget {
  final int quantity;
  final int inventoryQuantity;
  const ProductQuantitySection({
    super.key,
    this.quantity = 1,
    required this.inventoryQuantity,
  });

  @override
  Widget build(BuildContext context) {
    final _quantity = useState(quantity);

    return Row(
      children: [
        QuantityButton(
          icon: Icons.add,
          onPressed: () =>
              _quantity.value >= inventoryQuantity ? null : _quantity.value++,
        ),
        const SizedBox(width: 10),
        Text(
          '${_quantity.value}',
          style: const TextStyle(
            color: Color(0xFF232323),
            fontSize: 18,
            fontFamily: 'Nunito Sans',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.90,
          ),
        ),
        const SizedBox(width: 10),
        QuantityButton(
          icon: Icons.remove,
          onPressed: () => _quantity.value <= 1 ? null : _quantity.value--,
        ),
      ],
    );
  }
}

class QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const QuantityButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.40,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: const Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(6),
        ),
        child: IconButton(
          icon: Icon(icon, color: const Color(0xFF232323)),
          iconSize: 18,
          padding: EdgeInsets.zero,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
