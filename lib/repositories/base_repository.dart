import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:request_app_http/utils/utils.dart';

class BaseRepository {
  Future<http.Response> httpGetRequest(String urlAddress) async {
    //await AuthRepository().tokenRefresh(); // here we want to study refresh token
    Tester.sPrint(
        "print===GET URL - $urlAddress"); // here we want study this printing method
    //In this following section we want to study the shared preference use.
    //debugPrint("Token: Bearer ${await AppPreferences.getToken1()}"); //here we want to study token
    //debugPrint("Token: Identity ${await AppPreferences.getToken2()}"); //here we want to study token
    var url = Uri.parse(urlAddress);
    final response = await http.get(
      url,
      //the below code used when we do authentication
      // headers: {
      //   'Authorization': "Bearer ${await AppPreferences.getToken1()}",
      //   'identity': 'Identity ${await AppPreferences.getToken2()}',
      //   'x-device-spec':
      //   '${await getDeviceInfo()}'
      // },
    );
    return response;
  }

  Future<http.Response> httpPostRequest(
      String urlAddress, dynamic requestBody) async {
    // await AuthRepository().tokenRefresh();
    var body = requestBody != null ? json.encode(requestBody) : null;
    debugPrint("Post URL - $urlAddress");
    debugPrint("Post Body - $body");
    var url = Uri.parse(urlAddress);
    final response = await http.post(url,
        headers:
            //headers !=null ? headers :
            {
          "Content-Type": "application/json",
          'Authorization':
              "Bearer eyJraWQiOiJIYnJYcUMxYkRVZFdwSlhiZHdtc0NTZXE4eHlYYVg1NDFWR0tXV1A1aGVvPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiI3MWZjOWUyNi04M2VjLTRlZTItOWM2OS04MmE1ODgwMTlkZDAiLCJldmVudF9pZCI6IjlkODMwZDhmLWVkODItNGFjOC05NmEyLWJhOWU4NGNkODMwNiIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE2NDExOTMyNTYsImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC5jYS1jZW50cmFsLTEuYW1hem9uYXdzLmNvbVwvY2EtY2VudHJhbC0xXzJlaUNkUnAzTiIsImV4cCI6MTY0MTE5Njg1NywiaWF0IjoxNjQxMTkzMjU3LCJqdGkiOiI3YmExYjA1Mi1iYmJhLTRlNmEtODM0Yy1iMzhlOTVmYjdkOTkiLCJjbGllbnRfaWQiOiIzYTA0OTZiNW1ucXY1YjUyaDkza2QyYmNzcCIsInVzZXJuYW1lIjoiNzFmYzllMjYtODNlYy00ZWUyLTljNjktODJhNTg4MDE5ZGQwIn0.mTsdfEWMpim1d4Mu8fR1YTT-ICB6yqoMIF8eZSc-Apl0ptQPf3v62IzVhSztM7NXz1dcKCg3YI_PwwUBwwpTdXwToztHEXEnrDBFIqtDUaY3JlosAsWUJvOkGhimtiLLMYOCbKXXQjczrQaxPXPgljfJ23PoIwyMzlXZoeKyl7PJOV8xgNet4Zh_OwIAnKBDFQIJfxP-XiUMWaxqEGJMgua0rYsSeZqGBZH2TsTAJvDV9_nAhRJONEpu7cQt4UVv296k6iHlaVLy4rojDgI8nhzWWq67a5-80JVx8kiqsfEBntpp7qE8IFWvGXWcsy7uyVMpve_HNgXs8FkV-vl9mA",
          'identity':
              'Identity eyJraWQiOiJKUEhDRjJOejVLbzgyRXB6ZnNCcnhQQjhvXC9PbVY3WGF1NUJ0M0k1K0JiVT0iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiI3MWZjOWUyNi04M2VjLTRlZTItOWM2OS04MmE1ODgwMTlkZDAiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmNhLWNlbnRyYWwtMS5hbWF6b25hd3MuY29tXC9jYS1jZW50cmFsLTFfMmVpQ2RScDNOIiwicGhvbmVfbnVtYmVyX3ZlcmlmaWVkIjpmYWxzZSwiY29nbml0bzp1c2VybmFtZSI6IjcxZmM5ZTI2LTgzZWMtNGVlMi05YzY5LTgyYTU4ODAxOWRkMCIsImdpdmVuX25hbWUiOiJvbmMiLCJjdXN0b206YWNjZXB0ZWRfdGVybXMiOiJ0cnVlIiwiYXVkIjoiM2EwNDk2YjVtbnF2NWI1Mmg5M2tkMmJjc3AiLCJldmVudF9pZCI6IjlkODMwZDhmLWVkODItNGFjOC05NmEyLWJhOWU4NGNkODMwNiIsInRva2VuX3VzZSI6ImlkIiwiY3VzdG9tOm9uYm9hcmRlZF9wcm9ncmFtIjoib25jb2xvZ3kiLCJhdXRoX3RpbWUiOjE2NDExOTMyNTYsInBob25lX251bWJlciI6IisxODQ3NDc0Nzc0NyIsImV4cCI6MTY0MTE5Njg1NywiaWF0IjoxNjQxMTkzMjU3LCJmYW1pbHlfbmFtZSI6InN1cnZleSIsImVtYWlsIjoib25jc3VydmV5QG1haWxpbmF0b3IuY29tIn0.m8l0K9KXZr0v9qIxCaNSSG4IkTGgWQKqH2oF3UTF4XfD9AxkuQ62NbvWIeA7WPUyU0PsgdjUkRQKpuqHg8-xEfbdI5nIJgQshaAgcsXEcr7eGgHtKV-I8A1oEikTm7iFklj8g02LEsnETL31rBe2QLJWPaZ5LaysFnOrbsFAiAWfepbtvHzE7hDBAg-ypq0YSU7GcazADD4co6i_jFcerz7YB_YL-DrMtHmEB6bdKNML8v3wNLgxGXlWqyFQ2KpTwMJ9T4R7HtrzO2kqJip39ShbUOZA22zeyLy0KoJcCqWwSaWZ2ZN3j9aZatJbBKY51VeMk01dgWZbEQVUj1sAuA',
          // 'x-device-spec': '${await getDeviceInfo()}'
        },
        body: body);
    //print('${await getDeviceInfo()}');
    return response;
  }

  Future<String> getDeviceInfo() async {
    String deviceInfo = await Utils.getDeviceInfo();
    return deviceInfo;
  }
}
