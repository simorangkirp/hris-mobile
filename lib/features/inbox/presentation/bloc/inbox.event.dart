abstract class InboxEvent{
  const InboxEvent();
}

class InitInboxScreen extends InboxEvent{}

class InboxScrnGetListNotif extends InboxEvent{}

class InboxScrnGetApprvlData extends InboxEvent{}