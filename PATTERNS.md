Faz1 Dökümantasyonu
-------------------
1)Factory Method
Nerede Kullandım :
Factory method yapısını bildirim nesnelerinin oluşturulduğu kısımda kullandım. NotificationFactoryMethod isminde bir sınıf oluşturdum ve nesne oluşturma süreçlerini main sınıfınfan alarak bu yeni oluşturduğum sınıfa koymuş oldum.

Neden Kullandım :
Factory Method kullanmadan önce tüm bildirimlerim aynı sınıfın içerisindeydi ve uzayan bir if-else yapısı vardı. Bu uzayan if-else yapısı hem SRP vemde OCP'yi ihlal ediyordu. Bende nesne üretimini tek bir yerde toplamak ve main sınıfının bağımlılığını azaltmak için Factory Method kullandım.

Ne Kazandım :
Factory Method kullanarak kodumda kazandığım gelişmelerden ilki esneklik ve genişletilebilirlik. Önceden kodumu büyütmek ve yeni bildirim çeşitleri eklemek istediğimde mevcut sınıfımın kodlarını güncellemem gerekiyordu ama şimdi mevcut sınıfa dokunmadan sadece yeni bir sınıf oluşturarak yeni bildirim çeşitleri ekleyebiliyorum. İkinci kazanım olarak artık daha temiz bir koda sahibim. Eski kodda uzayan if-else yapıları varken kodun yeni hali daha okunabilir bir halde. Üçüncü olarak ise artık bakımı ve okunabilirliği daha kolay bir kodum oldu. İleride yapılacak her türlü bakım ve geliştirme artık daha kolay hale geldi.

Faz2 Dökümantasyonu
-------------------
1)Adapter Pattern
Nerede Kullandım :
ForeignSmsService isimli dış servisimi Notification arayüzüme uydurabilmek için ForeignServiceAdapter isimli sınıfında kullandım.

Neden Kullandım :
Dış servisimin kullandığı metodlar (smsGonder) benim orijinal sistemimin kullandığı metodlar ile (send) uyumsuzdu. Kodu değiştirmeden entegrasyon sağlayabilmek için bu yolu tercih ettim.

Ne Kazandım :
Sistemime dış servisler bağlamak istediğimde ve uyumsuzluklar olduğunda bunları kendi sistem kodlarıma dokunmadan düzeltebilme ve birbirine uydurabilme esnekliği kazandım.

2)Decorator Pattern
Nerede Kullandım :
Bildirimlere zaman eki eklemek ve onların daha profesyonel görünmesini sağlamak için için TimestampDecorator sınıfını oluşturdum ve bildirimlerimi dekore ettim.

Neden Kullandım :
Sistemimdeki mevcut sınıflarına (sms ve e-mail) dokunmadan, onlara dışarıdan müdahale ederek yeni bir özellik (zaman eki) eklemek için bu sistemi uygun gördüm ve bunu kullandım.

Ne Kazandım :
Sistemimdeki sınıflara(sms ve e-mail) ileride yeni özellikler eklemek istersem bu özellikleri sınıfların iç kodlarına dokunmadan dışarıdan ekleyebilme esnekliği kazandım.

Faz3 Dökümantasyonu
-------------------
1)Chain of Responsibility
Nerede Kullandım :
Mesajın gönderimden önceki tüm kontrol süreçlerinde kullandım. EmptyMessageValidator, SpamValidator ve en son SendHandler sınıflarını birbirine bağladım. Bu sayede sorumluluk zincirini olabildiğince sağlam kurgulamayı amaçladım.

Neden Kullandım :
Bu patterni kullanmasam bütün bu kontrolleri if-else bloklarıyla yapmam gerekecekti. Bu gereksiz kod karmaşasına ve yönetimi zor bir koda sebep olacaktı. İleride kontrolleri düzenlemek/geliştirmek veya yeni kontroller eklemek istediğimde kod iyice karmaşıklaşacak ve bozulacaktı. Ben bu patterni kullanarak her bir kontrolün kendi sınıfı olmasını ve birbirinden bağımsız olmasını sağladım.

Ne Kazandım :
Daha esnek ve modülerliği daha yüksek bir kod elde ettim. Artık sisteme yeni kontroller eklemek, mevcut kontrolleri güncellemek/geliştirmek veya kontrollerin sırasını değiştirmek daha kolay oldu. Yeni kontrol eklemek istediğimde mevcut kodlara dokunmadan bu işlemi yapabileceğim için yönetimi daha kolay bir kod elde ettim. Ayrıca bu zincirli yapı sayesinde hata yönetimi ve hata tespiti daha kolay hale geldi. Herhangi bir kontrolde hata tespit edilirse sistem patlamadan kolayca bildirim gönderimi durdurulabiliyor.

2)Observer Pattern
Nerede Kullandım :
Bildirim gönderildikten sonra yapılacak diğer işlemlerin kontrolünden kullandım. Örneğin kodumda bulunan LoggerObserver ve AnalyticsObserver sınıfları bildirim gönderildikten sonra yapılacak olan loglama ve analiz kayıt işlemlerini yapıyor.

Neden Kullandım :
Sistemimizde bildirim gönderildiğinde belli başlı işlemler(loglama vs) kullanmamız gerektiği için ve tüm bu işlemleri gönderici sınıfın tanıması sıkı bağlılık oluşturacağı için Observer Pattern kullandım. Bu sayede oluşacak sıkı bağlılığın önüne geçtim ve sistemi daha kontrol edilebilir ve yönetilebilir bir hale getirdim. Ayrıca Observer Pattern sayesinde artık sisteme yeni gözlemciler eklemek istediğimde mevcut sınıfların kodları ile uğraşmak yerine yeni bir gözlemci sınıfı oluşturup bunu sisteme entegre ederek yeni gözlemci ekleyebiliyorum.

Ne Kazandım :
Sistemde oluşacak olası bir sıkı bağlılığı engelleyerek gevşek bağlılık oluşturdum bu sayede gönderici sınıfı sadevce kendi işi ile ilgilenebiliyor. Arka planda yapılan loglama vb. işlemlerle ilgilenmiyor. Ayrıca Observer Pattern kullanımı ile beraber artık sisteme yeni gözlemciler eklemek çok daha kolay hale geldi. Kodumuz daha optimize, daha yönetilebilir ve daha genişletilebilir bir hal aldı.
