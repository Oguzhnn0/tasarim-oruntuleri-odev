Yapay Zekaya Sorduğum Soru:
Kodumu daha güzel ve profesyonel yapacak en az 2 adet Structural Pattern öner bana.

Yapay Zekanın Cevabı:
Structural Pattern kullanarak kodunu daha esnek ve modüler hale getirmek güzel bir fikir burada sana şu 2 patterni önerebillirim: Decorator ve Adapter.
Neden bu ikisi dersen şöyle açıklayayım. Eğer bildirim gönderme işleminde bildirimden önce log tutmak veya bildirimdeki bişeyleri şifrelemek istersen 
bunları sınıfın içine yazarak kodları şişirmek yerine Decorator Pattern kullanarak bu özellikleri dışarıdan ekleyebilirsin. Ayrıca aynı anda hem SMS hemde
E-mail göndermek istersen çok işine yarar. Adapter Pattern ise şu durumlarda işine yarar: Dışarıdan 3.parti bir sistemle entegre çalışırken oradaki sistem ile senin sistemindeki arayüz uyumsuz olabilir.
Böyle durumlarda sorun yaşamamak için ise Apadter Pattern ile dışarıdan gelen sistemi kendi sistemindeki arayüze uygun hale getirebilirsin.

Ben Ne Yaptım:
Adapter Pattern kullanarak ForeignSmsService isimli 3.taraf bir sistemi kendi Notification arayüzümle uyumlu hale getirdim böylece 3.taraf sistemin
oluşturacağı uyumsuzlukların önüne geçmiş oldum. Decorator Pattern kullanarak ise bildirim sınıflarımın iç kodlarına dokunmadan,dışarıdan müdahale ile
bildirimlerime zaman eki ekledim.
