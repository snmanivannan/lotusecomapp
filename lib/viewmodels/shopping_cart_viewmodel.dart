import 'package:lotus_trading_company_sivakasi/app/app.router.dart';
import 'package:lotus_trading_company_sivakasi/models/product_model.dart';
import 'package:lotus_trading_company_sivakasi/services/cart_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/locator.dart';

class ShoppingCartViewModel extends BaseViewModel {
  final _cartService = locator<CartService>();
  final _navigator = locator<NavigationService>();

  List<Product> get cart => _cartService.cart;

  double get totalCost => shippingCharges + subTotal;

  double _shippingCharges = 1.6;
  double get shippingCharges => _shippingCharges;

  double get subTotal {
    double total = 0.0;
    try {
      for (Product item in cart) {
        total += (item.price! * item.qty!);
      }
      return total;
    } catch (e) {
      return 0.0;
    }
  }

  int get subTotalQty{
    int total = 0;
    try {
      for (Product item in cart) {
        total += item.qty!;
      }
      return total;
    } catch (e) {
      return 0;
    }
  }

  int productQuantity(Product product) {
    return _cartService.getQuantityFromProduct(product);
  }

  void addToCart(Product product) {
    _cartService.addProduct(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartService.removeProduct(product);
    notifyListeners();
  }

  void deleteFromCart(Product product) {
    _cartService.deleteProduct(product);
    notifyListeners();
  }

  void moveToCheckout() {
    _navigator.navigateTo(Routes.checkoutView);
  }

  String orderText() {
    return cart.toString();
  }

}
