abstract class Notification{
  void sendNotification(String mesaj, String alici);
}

class EmailNotification extends Notification{
  @override
  void sendNotification(String mesaj, String alici) {
    print("E-mail $alici kişisine gönderildi.");
  }
}

class SmsNotification extends Notification{
  @override
  void sendNotification(String mesaj, String alici) {
    print("SMS $alici kişisine gönderildi.");
  }
}

class NotificationFactoryMethod {
  static Notification createNotification(String type) {
    if (type == "E-mail") {
      return EmailNotification();
    } else if (type == "SMS") {
      return SmsNotification();
    }
    throw Exception("Bilinmeyen tip!!!");
  }
}

void main() {
  
  var email = NotificationFactoryMethod.createNotification("E-mail");
  email.sendNotification("E-mail deneme mesajı", "ogz@example.com");

  var sms = NotificationFactoryMethod.createNotification("SMS");
  sms.sendNotification("SMS deneme mesajı", "555 555");
}
