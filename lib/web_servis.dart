//Web Seris Adında bir class oluşturuldu.
//httpData değişkeni Future<String> döndürüyor. ve String url adında parametresi var.
//Her 2 saniyede bir url döndürecek
//Future,async ve await terimleri için asekronprgramlamaya bakınız.

class WebServis {
  Future<String> httpDatta([
    String url = "https://jsonplaceholder.typicode.com/",
  ]) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    return "HttpData : $url";
  }
}
