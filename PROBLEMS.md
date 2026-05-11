1) Tek Sorumluluk(SRP) ihlali : NotificationManager sınıfı hem e-mail gönderme hemde sms gönderme işlemi yapıyor ve bu tek sorumluluk ilkesine aykırı.
2) Genişletilebilirlik(OCP) Sorunu : Yeni bir bildirim türü eklenmesi için mevcut kodun değiştirilmesi ve if-else bloklarının sayısının artırılması gerekiyor. bu da Açık-Kapalı ilkesine aykırı.
3) Tip ve Veri Uyumu Denetimi Eksikliği : Bildirm tipinin belirlenmesi için "E-mail", "SMS" gibi sabit stringler kullanılıyor ancak olası bir büyük-küçük harf uyumsuzluğunda sistem hata verir.
4) Bakım ve Denetim zorluğu : Kod çok fazla if-else yapısı içerdiği için ilerleyen zamanlarda bakımı ve kod okunabilirliği çok karmaşık ve zor olur.
5) Test Zorluğu : Tüm bildirim sistemleri tek bir fonksiyonun içinde olduğu için bunları ayırıp test etmek imkansız.
