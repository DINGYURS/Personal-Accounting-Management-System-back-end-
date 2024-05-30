package com.example.utils.PageProcessor;

import com.example.pojo.HouseInfo;
import org.springframework.stereotype.Component;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;
import java.util.ArrayList;
import java.util.List;
import static org.apache.commons.lang3.math.NumberUtils.min;

/**
 * @Description: 解析HTML,抽取信息部分
 */

@Component
public class GuguPageProcessor implements PageProcessor {

    private Site site = Site.me()
//            .setDomain("https://nb.zu.anjuke.com")
            .setUserAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0")
            .setRetryTimes(3)
            .setSleepTime(1000)
            .setTimeOut(10000);

    @Override
    public void process(Page page) {
//        page.addTargetRequests(page.getHtml().css("div.onCont ul li").links().all()); // 从页面中获取链接,继续爬取
        page.addTargetRequests(page.getHtml().css("ul.pagination li").links().all()); // 从页面中获取链接,继续爬取
//        page.addTargetRequests(page.getHtml().xpath("//div[@class='search-listbox']//dl[1]//a").links().all());
//        page.addTargetRequests(page.getHtml().xpath("//div[@class=\"search-listbox\"]/div[@class=\"quYu\"]/a").links().all());

        if (page.getHtml().toString().equals("https://www.gu-gu.com")) {
            page.setSkip(true);
        }
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
        for (int i = 0; i < total; i++) {
            String price = price1.get(i) + price2.get(i);
            houseInfos.add(new HouseInfo(title.get(i), communityName.get(i), address.get(i), houseType.get(i),
                    floorArea.get(i), level.get(i), price));
        }
        page.putField("houseInfos", houseInfos);
        System.out.println("房屋租聘信息有" + total + "个");
    }

    @Override
    public Site getSite() {
        return site;
    }
}
