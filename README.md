# provider_riverpod_kullanimi
## iç içe provider kullanımı
## ProxyProvider() kullanıldı.

```
class MyFirstClass {
  final String myValue = "ilk sınıf";
}

class MySecondClass {
  final MyFirstClass myFirstClass;

  MySecondClass(this.myFirstClass);
}


 Provider(
      create: (context) => MyFirstClass(),
      child: ProxyProvider<MyFirstClass, MySecondClass>(
        update: (context, myFirstClass, previous) {
          return MySecondClass(myFirstClass);
        },
        
```