import 'package:flutter_github/model/TrendingRepoModel.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class HtmlUtils {
 static formatTrendingHtml (html){
    Document document = parse(html);

    List<TrendingRepoModel> list = List();
    List<Element> articles = document.querySelectorAll("article.Box-row");

    if(articles.isNotEmpty){
      list.addAll(articles.map((Element element){
        List<String> names = element.querySelector('h1>a').text.split('/');
        String fullName = names[0].trim()+"/"+names[1].trim();
        List<String> contributors = List();
        List<Element> images = element.querySelectorAll('a[data-hovercard-type="user"]');

        images.forEach((curElement){
          RegExp srcExp = new RegExp(r"https?.+\=\d+");
          var imgEle = curElement.querySelector("img.avatar");
          String srcString = imgEle?.attributes?.toString();
          if(srcString != null){
            contributors.add(srcExp.stringMatch(srcString));
          }
        });

        String description = element.querySelector('p.my-1')?.innerHtml ?? "hgjhgjhgjh";
        String language = element.querySelector('span[itemprop="programmingLanguage"]')?.text ?? "Language";

        String mateHtml = element.querySelector(".f6.text-gray").innerHtml;
        RegExp mateReg = RegExp(r"(?:svg[>])(\s*[0-9\,a-z])+");
        Iterable<Match> matches = mateReg.allMatches(mateHtml);
        List getMatches = List();
        for (Match m in matches) {
          String match = m.group(0);
          getMatches.add(match.split('>')[1]);
        }

        if(contributors.isEmpty){
          contributors.add("https://avatars0.githubusercontent.com/u/2115102?s=40&v=4");
        }

        return TrendingRepoModel.fromJson({
          "fullName":fullName,
          "url": "/"+fullName,
          "description": description,
          "language": language,
          "meta": getMatches[2]?.trim(),
          "contributors": contributors,
          "contributorsUrl":contributors[0],
          "starCount": getMatches[0]?.trim(),
          "forkCount": getMatches[1]?.trim(),
          "name":fullName.split('/')[0],
          "reposName":fullName.split('/')[1],
        });
      }));
    }
    return list;
 }
}