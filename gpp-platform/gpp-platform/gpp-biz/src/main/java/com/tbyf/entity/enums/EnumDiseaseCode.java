package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;
/**
 * 人群类型枚举
 * @author zanxc
 * @创建日期2017年8月21日上午10:13:15
 */
public enum EnumDiseaseCode {

	IS_DIABETES(0,"糖尿病"),IS_HYPERTENSION(1,"高血压"),IS_HEART_DISEASE(2,"心脏病"),IS_CEREBRAL_APOPLEXY(3,"脑卒中"),IS_PULMONARY_TUBERCULOSIS(4,"肺结核"), OTHER(5, "其他");
	private Integer code;
    private String name;
    
    EnumDiseaseCode(Integer code, String name) {
        this.code = code;
        this.name = name;
    }

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
    
	public static Map<Integer, String> toMap() {
        Map<Integer, String> enumDataMap = new TreeMap<Integer, String>();
        for (EnumDiseaseCode type : EnumDiseaseCode.values()) {
            enumDataMap.put(type.getCode(), type.getName());
        }
        return enumDataMap;
    }
}
