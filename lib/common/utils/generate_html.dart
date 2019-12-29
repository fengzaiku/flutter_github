
import 'dart:convert';

class HtmlUtils {
  static htmlBodyGenerateHtml(String string){
    String html = '''
    <!DOCTYPE html><html>
    <head>
    <title>Navigation Delegate Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    </head>
    <body style="word-break: break-all;">
    $string
    </body>
    </html>
    ''';
    return html;
  }
  static urlFormHtml(String string){
    String url = Uri.dataFromString(string, encoding: Encoding.getByName("utf-8"),mimeType: "text/html").toString();
    return url;
  }
}