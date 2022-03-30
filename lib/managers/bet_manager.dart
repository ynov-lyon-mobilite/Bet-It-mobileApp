import 'package:bet_it/model/bet.dart';
import 'package:bet_it/model/instance_manager.dart';
import 'package:bet_it/utils/debug_logger.dart';

class BetManager {
  static Future<bool> checkBetNotInDB(Bet bet) async {
    final collec = InstanceManager.getDatabaseInstance().collection("bets");
    final userDoc = InstanceManager.getDatabaseInstance()
        .collection('users')
        .doc(InstanceManager.getAuthInstance().currentUser!.uid);

    final whereResult = await collec
        .where(
          'ownerid',
          isEqualTo: userDoc,
        )
        .where(
          'matchid',
          isEqualTo: bet.match.id,
        )
        .get();

    return whereResult.docs.isEmpty;
  }
}
