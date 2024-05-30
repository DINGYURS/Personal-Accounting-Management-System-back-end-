package com.example.utils;

import com.example.pojo.HouseInfo;
import lombok.Getter;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.processor.PageProcessor;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.apache.commons.lang3.math.NumberUtils.min;

@Getter
public class GetAnju implements PageProcessor
{
    private Site site = Site.me()
            .setCharset("utf8")
            .setTimeOut(10000)
            .setRetrySleepTime(3000)
            .setRetryTimes(3)
            .setSleepTime(30000);

    @Override
    public void process(Page page)
    {
//        List<String> titles = page.getHtml().regex("<span class=\"title\">(.*?)</span>").all();
//        page.putField("div", page.getHtml().regex("<span class=\"title\">(.*?)</span>").all());
//        List<String> titles2 = page.getHtml().css("div.more-items").all();
//        page.putField("div", page.getHtml().css("div#db-nav-movie a").all());
//        for (String title : titles) {
//            System.out.println(title);
//        }
//        page.addTargetRequests(page.getHtml().regex("https://movie.douban.com/.\\w+?.*").links().all());
//        page.putField("albums", page.getHtml().css("div.page_list2 a", "text").all());
//        page.addTargetRequests(page.getHtml().css("div.page_list2").links().all());

        page.putField("位置选择", page.getHtml().css("div.sub-items.sub-level1 a.selected-item", "text").all());
        List<HouseInfo> houseInfos = new ArrayList<>();
        List<String> title = page.getHtml().css("div.zu-info h3 a b.strongbox", "text").all();
        List<String> communityName = page.getHtml().css("address.details-item.tag a", "text").all();
        List<String> address = page.getHtml().css("address.details-item.tag", "text").all();
        List<String> houseTypeHtml = page.getHtml().css("div.zu-info p.details-item.tag").all();
        List<String> houseType = new ArrayList<>();
        Pattern pattern = Pattern.compile("<b class=\"strongbox\" style=\"font-weight: normal;\">(\\d+)</b>室<b class=\"strongbox\" style=\"font-weight: normal;\">(\\d+)</b>厅");
        for (String html : houseTypeHtml)
        {
            Matcher matcher = pattern.matcher(html);
            if (matcher.find())
            {
                String room = matcher.group(1);
                String hall = matcher.group(2);
                houseType.add(room + "室" + hall + "厅");
            }
        }
        List<String> floorAreaHtml = page.getHtml().css("div.zu-info p.details-item.tag").all();
        List<String> floorArea = new ArrayList<>();
        Pattern pattern2 = Pattern.compile("<b class=\"strongbox\" style=\"font-weight: normal;\">(\\d+)</b>平米");

        for (String html : floorAreaHtml)
        {
            Matcher matcher = pattern2.matcher(html);
            if (matcher.find())
            {
                String area = matcher.group(1);
                floorArea.add(area + "平米");
            }
        }
        List<String> levelHtml = page.getHtml().css("div.zu-info p.details-item.tag", "text").all();
        List<String> level = new ArrayList<>();
        Pattern pattern3 = Pattern.compile("平米(.*)");

        for (String html : levelHtml)
        {
            Matcher matcher = pattern3.matcher(html);
            if (matcher.find())
            {
                level.add(matcher.group(1));
            }
        }
//        List<String> tag = page.getHtml().css("p.details-item.bot-tag span.cls-common", "text").all();
        List<String> price1 = page.getHtml().css("div.zu-side strong.price", "text").all();
        List<String> price2 = page.getHtml().css("div.zu-side span.unit", "text").all();
        int total = min(title.size(), communityName.size(), address.size(), houseType.size(), floorArea.size(), level.size(), price1.size(), price2.size());
        for (int i = 0; i < total; i++)
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
        page.addTargetRequests(page.getHtml().css("div.sub-items.sub-level1").links().all());
//        page.putField("info", page.getHtml().css("div.zu-info h3 a b.strongbox", "text").all());
    }

    @Override
    public Site getSite()
    {
        return site;
    }

    public static void main(String[] args)
    {
        Spider.create(new GetAnju()).addUrl("https://nb.zu.anjuke.com/fangyuan/?pi=baidu-cpchz-nb-tyong1&kwid=574281514496")
//                .addPipeline(new FilePipeline("X:\\data"))
                .thread(5).run();
    }
}