class NotificationManager {
  
  void sendNotification (String tip, String mesaj, String alici){

    if (tip == "E-mail"){
      print("E-mail $alici kişisine gönderiliyor...");
    }else if (tip == "SMS"){
      print("SMS $alici kişisine gönderiliyor...");
    }else{
      print("Bilinmeyen tip!!!");
    }

  }
}

void main(){

  var notification = NotificationManager();

  notification.sendNotification("E-mail", "deneme 1 2 3", "ogz@example.com");
  notification.sendNotification("SMS", "deneme 1 2 3", " 555 555 55 55");
}
