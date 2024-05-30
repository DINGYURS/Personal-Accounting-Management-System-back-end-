package com.example.utils.Task;

import com.example.utils.PageProcessor.GuguPageProcessor;
import com.example.utils.Pipeline.GuguPipeline;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import us.codecraft.webmagic.Spider;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * @Description: 爬虫启动配置项
 */

@Slf4j
@Component
public class GuguTask {
    @Resource
    private GuguPageProcessor guguPageProcessor;

    @Resource
    private GuguPipeline guguPipeline;

    private static final String aimURL = "https://www.gu-gu.com";
    private ScheduledExecutorService timer = Executors.newSingleThreadScheduledExecutor();

    public void crawl() {
        timer.scheduleWithFixedDelay(() -> {
            Thread.currentThread().setName("GuguCrawlerThread");

            try {
                Spider.create(guguPageProcessor)
                        .addUrl(aimURL)
                        .addPipeline(guguPipeline)
                        .thread(32)
                        .start();
            } catch (Exception ex) {
                log.error("定时抓取执行异常", ex);
            }
        }, 0, 30, TimeUnit.MINUTES); //每30分钟更新一次数据
    }
}
