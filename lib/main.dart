import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

//Riverpod Kullanımı
//counterProvider adında bir değişken oluşturuyoruz.
//bu değişkeni ChangeNotifierProvider() dan oluşturuyoruz.
//ilgili referansı (ref) ChangeNotifier dan extends edilen IncrementCounter() sınıfını veriyoruz.
//Kullanımı ; final counterProvider = ChangeNotifierProvider((ref) => IncrementCounter());
final counterProvider = ChangeNotifierProvider((ref) => IncrementCounter());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //count adındaki değişkene (ref) referasın üzerinden watch sınıfı ile counterProvider değeri getir.
    //bu değer getirilirken tip olaran IncrementCounter sınıfından faydalanacaktır.
    final count = ref.watch<IncrementCounter>(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider2'),
        centerTitle: true,
      ),
      body: Center(
        //count değişkenini text widgetin içinde kullanalım
        //değişkwnin değerini FloatingActionButton kullanarak değiştirelim

        child: Text(
          count.value.toString(),
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //incCount() metodunu çağrıyoruz.
        onPressed: () {
          count.incCount();
        },
        child: const Icon(
          Icons.add_circle_outline_sharp,
        ),
      ),
    );
  }
}

//Sınıf içerisindeki belli başlı değerlerin değişip değişmediğini
//uygulamanın farklı noktalarında bu değişimi gösterebiliriz.

class IncrementCounter extends ChangeNotifier {
  //Değişken tanımladık
  int _value = 0;

  //Sınıf dışında erişebilmek için getter method yazıyoruz.
  int get value => _value;

  //incCount adında foksiyon oluşturuyoruz.
  //_value++; değeri her defasında bir artırıyoruz.
  //Artan değeri notifyListeners() fonksiyonu ile dinliyoruz.
  incCount() {
    _value++;
    notifyListeners();
  }
}
