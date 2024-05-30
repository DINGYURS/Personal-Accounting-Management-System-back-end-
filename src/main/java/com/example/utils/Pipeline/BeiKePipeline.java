package com.example.utils.Pipeline;

import com.example.mapper.HouseInfoMapper;
import com.example.pojo.HouseInfo;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import us.codecraft.webmagic.ResultItems;
import us.codecraft.webmagic.Task;
import us.codecraft.webmagic.pipeline.Pipeline;

import java.util.List;

/**
 * @Description: 信息处理部分
 */

@Slf4j
@Component
public class BeiKePipeline implements Pipeline {
    @Resource
    private HouseInfoMapper houseInfoMapper;

    public void process(ResultItems resultItems, Task task) {
        List<HouseInfo> houseInfos = resultItems.get("houseInfos");
        for (HouseInfo houseInfo : houseInfos) {
//            houseInfoMapper.insert(houseInfo);
            System.out.println(houseInfo);
        }

    }
}
