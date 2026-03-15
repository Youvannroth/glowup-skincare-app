<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;
use App\Models\Category;

class ProductSeeder extends Seeder
{
    public function run(): void
    {
        $cleanser = Category::where('name', 'Cleanser')->first();
        $serum = Category::where('name', 'Serum')->first();
        $moisturizer = Category::where('name', 'Moisturizer')->first();
        $sunscreen = Category::where('name', 'Sunscreen')->first();

        $products = [
            // CLEANSER
            [
                'category_id' => $cleanser->id,
                'name' => 'Green Plum',
                'description' => 'Brightening cleanser with water to gently remove impurities',
                'price' => 13.00,
                'image' => 'green_plum.png',
                'skin_type' => 'All Skin Type',
                'key_ingredients' => 'Water',
            ],
            [
                'category_id' => $cleanser->id,
                'name' => 'Rice Water Bright',
                'description' => 'Brightening cleanser with rice water to gently remove impurities',
                'price' => 5.87,
                'image' => 'rice_water.png',
                'skin_type' => 'All Skin Type',
                'key_ingredients' => 'Rice Water',
            ],
            [
                'category_id' => $cleanser->id,
                'name' => 'Skin1004 Cleanser',
                'description' => 'Gentle foam cleanser for daily skin refresh',
                'price' => 11.20,
                'image' => 'skin1004_cleanser.png',
                'skin_type' => 'All Skin Type',
                'key_ingredients' => 'Centella',
            ],
            [
                'category_id' => $cleanser->id,
                'name' => 'COSRX Cleanser',
                'description' => 'Low pH cleanser for soft and balanced skin',
                'price' => 18.00,
                'image' => 'cosrx_cleanser.png',
                'skin_type' => 'All Skin Type',
                'key_ingredients' => 'Tea Tree',
            ],

            // SERUM
            [
                'category_id' => $serum->id,
                'name' => 'ANUA Serum',
                'description' => 'Soothing serum with gentle hydration',
                'price' => 16.00,
                'image' => 'anua_serum.png',
                'skin_type' => 'All Skin Type',
                'key_ingredients' => 'Heartleaf',
            ],
            [
                'category_id' => $serum->id,
                'name' => 'Torriden Serum',
                'description' => 'Hydrating serum for smooth and soft skin',
                'price' => 12.00,
                'image' => 'torriden_serum.png',
                'skin_type' => 'All Skin Type',
                'key_ingredients' => 'Hyaluronic Acid',
            ],
            [
                'category_id' => $serum->id,
                'name' => 'Klairs Serum',
                'description' => 'Brightening serum for an even skin tone',
                'price' => 13.00,
                'image' => 'klairs_serum.png',
                'skin_type' => 'All Skin Type',
                'key_ingredients' => 'Vitamin C',
            ],

            // MOISTURIZER
            [
                'category_id' => $moisturizer->id,
                'name' => 'Laneige',
                'description' => 'Soft moisturizing care for glowing skin',
                'price' => 18.00,
                'image' => 'laneige_moisturizer.png',
                'skin_type' => 'All Skin Type',
                'key_ingredients' => 'Water',
            ],
            [
                'category_id' => $moisturizer->id,
                'name' => 'Belif',
                'description' => 'Long-lasting hydration and comfort',
                'price' => 12.00,
                'image' => 'belif_moisturizer.png',
                'skin_type' => 'All Skin Type',
                'key_ingredients' => 'Herbal Extract',
            ],
            [
                'category_id' => $moisturizer->id,
                'name' => 'Illiyoon',
                'description' => 'Barrier care cream for dry skin',
                'price' => 14.00,
                'image' => 'illiyoon_moisturizer.png',
                'skin_type' => 'Dry Skin',
                'key_ingredients' => 'Ceramide',
            ],

            // SUNSCREEN
            [
                'category_id' => $sunscreen->id,
                'name' => 'Biore',
                'description' => 'Light sunscreen with strong UV protection',
                'price' => 12.00,
                'image' => 'biore_sunscreen.png',
                'skin_type' => 'All Skin Type',
                'key_ingredients' => 'UV Filters',
            ],
            [
                'category_id' => $sunscreen->id,
                'name' => 'Anessa',
                'description' => 'Durable UV protection for outdoor use',
                'price' => 13.50,
                'image' => 'anessa_sunscreen.png',
                'skin_type' => 'All Skin Type',
                'key_ingredients' => 'UV Filters',
            ],
            [
                'category_id' => $sunscreen->id,
                'name' => 'Skin Aqua',
                'description' => 'Watery sunscreen with lightweight texture',
                'price' => 15.00,
                'image' => 'skin_aqua_sunscreen.png',
                'skin_type' => 'All Skin Type',
                'key_ingredients' => 'Water',
            ],
        ];

        foreach ($products as $product) {
            Product::updateOrCreate(
                ['name' => $product['name']],
                $product
            );
        }
    }
}