Benim bulduğum bazı eksiklikler ve hatalar :
1) Tek Sorumluluk(SRP) ihlali : NotificationManager sınıfı hem e-mail gönderme hemde sms gönderme işlemi yapıyor ve bu tek sorumluluk ilkesine aykırı.
2) Genişletilebilirlik(OCP) Sorunu : Yeni bir bildirim türü eklenmesi için mevcut kodun değiştirilmesi ve if-else bloklarının sayısının artırılması gerekiyor. bu da Açık-Kapalı ilkesine aykırı.
3) Tip ve Veri Uyumu Denetimi Eksikliği : Bildirm tipinin belirlenmesi için "E-mail", "SMS" gibi sabit stringler kullanılıyor ancak olası bir büyük-küçük harf uyumsuzluğunda sistem hata verir.
4) Bakım ve Denetim zorluğu : Kod çok fazla if-else yapısı içerdiği için ilerleyen zamanlarda bakımı ve kod okunabilirliği çok karmaşık ve zor olur.
5) Test Zorluğu : Tüm bildirim sistemleri tek bir fonksiyonun içinde olduğu için bunları ayırıp test etmek imkansız.

Yapay zeka kullanarak bulduğum hatalar : 
  
  Sorduğum Soru : Bu kodda hangi tasarım desenlerinin eksikliklerini görüyorsun? bunların çözümü için hangi desenleri kullanmamı önerirsin?
  
  Yapay Zekanın Cevabı: Bu kod tipik bir katı kodlama ve yüksek bağımlılık örneği. Bu kodda SOLID prensiplerinden Tek sorumluluk ilkesi ve Açık-kapalı ilkesinin ihlalini veya eksikliğini görüyorum. Çözüm olarak Strategy Pattern ve Dependency Inversion öneririm. Strategy Pattern sayesinde hem if-else kalabalığından kurtulursun hemde yeni bir bildirim türü eklemek istediğinde sınıfına dokunmana gerek kalmaz. Dependency Inversion sayesinde ise kodun doğrudan somut sınıflara değil, soyutlamalara bağlı olasını sağlayabilirsin.

Sonuç olarak hem kendi analizimde hemde yapay zeka analizinde SRP ve OCP ihlalleri ortak başlıklar olarak görünüyor. Yapay zeka burada Strategy Pattern kullanımını tavsiye ederek benimle aynı şekilde düşünürken Dependency Inversion önerisi ile bana ekstra çözümler sunuyor
