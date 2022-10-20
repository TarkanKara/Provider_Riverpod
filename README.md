# provider_riverpod_kullanimi

## riverpod: ^2.0.2
## flutter_riverpod: ^2.0.2

>>
Provider paket kullanımında ağacımıza veriyi enjekte edeceğimiz zamanda ağacın en yukarılarında bir yerlere veriyorduk ki
uyguylamanın altında hiyeraşik olarak buna ihtiyaç duyan alt basamaktaki diğer widgetler yukarıya baktıklarında veriye istediği gibi
ulaşabilsin burada aynı tipte başka veri karşılarına çıktığında malasef yanlış veriyide bizlere getirebilir.Bu istemediğimiz bir durum
>>
Projemizde riverpod u kullanabilmek için ilk widgetimiz olan MyApp widgetini bir widget olan ProviderScope widgeti ile sarmalıyoruz.
ProviderScope (flutter_riverpod: ^2.0.2 paketinden geliyor.) Bu yüzden projemizde flutter_riverpod paketini kullanmalıyız.
>>
Widgetimizi ProviderScopeile sarmaladıktan sonra Provider yardımıyla bir değişken oluşturalım.
riverpod paketi ile nesnelerimizi provider edeceğimiz zaman 
kullanım şu şekildedir. 
>>
void main() => runApp(const ProviderScope(child: MyApp()));
>>
Hello world verisini ilgili widgette kullanmaya başlayalım
>>
verimizi ilgili widgette kullanabilmek için Consumr widgetten extends etmemiz gerekiyor.
>>
Consumer widgetin build fonksiyonu (BuildContext context ve WidgetRef ref) adnda iki paramaetre alır.
>>
Consumer widgetin build fonksiyonu;
>>
Widget build(BuildContext context, WidgetRef ref)
>>
Consumer widgetini düzenlendikten sonra Data yı text widgetinde kullanalım. bize verilen ref değişkeni ile read parametresinden sonra datanın tipini belirleyerek provider edilecek nesnenin adını veriyoruz.
>>
ref.read<String>(helloWorld), kullanım bu şekilde
>>

