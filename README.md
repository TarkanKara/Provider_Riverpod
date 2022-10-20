# provider_riverpod_kullanimi
## iç içe provider kullanımı
## ProxyProvider() kullanıldı.

> 
iç içe provider kullanımı;
>>
MyFirstClass adında bir sınıf oluşturalım..
>>
ikinci oluşturduğumuz sınıf bir önceki sınıftan nesne alsın.
>>
proxyProvider ile birinci sınıf üzerinden ikinci sınıfa erişelim
>>
ilk provider MyFirstClass() nı döndürsün.
>>
provider ile proxyProvider ı sarmalama işlemi yaptık
>>
ilk provider MyFirstClass() nesnesini proxyProvider a verdi.
>>
proxyProvider ise MySecondClass() nesnesini bizlere verecektir.
>>
datayı ağac üzerinden dolaştırmak için contex yapısına ihtiyacamız var
>>
widget tree üzerinden yukarı doğru datayı taşımak için kullanıyoruz
>>
contex sayesinde diğer widgetların içerisine giderek üzerinde taşıdıkları veriye erişim sağlıyoruz.
>>
Ve bu şekilde veri üzerinde manipülasyon işlemleri yapabiliyoruz.
>>
Center widget nı Builder ile sarmalıyoruz. (providara erişmek için)
>>
Text içersinde provider ulaşmak isteyince tipini belirtmeyi unutma
>>
MySecondClass tipi belirleyerek, ikinci sınıf nesnesine erişim sağlıyoruz.
>>
yukarıdaki proxyProvider ile birinci sınıfa geçiş sağlayarak
>>
myValue = "ilk sınıf"; değerini text içerisinde yazdıracak
>>


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

Text(
    Provider.of<MySecondClass>(context).myFirstClass.myValue,             
 ),
        
```