import 'package:flutter/material.dart';

import '../models/cart.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> cartItems = <Cart>[
    Cart(
        id: 1,
        productName: 'T-shirt',
        price: 5,
        total: 5,
        count: 1,
        image: 'images/prod4.jpg'),
    Cart(
        id: 2,
        productName: 'Dresses',
        price: 10,
        total: 10,
        count: 1,
        image: 'images/prod1.jpg'),
    Cart(
        id: 3,
        productName: 'Skirt',
        price: 15,
        total: 30,
        count: 2,
        image: 'images/prod2.webp'),
  ];

  // // List<Product> products = <Product>[];
  //
  // final CartDbController _dbController = CartDbController();
  // final ProductsDbController _productDbController = ProductsDbController();
  //
  double total = 0;
  double quantity = 0;
//
// Future<ProcessResponse> create(Cart cart) async {
//   int index =
//       cartItems.indexWhere((element) => element.productId == cart.productId);
//   if (index == -1) {
//     int newRowId = await _dbController.create(cart);
//     if (newRowId != 0) {
//       total += cart.total;
//       quantity += 1;
//       cart.id = newRowId;
//       cartItems.add(cart);
//       notifyListeners();
//     }
//     return getResponse(newRowId != 0);
//   } else {
//     // int quantity = await _productDbController.getQuantity(cart.productId);
//     int newCount = cartItems[index].count + 1;
//     return changeQuantity(index, newCount);
//   }
// }
//
// void read() async {
//   cartItems = await _dbController.read();
//   for (Cart cart in cartItems) {
//     total += cart.total;
//     quantity += cart.count;
//   }
//   notifyListeners();
// }
//
// Future<ProcessResponse> changeQuantity(int index, int count) async {
//   bool isDelete = count == 0;
//   Cart cart = cartItems[index];
//   bool result = isDelete
//       ? await _dbController.delete(cart.id)
//       : await _dbController.update(cart);
//
//   if (result) {
//     if (isDelete) {
//       total -= cart.total;
//       quantity -= 1;
//       cartItems.removeAt(index);
//     } else {
//       cart.count = count;
//       cart.total = cart.price * cart.count;
//       total += cart.total;
//       quantity += 1;
//       cartItems[index] = cart;
//     }
//     notifyListeners();
//   }
//
//   return getResponse(result);
// }
//
// Future<ProcessResponse> clear() async {
//   bool cleared = await _dbController.clear();
//   if (cleared) {
//     total = 0;
//     quantity = 0;
//     cartItems.clear();
//     notifyListeners();
//   }
//   return getResponse(cleared);
// }
//
// ProcessResponse getResponse(bool success) {
//   return ProcessResponse(
//     message:
//         success ? 'Operation completed successfully' : 'Operation failed!',
//     success: success,
//   );
// }
}
