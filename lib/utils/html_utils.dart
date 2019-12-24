import 'package:flutter_github/model/TrendingRepoModel.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class HtmlUtils {
 static formatTrendingHtml (html) async{
    Document document = parse(html);

    List<TrendingRepoModel> list = List();
    List articles = document.querySelectorAll("article.Box-row");

    if(articles.isNotEmpty){
//      list = List.generate(articles.length, generator);
      list.addAll(articles.map((element){
        RegExp hrefExp = new RegExp("(?!\{href\:)(\/[a-zA-Z0-9]+)+");
        String hrefString = element.querySelector('h1>a').attributes.toString();


        String url = hrefExp.firstMatch(hrefString)[0];
        List<String> contributors = List();
        List images = element.querySelectorAll('a[data-hovercard-type="user"]');
        images.forEach((curElement){
          RegExp srcExp = new RegExp("https?.*\=\d+");
//          srcExp.stringMatch(input)
          var imgEle = curElement.querySelector("img.avatar");
          String srcString = imgEle.attributes.toString();
          print("srcString----------------------------${srcString}");
          print("srcExp.firstMatch(srcString)[0]----------------------------${srcExp.stringMatch(srcString)}");
//          print("srcExp.firstMatch(srcString)[0]----------------------------${srcExp.firstMatch(srcString)[0]}");
//          contributors.add(srcExp.firstMatch(srcString)[0]);
        });
        print("ele.attributes.href----------------------------${contributors}");
        return TrendingRepoModel.fromJson({
          "fullName":url.substring(1, url.length),
          "url": url,
          "description": element.querySelector('p.my-1').innerText,
          "language": element.querySelector('span[itemprop="programmingLanguage"]').innerText,
          "meta": element.querySelector(".float-sm-right").lastChild.textContent,
          "contributors": contributors,
          "contributorsUrl":contributors[1],
          "starCount": element.querySelector('svg[aria-label="star"]').nextSibling.textContent,
          "forkCount": element.querySelector('svg[aria-label="repo-forked"]').nextSibling.textContent,
          "name":url.split('/')[1],
          "reposName":url.split('/')[2],
        });
      }));
    }
    return list;
 }
}