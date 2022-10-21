# provider_riverpod_kullanimi

>>
FutureProvider Kullanımı ile ilgi
>>
Future bir datayı provider edilmesi ile ilgili
>>
web_servis.dart dosyayı içerisinde Web Seris Adında bir class oluşturuldu.
>>
httpData değişkeni Future<String> döndürüyor. ve String url adında parametresi var.
>>
Her 2 saniyede bir url döndürecek
>>
Future,async ve await terimleri için asekronprgramlamaya bakınız.
>>
riverpod ve flutter_riverpod paketlerini eklemeyi unutma
ProviderScope Kullanıyoruz. void main() => runApp(const ProviderScope(child: MyApp()));
>>
main.dart dosyası içerisinde futureProvider oluşturuyoruz.
>>
'''
final httpData = Provider((ref) => WebServis());
final futureProvider = FutureProvider<String>((ref) async {
  final http = ref.watch<WebServis>(httpData);
  return http.httpDatta();
});
'''
>>
Oluştural provider ı ilgili widgette kullanalım. (Consumer Widget altına yazalım)
>>
final responsee = ref.watch(futureProvider);
>>
Buraya dikkat, responsee değişkenin geriye dönüş tipi AsyncValue<String>
>>
Bu değişkenin (responsee) text widgette kullanımı map ile olmalıdır.
>>
responsee.map(
            data: ((data) => Text(data.value)),
            error: ((err) => Text(err.error.toString())),
            loading: ((_) => const Center(child: CircularProgressIndicator()))),
>>

