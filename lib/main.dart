import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//ProviderScope MyApp widgeti ile sarmalıyoruz.
void main() => runApp(const ProviderScope(child: MyApp()));

//Riverpod ile nesnelerimizi provider etmek
//Hello world verisini ilgili widgette kullanmaya başlayalım
final helloWorld = Provider((ref) => "Hello World");

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

//verimizi burda kullanabilmek için Consumr widgtetten extends etmemiz gerekiyor.
//Consumer widgetin build fonksiyonu (BuildContext context ve WidgetRef ref) adnda iki paramaetre alır.

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  //Consumer widgetin build fonksiyonu
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod'),
        centerTitle: true,
      ),
      //Consumer widgetini düzenlendikten sonra
      //Data yı text widgetinde kullanalım
      //bize verilen ref değişkeni ile read parametresi dedikten sonra datanın tipini belirleyerek
      //provider edilecek nesnenin adını veriyoruz.
      //ref.read<String>(helloWorld), kullanım bu şekilde
      body: Center(
        child: Text(
          ref.read<String>(helloWorld),
          style: const TextStyle(fontSize: 55),
        ),
      ),
    );
  }
}
