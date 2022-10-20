# provider_riverpod_kullanimi

## riverpod: ^2.0.2
## flutter_riverpod: ^2.0.2

>>
ChangeNotifier dan türeyen bir sınıfımızdaki değişkenin değerini dinleyerek her değer değiştiğindiğinde ilgili widgetlerde kullanımı
>>
counterProvider adında bir değişken oluşturuyoruz.
>>
bu değişkeni ChangeNotifierProvider() dan oluşturuyoruz.
>>
ilgili referansı (ref) ChangeNotifier dan extends edilen IncrementCounter() sınıfını veriyoruz.
>>
Kullanımı ; final counterProvider = ChangeNotifierProvider((ref) => IncrementCounter());
>>
count adındaki değişkene (ref) referasın üzerinden watch sınıfı ile counterProvider değeri getireceğiz
>>
bu değer getirilirken tip olaran IncrementCounter sınıfından faydalanacaktır.
>>
Kullanımı; final count = ref.watch<IncrementCounter>(counterProvider);
>>
count değişkenini text widgetin içinde kullanalım
>>
Text(count.value.toString())
>>
değişkwnin değerini FloatingActionButton kullanarak değiştirelim
>>
incCount() metodunu çağrıyoruz.
>>
onPressed: () {count.incCount();},