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
public class BeiKeProcessor implements PageProcessor {

    private Site site = Site.me()
//            .setDomain("https://nb.zu.anjuke.com")
            .setUserAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0")
            .setRetryTimes(3)
            .setSleepTime(1000)
            .setTimeOut(10000);

    @Override
    public void process(Page page) {
        page.addTargetRequests(page.getHtml().css("div.content__pg").links().all()); // 从页面中获取链接,继续爬取
//        if (page.getHtml().toString().equals("https://www.gu-gu.com")) {
//            page.setSkip(true);
//        }
        List<HouseInfo> houseInfos = new ArrayList<>();
        List<String> title = page.getHtml().css("a.twoline", "text").all();
        List<String> communityName = page.getHtml().xpath("//*[@id=\"content\"]/div[1]/div[1]/*/div/p[2]/a[3]/text()").all();
        List<String> address1 = page.getHtml().xpath("//*[@id=\"content\"]/div[1]/div[1]/*/div/p[2]/a[1]/text()").all();
        List<String> address2 = page.getHtml().xpath("//*[@id=\"content\"]/div[1]/div[1]/*/div/p[2]/a[2]/text()").all();
        List<String> houseType = page.getHtml().xpath("//*[@id=\"content\"]/div[1]/div[1]/*/div/p[2]/text(5)").all();
        List<String> floorArea = page.getHtml().xpath("//*[@id=\"content\"]/div[1]/div[1]/*/div/p[2]/text(3)").all();
        List<String> level = page.getHtml().xpath("//*[@id=\"content\"]/div[1]/div[1]/*/div/p[2]/text(4)").all();
        List<String> price1 = page.getHtml().css("span.content__list--item-price em", "text").all();
        List<String> price2 = page.getHtml().xpath("//*[@id=\"content\"]/div[1]/div[1]/*/div/span/text()").all();
        int total = min(title.size(), communityName.size(), address1.size(), address2.size(), houseType.size(), floorArea.size(), level.size(), price1.size(), price2.size());
        for (int i = 0; i < total; i++) {
            String price = price1.get(i) + price2.get(i);
            String address = address1.get(i) + address2.get(i);
            houseInfos.add(new HouseInfo(title.get(i), communityName.get(i), address, houseType.get(i),
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
