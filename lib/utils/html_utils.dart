import 'package:flutter_github/model/TrendingRepoModel.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class HtmlUtils {
 static formatTrendingHtml (html) async{
    Document document = parse(html);

    List<TrendingRepoModel> list = List();
    List<Element> articles = document.querySelectorAll("article.Box-row");

    if(articles.isNotEmpty){
//      list = List.generate(articles.length, generator);
      list = articles.map((element){
        return TrendingRepoModel(
          fullName:"",
          url:"",
          description: element.querySelector('p.my-1').innerText,
          language: element.querySelector('span[itemprop="programmingLanguage"]').innerText,
          meta:"",
          contributors:"",
          contributorsUrl:"",
          starCount: element.querySelector('svg[aria-label="star"]').nextSibling.trim(),
          forkCount: element.querySelector('svg[aria-label="repo-forked"]').nextSibling.trim(),
          name:"",
          reposName:"",
        );
      });
    }

 }
}