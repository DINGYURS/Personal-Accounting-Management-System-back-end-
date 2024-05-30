package com.example.utils;

import lombok.Data;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.selector.Selectable;


@Data
public class testWebMagic implements PageProcessor
{
    private static String aimURL = "https://www.gu-gu.com";
    private Site site = Site.me()
//            .setDomain("https://nb.zu.anjuke.com")
            .setUserAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0")
            .setRetryTimes(3)
            .setSleepTime(1000)
            .setTimeOut(10000);

    @Override
    public void process(Page page)
    {
        page.putField("位置选择", page.getHtml().css("div.search-listbox a.org.bold", "text").all());
        Selectable obj = page.getHtml().xpath("//div[@class='search-listbox']//dl[1]//a/@href");
        System.out.println(obj.all() + "\n---------------------------------------------------------------");
        Selectable obj2 = page.getHtml().xpath("//*[@id=\"list-content\"]/div[3]/div[1]/p[2]/span[2]");
        System.out.println(obj2 + "\n---------------------------------------------------------------");
//        Selectable title = obj.xpath("//h3")
//        Selectable obj3 = page.getHtml().css("p.details-item.bot-tag span.cls-common", "text");
//        System.out.println(obj3 + "\n---------------------------------------------------------------");
//        Selectable obj4 = page.getHtml().css("div.zu-info a b.strongbox", "text");
//        System.out.println(obj4 + "\n---------------------------------------------------------------");

//        List<String> titles = obj3.all();
//        List<String> title_urls = obj4.all();
    }

    @Override
    public Site getSite()
    {
        return site;
    }


    public static void main(String[] args)
    {
        Spider.create(new testWebMagic())
                .addUrl(aimURL)
//                .addPipeline(new FilePipeline("X:\\data"))
                .thread(5)
                .run();
    }
}