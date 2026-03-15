<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;

class ProductController extends Controller
{
    private function transformProduct($product)
    {
        return [
            'id' => $product->id,
            'category_id' => $product->category_id,
            'name' => $product->name,
            'description' => $product->description,
            'price' => $product->price,
            'image' => $product->image
                ? str_replace('127.0.0.1', '10.0.2.2', url('storage/products/' . $product->image))
                : null,
            'skin_type' => $product->skin_type,
            'key_ingredients' => $product->key_ingredients,
            'category' => [
                'id' => $product->category?->id,
                'name' => $product->category?->name,
            ],
        ];
    }

    public function index()
    {
        $products = Product::with('category')->get();

        return response()->json(
            $products->map(fn($product) => $this->transformProduct($product))
        );
    }

    public function byCategory($name)
    {
        $products = Product::with('category')
            ->whereHas('category', function ($query) use ($name) {
                $query->where('name', $name);
            })
            ->get();

        return response()->json(
            $products->map(fn($product) => $this->transformProduct($product))
        );
    }
}