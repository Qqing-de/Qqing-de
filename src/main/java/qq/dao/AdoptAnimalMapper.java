package qq.dao;

import qq.pojo.AdoptAnimal;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface AdoptAnimalMapper extends BaseMapper<AdoptAnimal> {
        List<AdoptAnimal> all(@Param("adoptTime")String adoptTime);

}
