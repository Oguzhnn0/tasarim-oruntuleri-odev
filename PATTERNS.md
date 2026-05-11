1)Factory Method
Nerede Kullandım :
Factory method yapısını bildirim nesnelerinin oluşturulduğu kısımda kullandım. NotificationFactoryMethod isminde bir sınıf oluşturdum ve nesne oluşturma süreçlerini main sınıfınfan alarak bu yeni oluşturduğum sınıfa koymuş oldum.

Neden Kullandım :
Factory Method kullanmadan önce tüm bildirimlerim aynı sınıfın içerisindeydi ve uzayan bir if-else yapısı vardı. Bu uzayan if-else yapısı hem SRP vemde OCP'yi ihlal ediyordu. Bende nesne üretimini tek bir yerde toplamak ve main sınıfının bağımlılığını azaltmak için Factory Method kullandım.

Ne Kazandım :
Factory Method kullanarak kodumda kazandığım gelişmelerden ilki esneklik ve genişletilebilirlik. Önceden kodumu büyütmek ve yeni bildirim çeşitleri eklemek istediğimde mevcut sınıfımın kodlarını güncellemem gerekiyordu ama şimdi mevcut sınıfa dokunmadan sadece yeni bir sınıf oluşturarak yeni bildirim çeşitleri ekleyebiliyorum. İkinci kazanım olarak artık daha temiz bir koda sahibim. Eski kodda uzayan if-else yapıları varken kodun yeni hali daha okunabilir bir halde. Üçüncü olarak ise artık bakımı ve okunabilirliği daha kolay bir kodum oldu. İleride yapılacak her türlü bakım ve geliştirme artık daha kolay hale geldi.
