import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_cubit.dart';
import '../../bloc/cart/cart_cubit.dart';
import '../../bloc/cart/cart_state.dart';
import '../../bloc/order/order_cubit.dart';
import '../../models/cart_item.dart';
import '../auth/login_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<void> _handlePay(BuildContext context) async {
    final cartCubit = context.read<CartCubit>();
    final cartState = cartCubit.state;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final authCubit = context.read<AuthCubit>();
    final orderCubit = context.read<OrderCubit>();

    if (cartState.items.isEmpty) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Your cart is empty.')),
      );
      return;
    }

    var user = authCubit.state.user;
    if (user == null) {
      final didLogin = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login'),
            content: const Text('Please login to complete checkout.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Login'),
              ),
            ],
          );
        },
      );

      if (didLogin != true) return;
      await navigator.push(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
      if (!mounted) return;
      user = authCubit.state.user;
      if (user == null) {
        return;
      }
    }

    orderCubit.addOrder(cartState.items);
    cartCubit.clearCart();

    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(
          'Order placed for ${user.name}. Total: \$${cartState.totalPrice.toStringAsFixed(2)}',
        ),
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, CartItem item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${(double.tryParse(item.product.price) ?? 0.0).toStringAsFixed(2)}',
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => context.read<CartCubit>().updateQuantity(
                        item.product,
                        item.quantity - 1,
                      ),
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text(item.quantity.toString()),
                    IconButton(
                      onPressed: () => context.read<CartCubit>().updateQuantity(
                        item.product,
                        item.quantity + 1,
                      ),
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () =>
                      context.read<CartCubit>().removeProduct(item.product),
                  child: const Text('Remove'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthCubit>().state.user;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF6EF),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              'My Cart',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            if (user == null)
              const Text(
                'Login or sign up to complete payment.',
                style: TextStyle(color: Colors.black54),
              ),
            if (user != null)
              Text(
                'Signed in as ${user.name}',
                style: const TextStyle(color: Colors.black54),
              ),
            const SizedBox(height: 18),
            Expanded(
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state.items.isEmpty) {
                    return const Center(child: Text('Your cart is empty.'));
                  }
                  return ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      return _buildCartItem(context, state.items[index]);
                    },
                  );
                },
              ),
            ),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Total: \$${state.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _handlePay(context),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Pay Now',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
