package com.maple.base.bean.usc.vo;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 * @auther BuziYang
 * @date 2019/11/11 14:10
 */

public class BatchVo {


    private String status;
    private List<Long> idList;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Long> getIdList() {
        return idList;
    }

    public void setIdList(List<Long> idList) {
        HashSet<Long> set = new HashSet<>(idList);
        idList.clear();
        idList.addAll(set);
        this.idList = idList;
    }

    public void addId(Long id){
        if(idList==null){
            idList = new ArrayList<>();
        }
        idList.add(id);
    }
}
