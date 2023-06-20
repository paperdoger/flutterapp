import 'package:flutter_xv/mvp/mvps.dart';
import 'package:flutter_xv/shop/models/user_entity.dart';

abstract class ShopIMvpView implements IMvpView {

  void setUser(UserEntity? user);
  
  bool get isAccessibilityTest;
}
