import 'package:flutter/material.dart';
import '../../data/services/order_api_service.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  List orders = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadOrders();
  }

  Future<void> loadOrders() async {
    try {
      final data = await OrderApiService().getOrders();

      setState(() {
        orders = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget buildOrderCard(order) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order #${order['id']}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "Total: \$${order['total']}",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "Payment: ${order['payment_method']}",
            style: const TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 6),

          Text(
            "Address: ${order['address']}",
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      appBar: AppBar(
        title: const Text("Order History"),
        backgroundColor: const Color(0xFFE97F7F),
      ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())

          : orders.isEmpty
              ? const Center(
                  child: Text(
                    "No orders yet",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )

              : ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: orders.length,
                  itemBuilder: (context, index) {

                    final order = orders[index];

                    return buildOrderCard(order);
                  },
                ),
    );
  }
}