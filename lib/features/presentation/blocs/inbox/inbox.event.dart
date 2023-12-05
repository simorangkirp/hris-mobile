abstract class InboxEvent {
  const InboxEvent();
}

class InitInboxScreen extends InboxEvent {}

class InboxScrnGetListNotif extends InboxEvent {}

class InboxScrnGetApprvlData extends InboxEvent {}

class InboxScrnGetInvalidVersion extends InboxEvent {
  String msg;
  InboxScrnGetInvalidVersion(this.msg);
}
