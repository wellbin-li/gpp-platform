package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 医学影像检查报告--是否有影像-----0：正常、1：撤销
 * Created by lizk on 2016/10/27.
 */
public enum EnumRisReportXGBZ {

	NORMAL(0,"正常"),REVOKE(1,"撤销");

    private Integer code;
    private String name;

    EnumRisReportXGBZ(Integer code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public static Map<Integer, String> toMap() {
        Map<Integer, String> enumDataMap = new TreeMap<Integer, String>();
        for (EnumRisReportXGBZ type : EnumRisReportXGBZ.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}
