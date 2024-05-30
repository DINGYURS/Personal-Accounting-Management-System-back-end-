package com.example.utils;

import com.example.pojo.HouseInfo;
import com.example.service.HouseInfoService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.processor.PageProcessor;

import java.util.ArrayList;
import java.util.List;

import static org.apache.commons.lang3.math.NumberUtils.min;

@Component
public class GetGugu implements PageProcessor
{
    @Resource
    private HouseInfoService houseInfoService;

    private static final String aimURL = "https://www.gu-gu.com";
    private Site site = Site.me()
//            .setDomain("https://nb.zu.anjuke.com")
            .setUserAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0")
            .setRetryTimes(3)
            .setSleepTime(1000)
            .setTimeOut(10000);

    @Override
//    @Scheduled(cron = "0 0 0/1 * * ?")
    public void process(Page page)
    {
//        page.putField("html", page.getHtml().all());
        page.putField("区县选择", page.getHtml().xpath("//div[@class=\"search-listbox\"]/dl[1]/dd/a[@class=\"org\"]/text()").all());
        page.putField("街道选择", page.getHtml().xpath("//div[@class=\"search-listbox\"]/div[@class=\"quYu\"]/a[@class=\"org\"]/text()").all());
        List<HouseInfo> houseInfos = new ArrayList<>();
        List<String> title = page.getHtml().css("dd.info.rel p.title a", "text").all();
        List<String> communityName = page.getHtml().xpath("//dd[@class=\"info rel\"]/p[3]/a[3]/span/text()").all();
        List<String> address = page.getHtml().xpath("//dd[@class=\"info rel\"]/p[4]/text()").all();
        List<String> houseType = page.getHtml().xpath("//dd[@class=\"info rel\"]/p[2]/text(2)").all();
        List<String> floorArea = page.getHtml().xpath("//dd[@class=\"info rel\"]/p[2]/text(3)").all();
        List<String> level = page.getHtml().xpath("//dd[@class=\"info rel\"]/p[5]/text()").regex("\\d+").all();
        List<String> price1 = page.getHtml().xpath("//div[@class=\"moreInfo\"]/p/span/text()").all();
        List<String> price2 = page.getHtml().xpath("//div[@class=\"moreInfo\"]/p/text()").all();
        int total = min(title.size(), communityName.size(), address.size(), houseType.size(), floorArea.size(), level.size(), price1.size(), price2.size());
        for (int i = 0; i < total; i++)
        //*[@id="listBox"]/div[2]/dl[1]/dd/p[3]/a[3]/span
        //*[@id="listBox"]/div[2]/dl[2]/dd/p[3]/a[3]/span
        {
            String price = price1.get(i) + price2.get(i);
            houseInfos.add(new HouseInfo(title.get(i), communityName.get(i), address.get(i), houseType.get(i),
                    floorArea.get(i), level.get(i), price));
        }
        for (HouseInfo houseInfo : houseInfos)
        {
            System.out.println(houseInfo);
        }
        System.out.println("房屋租聘信息有" + total + "个");
        houseInfoService.insert(houseInfos);
        page.addTargetRequests(page.getHtml().css("ul.pagination li").links().all());
        page.addTargetRequests(page.getHtml().xpath("//div[@class='search-listbox']//dl[1]//a").links().all());
        page.addTargetRequests(page.getHtml().xpath("//div[@class=\"search-listbox\"]/div[@class=\"quYu\"]/a").links().all());
//        page.addTargetRequests(page.getHtml().links().regex("(https://www.gu-gu\\.com/\\w+/\\w+)").all());
    }

    @Override
    public Site getSite()
    {
        return site;
    }


    public static void main(String[] args)
    {
        Spider.create(new GetGugu())
                .addUrl(aimURL)
//                .addPipeline(new FilePipeline("X:\\data"))
                .thread(5)
                .run();
    }
}
