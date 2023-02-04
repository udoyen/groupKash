import 'group_member_model.dart';

class GroupData {
  String id;
  String name;
  bool isOwner;
  List<dynamic> members;

  GroupData({
    required this.id,
    required this.name,
    required this.isOwner,
    required this.members,
  });
}
