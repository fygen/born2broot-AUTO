# OTO-RİZE OTO-MATİZE Born2Broot Projesi: 
# 5 DAKIKADA Born2Beroot
* Eğer tüm bunları öğrenebilirseniz. 120 PUAN. 
* 5 dakika içinde kurulum fırsatı.
* WORDPRESS dahil herşey çok kısa ..
* 5 Puanlık bonus eksik; KATKIDA BULUNUN.

## Genel Bakış
Bu proje, Born2Code programı için özel olarak tasarlanmış 42Cursus müfredatının bir parçası. Born2Broot, temel bir Linux sistemini sıfırdan kurmayı, yapılandırmayı, Wordpress oluşturmayı ve veritabanlarını bağlamayı amaçlayan sistem yönetimine giriş niteliğindedir.

# Gereklilikler
   * Sanal Makine veya VM kurulumu. Dosya Düzeni WORDPRESS'e göre olmalı.
   * Debian ilk açıldıktan sonra crypt ve user şifrelerini girip,
   * ``su`` ile giriş yapıp, Super User oldunuz.
   * ``apt install sudo``
   * ``apt install git``
   * Komutlarından sonra, 
   * Sanal makine kurulumunda VMWARE'deki PORTLARI AÇIN: 80 (Wordpress için) 4242 (SSH bağlantısı için). 
   
   EN SONUNDA;
   # SNAPSHOT ALIP (yedeğin az alan kaplayan versiyonu) KURULUM kısmına devam edin.

#### Temiz Kurulumun Anlık Görüntüsünü ALDIN MI?.
* (```apt install git sudo``` -->> sudo ve git kuruldu mu?)
* SNAPSHOTlar böyle gözüküyor TAKE tuşuna basıp alacaksın.
   ![image](https://github.com/fygen/preseed/assets/25952641/69511f98-6acf-4385-a24e-70be3927f409)
   
# Bu KISIM ÖNEMLİ. 
# ANCAK TEMİZ BİR KURULUM (GEREKLİLİKLER'E GÖRE) -> AUTO-B2BROOT'TA HATASIZ KURULUMA SEBEP OLUR.
   * Linux Dosya Sisteminde yüklenen paketler ve komutlar bazı kurulumları yapmanıza engel olacağı için değişiklik varsa;
   *  * En başa -> GEREKLILIKLER kısmında olacak şekile dönün.
# * EĞER kurulumu daha önce denediniz ve yarıda bıraktıysanız 
GEREKLİLİKLER'E SAHİP OLAN SNAPSHOT'a geri dönün.

## SONRA

## Kullanım ve Kurulum

1. Repo'yu klonla:
   ```bash
   git clone https://github.com/fygen/born2broot-AUTO.git
   ```

2. Proje dizinine gidin:
   ```bash
   cd preseed # Klasöre girin
   chmod 777 * # Dosyalara bütün sistem haklarını verin
   ```
   

3. SONRA terminalde aşağıdaki kodu çalıştırıp her gelen soruya 'y' tuşuna basın.

   ```bash
   ./executeLines.sh 1system_setup_and_sudo_config.sh
   ```
   * Burada her bir setup bittikten sonra kontrol için dosyalarda veya yapılan değişikliklerin hepsi nano ortamında açılıp gösterilecek ve siz kontrol edeceksiniz dosya doğru oluşturulmuş mu diye.
   * Sonra teker teker devam ediyoruz yine 'y' ile,
   
   ```
   ./executeLines.sh 2install_required_packages.sh
   ```
   ```
   ./executeLines.sh 3configure_ssh_and_firewall.sh
   ```
   ```
   ./executeLines.sh 4password_policy_configuration.sh
   ```
   ```
   ./executeLines.sh 5setup_monitoring_and_reboot.sh
   ```
   ```
   ./executeLines.sh 6wordpress_lighttpd_mariaDB_php.sh
   ```
   
   Buraya kadar Wordpress dahil her şey kuruluyor.Hepsine 'y' ye basın. ./executeLines çalışırken bütün sorulara "y" tuşuna basmanız yeterli.
   Eğer bir sorun olursa 'CTRL C' ile çıkıp ve sorunu çözüp tekrar yüklemeye ./executeLines ile devam edebilir veya setup'ın ilerisine atlayabilirsiniz. Veya başka bir çözüm için benimle iletişime geçebilirsiniz.

## Katkıda Bulunmak İçin:
Katkılarınızı bekleniyor! 
Born2Broot FULL OTOMATİZASYON projesine katkıda bulunmak için aşağıdaki eksiklere yardımcı olabilir ve adını BU OTOMASYON PROJESINE VE 42Dünya'ya altın harflerle kazıyabilirsin. 

1. ### FTP sunucusu veya 5 PUANLik bonus eksik bir hizmet eklenmeli ve bu 7. ye 7vsftpd.sh veya başka bir isimle eklenebilir.

2. ### "y" tuşuna basmadan TAM OTOMATİK KURULUM olabilir.

3. ```debconf-get-selections``` çıktı örneği -> [preseed.cfg](https://github.com/fygen/born2broot-AUTO/blob/master/OLD_trials/b2br.cfg)
   * Debian'da PRESEED denen bir özellik var. Üstteki kod ile kurulumda yaptığınız bazı seçimler geliyor ancak katılımsız kurulum ekranında yani DEBIAN'i VM'e kurarken PROFESSIONAL SETUP kısmında bu preseed.cfg dosyası iş görmüyor çünkü bütün seçimleri vermediği için hata veriyor. 

   *  Eğer bunu yapabilirseniz --> BU REPODA'daki bütün ün şatafat ve sevgiler sizin olsun. Ben hem çalıştığım hemde okuduğum için yeterli vaktim olmadı.

   *  Automating the Debian SETUP https://www.debian.org/releases/stable/i386/apb.en.html

## NASIL KATKI SAĞLANIR 

1. Depoyu FORK.

2. Yeni bir BRANCH oluşturun: (AUTONOMOUS veya SERVICE'S veya PRESEED olabilir)
   
   örnek:
   ```bash
   git checkout -b autonomous/autonomous-using-loop
   ```

3. Değişikliklerinizi yap ve COMMIT'le:
   ```bash
   git commit -am "Yeni özellik ekle"
   ```

4. Github'a PUSH'la:
   ```bash
   git push origin autonomous/autonomous-using-loop
   ```

5. Ve PULL isteği gönder. Sonra adın bu repoyla birlikte anılsın. Çok dua alacaksın emin ol :).

## Lisans
Bu proje MIT Lisansı altında lisanslanmış? Çok önemli değil sadece 70 kere kurup hayatınızı B2Broot'a adamak yerine içinde olan Shell kodlarını ve LINUX'U iyi öğrenin.

## İletişim
Sorularınız veya destek için [fatihyegen.09@gmail.com](mailto:fatihyegen.09@gmail.com).

## EKSTRALAR
* Kurulumun en başında yüklenen gpm paketi sayesinde kurulumda farenin sağ tıkı ile kopyalayıp kodu çalıştırabilirsiniz. 
