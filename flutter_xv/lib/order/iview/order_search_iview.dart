import 'package:flutter_xv/mvp/mvps.dart';
import 'package:flutter_xv/order/models/search_entity.dart';
import 'package:flutter_xv/order/provider/base_list_provider.dart';

abstract class OrderSearchIMvpView implements IMvpView {

  BaseListProvider<SearchItems> get provider;
}
