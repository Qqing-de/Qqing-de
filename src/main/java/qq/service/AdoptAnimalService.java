package qq.service;

import qq.pojo.AdoptAnimal;
import com.github.pagehelper.PageInfo;

public interface AdoptAnimalService {
    Integer create(AdoptAnimal adoptAnimal);
    PageInfo<AdoptAnimal> all(String adoptTime,Integer pageNum, Integer pageSize);
    int update(Integer id, Integer state);
    PageInfo<AdoptAnimal> allAdoptAnimal(String userName,Integer pageNum,Integer pageSize, Integer state);
}
