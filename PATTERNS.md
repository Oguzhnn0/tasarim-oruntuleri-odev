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
