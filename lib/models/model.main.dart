import 'package:scoped_model/scoped_model.dart';
import 'package:ussd4noobs/models/model.conected.dart';

class MainModel extends Model
    with ConectedModel, SaldosModel, BonosModel, VozModel, SmsModel {}
