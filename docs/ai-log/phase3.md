Yapay Zekaya Sorduğum Soru:
Sistemimi daha optimize ve yönetilebilir hale getirecek en az 2 adet Behavioral Pattern öner.

Yapay zekanın cevabı:
Büyük çaplı uygulamalarda bildirimin sadece gönderilmesi yetmez. Bildirimin sonuçlarının takip edilmesi ve 
belirli bir hiyerarşide denetlenmesi gerekir. Bu yüzden şu 2 Patterni sana önerebilirim :

1)Observer Pattern
Gerçek bir uygulamada bir bildirim gönderildiğinde sistemin diğer parçalarının bundan haberi olması gerekir.
Örneğin bildirim gnderildiği zaman veri tabanı kaydı yapılması veya loglama işleminin yapılması gibi.
  Neden Kullanmalısın?:
    1)Bildirim gönderen sınıfın diğer işlemleri yapan sınıftan haberdar olması gerekmez. Bu da gevşek bağlılık sağlar.
    2)Çalışma sırasında sisteme yeni dinleyiciler ekleyip çıkarabilirsin. Bu da dinamik takip sağlar.

2)Chain of Responsibility Pattern
Kullanıcıya ulaşmak için farklı öncelikler olabilir. Örneğin önce "Push Notification" göndermeyi dene olmazsa "SMS" göndermeyi dene vb. Bu yüzden
Chain of Responsibility Pattern kullanmanı tavsiye ederim.
  Neden Kullanmalısın?:
    1)Bildirim gönderimindeki olası başarısızlıkları ve hataları belirli bir hiyerarşi ile kontrol etmeni sağlar.
    2)Karmaşık if-else veya try-catch bloklarının karmaşasından kurtularak bunları zincirleme bir yapıya dönüştürmeni sağlar.

Ben ne yaptım:
Öncelikle Chain of Responsibility Pattern kullanarak bildirim gönderimi sırasında oluşabilecek olasu hataları hiyerarşik bir sıra ile yakalamaya çalıştım.
Bu sayede kontroller belirli bir sırayla yapılacak ve eğer bir basamakta hata tespit edilirse siste otomatik olarak duracak. Sonrasında ise Observer Pattern
kullanarak sistem için gerekli gözlemcileri oluşturdum ve bildirim gönderildiğinde yapılacak loglama ve analiz kayıt işlemlerinin gönderici sınıftan ayrı şekilde
bildirimi takip etmesini ve bildirim gönderildiği anda çalışmalarını sağladım.

----------------------------
Pair Programming notları:

Bu süreçte yapay zeka ile hangi patternleri kullanmam gerektiğini konuştuk. Bunları nasıl uygulamam gerektiği konusunda briaz takılınca yapay zekadan destek aldım.
Kodumda yer yer meydana gelen parametre veya syntax hatalarını çözmekte yapay zekadan destek aldım. Kodlama kısmı bittikten sonra ufak bir "daha iyi olabilir mi?",
"daha okunaklı olabilir mi?" tartışması yaptık ve neticesinde kod son şeklini aldı.
