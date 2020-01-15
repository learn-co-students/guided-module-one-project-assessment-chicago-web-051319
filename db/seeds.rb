require_relative "../lib/models/rice.rb"
require_relative "../lib/models/filling.rb"
require_relative "../lib/models/order.rb"

Rice.create(name: "Jasmine rice", price: 6)
Rice.create(name: "Wild rice", price: 8)
Rice.create(name: "Black rice", price: 9)
Rice.create(name: "White rice", price: 10)
Rice.create(name: "Brown rice", price: 10)
Rice.create(name: "Seasoned rice", price: 12)

Filling.create(name: "Tuna", price: 10)
Filling.create(name: "Salmon", price: 10)
Filling.create(name: "Plum", price: 8)
Filling.create(name: "Okaka", price: 8)
Filling.create(name: "Tarako", price: 12)
Filling.create(name: "Konbu", price: 7)
Filling.create(name: "Beef", price: 14)
Filling.create(name: "Shrimp Mayonnaise", price: 10)



Order.create(name: "Yuta's favorite", rice_id: 4, filling_id: 2, total_price: 20, user_name: "Yuta")
Order.create(name: "Taro's favorite", rice_id: 5, filling_id: 3, total_price: 18, user_name: "Taro")
Order.create(name: "Most popular", rice_id: 6, filling_id: 5, total_price: 24, user_name: "Jiro")
Order.create(name: "Trendy menu", rice_id: 3, filling_id: 8, total_price: 19, user_name: "Tom")
Order.create(name: "Discover new taste", rice_id: 2, filling_id: 7, total_price: 22, user_name: "Tony")


