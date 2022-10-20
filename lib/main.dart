import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

//iç içe provider kullanımı
// MyFirstClass adında bir sınıf oluşturalım
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
    //provider ile proxyProvider ı sarmalama işlemi yaptık
    // ilk provider MyFirstClass() nesnesini proxyProvider a verdi.
    // proxyProvider ise MySecondClass() nesnesini bizlee verecektir.
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
          //datayı ağac üzerinden dolaştırmak için contex yapısına ihtiyacamız var
          //widget tree üzerinden yukarı doğru datayı taşımak için kullanıyoruz
          //contex sayesinde diğer widgetların içerisine giderek üzerinde taşıdıkları veriye erişim sağlıyoruz.
          //Ve bu şekilde veri üzerinde manipülasyon işlemleri yapabiliyoruz.
          //Center widget nı Builder ile sarmalıyoruz.
          body: Builder(
            builder: (context) {
              return Center(
                child: Text(
                  //provider ulaşmak isteyince tipini belirtmeyi unutma
                  //<MySecondClass> ile ikinci sınıf nesnesine erişim sağlıyoruz.
                  //yukarıdaki proxyProvider ile birinci sınıfa geçiş ağlayarak
                  //myValue = "ilk sınıf"; değerini text içerisinde yazdıracak
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
