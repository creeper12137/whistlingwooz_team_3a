import 'package:whistlingwoodz/models/user.dart';
import 'package:whistlingwoodz/interface/admin_interface.dart';

class Manager extends User implements AdminInterface {
  Manager(int uid, String fullName, String password, String email,
      String phoneNo, String gender, DateTime birth)
      : super(uid, fullName, password, email, phoneNo, gender, birth);

  @override
  void checkInquiry() {}
  @override
  void replyInquiry() {}
  @override
  void deleteInquiry() {}
  @override
  void changeInquiryStatus() {}
  @override
  void changeLoginInfo() {}
}
