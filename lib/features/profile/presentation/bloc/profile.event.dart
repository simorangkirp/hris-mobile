abstract class ProfileEvent {
  const ProfileEvent();
}

class InitProfileScreen extends ProfileEvent {}

class GetProfileInfoProfileScreen extends ProfileEvent {}

class GetAbsentInfo extends ProfileEvent {
  String period;
  GetAbsentInfo(this.period);
}

class ProfileScrnGetActPeriod extends ProfileEvent{
  String lokasiTugas;
  String date;
  ProfileScrnGetActPeriod(this.lokasiTugas, this.date);
}
