<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    public function index()
    {
        return response()->json(
            Order::with('items.product')->latest()->get()
        );
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'address' => ['required', 'string'],
            'phone' => ['required', 'string'],
            'payment_method' => ['required', 'string'],
            'total' => ['required', 'numeric'],
            'items' => ['required', 'array', 'min:1'],
            'items.*.product_id' => ['required', 'integer', 'exists:products,id'],
            'items.*.quantity' => ['required', 'integer', 'min:1'],
            'items.*.price' => ['required', 'numeric'],
        ]);

        $order = DB::transaction(function () use ($validated) {
            $order = Order::create([
                'user_id' => null,
                'address' => $validated['address'],
                'phone' => $validated['phone'],
                'payment_method' => $validated['payment_method'],
                'total' => $validated['total'],
            ]);

            foreach ($validated['items'] as $item) {
                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $item['product_id'],
                    'quantity' => $item['quantity'],
                    'price' => $item['price'],
                ]);
            }

            return $order->load('items.product');
        });

        return response()->json([
            'message' => 'Order created successfully',
            'order' => $order,
        ], 201);
    }
}