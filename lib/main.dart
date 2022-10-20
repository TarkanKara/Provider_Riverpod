import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

//iç içe provider kullanımı
// MyFirstClass adında bir sınıf oluşturalım
//
class MyFirstClass {
  final String myValue = "ilk sınıf";
}

//ikinci oluşturduğumuz sınıf bir önceki sınıftan nesne alsın
//proxyProvider ile birinci sınıf üzerinden ikinci sınıfa erişelim
class MySecondClass {
  final MyFirstClass myFirstClass;

  MySecondClass(this.myFirstClass);
}

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //ilk provider MyFirstClass() nı döndürsün.
    //
    return Provider(
      create: (context) => MyFirstClass(),
      child: ProxyProvider<MyFirstClass, MySecondClass>(
        update: (context, myFirstClass, previous) {
          return MySecondClass(myFirstClass);
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Provider"),
            centerTitle: true,
          ),
          body: Builder(
            builder: (context) {
              return Center(
                child: Text(
                  Provider.of<MySecondClass>(context).myFirstClass.myValue,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
