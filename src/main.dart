abstract class Notification {
  void send(String mesaj, String alici);
}

class EmailNotification implements Notification {
  @override
  void send(String mesaj, String alici) {
    print("E-mail $alici kişisine gönderiliyor...");
  }
}

class SmsNotification implements Notification {
  @override
  void send(String mesaj, String alici) {
    print("SMS $alici kişisine gönderiliyor...");
  }
}

class NotificationFactory {
  static Notification createNotification(String tip) {
    if (tip == "E-mail"){
      return EmailNotification();
    }else if (tip == "SMS"){
      return SmsNotification();
    } 
    throw Exception("Bilinmeyen tip!!!");
  }
}

class ForeignSmsService {
  void smsGonder(String numara, String icerik) {
    print("$numara nolu kişiye özel SMS gönderildi");
  }
}

class ForeignServiceAdapter implements Notification {
  final ForeignSmsService _foreignService = ForeignSmsService();
  
  @override
  void send(String mesaj, String alici) => _foreignService.smsGonder(alici, mesaj);
}

abstract class NotificationDecorator implements Notification {
  final Notification decoratedNotification;

  NotificationDecorator(this.decoratedNotification);
  
  @override
  void send(String mesaj, String alici) {
    decoratedNotification.send(mesaj, alici);
  }
}

class TimestampDecorator extends NotificationDecorator {
  TimestampDecorator(Notification notification) : super(notification);
 
  @override
  void send(String mesaj, String alici) {
    var simdi = DateTime.now();
    String zamanliMesaj = "[$simdi]: $mesaj";
    super.send(zamanliMesaj, alici);
  }
}

abstract class NotificationObserver {
  void update(String mesaj, String alici);
}

class LoggerObserver implements NotificationObserver {
  @override
  void update(String mesaj, String alici) {
    print("LOG: $alici kişisine mesaj gönderildi.");
  }
}

class AnalyticsObserver implements NotificationObserver {
  @override
  void update(String mesaj, String alici) {
    print("ANALYTICS: Mesaj trafiği istatistiklere eklendi.");
  }
}

class NotificationManager {
  final List<NotificationObserver> _observers = [];

  void subscribe(NotificationObserver observer) => _observers.add(observer);

  void notifyAll(String mesaj, String alici) {
    for (var observer in _observers) {
      observer.update(mesaj, alici);
    }
  }
}
abstract class Handler {
  Handler? next;
  void handle(String mesaj, String alici, Notification notification, NotificationManager manager);
}
class EmptyMessageValidator extends Handler {
  @override
  void handle(String mesaj, String alici, Notification notification, NotificationManager manager) {
    if (mesaj.isEmpty) {
      print("HATA: Boş mesaj gönderilemez!!!");
      return;
    }
    next?.handle(mesaj, alici, notification, manager);
  }
}

class SpamValidator extends Handler {
  @override
  void handle(String mesaj, String alici, Notification notification, NotificationManager manager) {
    if (mesaj.contains("BEDAVA")) {
      print("SPAM UYARISI: Spam içerik tespit edildi, gönderim iptal!!!");
      return;
    }
    next?.handle(mesaj, alici, notification, manager);
  }
}

class SendHandler extends Handler {
  @override
  void handle(String mesaj, String alici, Notification notification, NotificationManager manager) {
    notification.send(mesaj, alici);
    manager.notifyAll(mesaj, alici);
  }
}
void main() {
  var manager = NotificationManager();
  manager.subscribe(LoggerObserver());
  manager.subscribe(AnalyticsObserver());

  var validator = EmptyMessageValidator();
  var spamCheck = SpamValidator();
  var sender = SendHandler();

  validator.next = spamCheck;
  spamCheck.next = sender;

  Notification email = TimestampDecorator(NotificationFactory.createNotification("E-mail"));
  validator.handle("E-mail deneme mesajı!", "ogz@example.com", email, manager);

  Notification sms = NotificationFactory.createNotification("SMS");
  validator.handle("Spam deneme mesajı : BEDAVA", "0555 555 55 55", sms, manager);

  Notification foreignSms = ForeignServiceAdapter();
  validator.handle("Sms Deneme Mesajı!", "0555 555 55 55", foreignSms, manager);
}
