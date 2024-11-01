import 'package:equatable/equatable.dart';

abstract class PhotoApiEvent extends Equatable{

  @override
  List<Object> get props=>[];
}

class PhotoFetch extends PhotoApiEvent{}