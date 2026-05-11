Yapay Zekaya Sorduğum Soru :
Bu kodu daha standartlara uygun hale getirmek için hangi Creational örüntüyü kullanmalıyım? neden?

Yapay Zekanın Cevabı : 
Bu yapıyı standartlara daha uygun hale getirmen için en uygun Creational örüntü "Factory Method". Tek bir ürün tipi(bildirim) ile çalıştığın için Abstract Factory yerine bu daha uygun olacaktır. Neden Factory Method :
  1)Nesne Oluşturma Mantığını Gizler: Main sınıfı hangi sınıfın oluşturulacağını bilmez yalnızca tipi verilen sınıfı talep eder.
  2)Genişletilebilirlik: Yeni bir bildirim türü eklediğinde main sınıfına dokunmadan yeni türünü ekleyebilirsin.
  3)Gevşek Bağlılık: Uygulamanın geri kalanı somut sınıflara değil soyut arayüzlere bağımlı kalır.

Ben ne yaptım:
Yapay zeka ilk başta bana Strategy Pattern önermişti ama o faz3 konusu olduğu için yapay zekadan bana çözüm olarak Creational Pattern önermesini istedim o da bana Factory Methodu önerdi bende bunu koduma doğru bir şekilde entegre ederek kodumu standartlara daha uygun hale getirerek halihazırda bulunan bazı sorunları çözmüş oldum.
