import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // String tipindeki ilk provider nesnemiz
    // Provider Kullanımı : Provider<String>(create: (context) => "İlk Provider")
    return Provider<String>(
      create: (context) => "İlk Provider",
      //String tipindeki ikinci provider nesnemiz
      child: Provider<String>(
        create: (context) => "ikinci Provider",
        child: const MaterialApp(
          title: 'Material App',
          home: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROVİDER'),
      ),
      body: Center(
        child: Text(
          //provider.of() metoduyla Widget tree üzerinde yer alan Provider nesnelerinden
          //tipi string olan datayı getir.
          //Provider kısıtlarından biride yukarıda aynı veri tipiyle
          //iki tane provider nesnemiz var. Provider.of() ilk gördüğü datayı getirecektir.
          //Fakat bize ilk görülen data değilde aynı tipteki bir başka data istediğimizde
          //ne yapmamız gerekiyor? Bunu gibi durumlarda Riverpod kullanacağız.
          Provider.of<String>(context),
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
