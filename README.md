# provider_kullanimi
## provider paket setup
## provider: ^6.0.4

>>
String tipindeki ilk provider nesnemiz
>>
Provider Kullanımı : Provider<String>(create: (context) => "İlk Provider")
>>
String tipindeki ikinci provider nesnemiz
>>
Provider Kullanımı : Provider<String>(create: (context) => "ikinci Provider")
>>
provider.of() metoduyla Widget tree üzerinde yer alan Provider nesnelerinden tipi string olan datayı getir.
>>
Provider kısıtlarından biride aynı veri tipiyle, iki tane provider nesnemiz var.
>>
Provider.of() ilk gördüğü datayı getirecektir.
>>
Fakat bize ilk görülen data değilde aynı tipteki bir başka data istediğimizde
>>
ne yapmamız gerekiyor? Bunu gibi durumlarda Riverpod kullanacağız.
>>
