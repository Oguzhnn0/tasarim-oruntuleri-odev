abstract class Notification {
  void send(String mesaj, String alici);
}

class EmailNotification implements Notification {
  @override
  void send(String mesaj, String alici) {
    print("E-mail $alici kişisine gönderiliyor");
  }
}

class SmsNotification implements Notification {
  @override
  void send(String mesaj, String alici) {
    print("SMS $alici kişisine gönderiliyor");
  }
}

class NotificationFactory {
  static Notification createNotification(String tip) {
    if (tip == "E-mail") {
      return EmailNotification();
    } else if (tip == "SMS") {
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
  final ForeignSmsService _ForeignService = ForeignSmsService();

  @override
  void send(String mesaj, String alici) {
    _ForeignService.smsGonder(alici, mesaj);
  }
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
    print("Zaman Eki Eklendi");
    super.send(zamanliMesaj, alici);
  }
}

void main() {

  Notification normalSms = NotificationFactory.createNotification("SMS");
  normalSms.send("SMS Deneme mesajı!", "0555 555 55 55");

  Notification ForeignSms = ForeignServiceAdapter();
  ForeignSms.send("Foreign deneme mesajı!", "0555 555 55 55");

  Notification email = NotificationFactory.createNotification("E-mail");
  Notification decoratedEmail = TimestampDecorator(email);
  
  decoratedEmail.send("E-mail deneme mesajı!", "ogz@example.com");
}
