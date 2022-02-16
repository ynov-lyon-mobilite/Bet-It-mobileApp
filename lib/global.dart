library global;

import 'package:bet_it/managers/bet_manager.dart';
import 'package:bet_it/model/cart.dart';
import 'package:bet_it/model/user.dart';

late User currentUser;
Cart cart = Cart();
var betManager = BetManager();