import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_riverpod_kullanimi/web_servis.dart';

//ProviderScope Kullanıyoruz.
void main() => runApp(const ProviderScope(child: MyApp()));

final httpData = Provider((ref) => WebServis());
final futureProvider = FutureProvider<String>((ref) async {
  final http = ref.watch<WebServis>(httpData);
  return http.httpDatta();
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Buraya dikkat
    //responsee değişkenin geriye dönüş tipi AsyncValue<String>
    // Bu değişkenin text widgette kullanımı map ile olmalıdır.
    final responsee = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod - FetureProvider'),
      ),
      body: Center(
        //responsee değişkenin map ile kullanımı
        child: responsee.map(
            data: ((data) => Text(data.value)),
            error: ((err) => Text(err.error.toString())),
            loading: ((_) => const Center(child: CircularProgressIndicator()))),
      ),
    );
  }
}
