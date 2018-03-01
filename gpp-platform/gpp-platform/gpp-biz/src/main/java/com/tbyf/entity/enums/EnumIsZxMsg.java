package com.tbyf.entity.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 是否开启咨询消息提醒
 * @author Liwb
 * @创建日期2017年8月21日
 */
public enum EnumIsZxMsg {

	NO(0,"否"),YES(1,"是");

	private Integer code;
	private String name;

	EnumIsZxMsg(Integer code, String name) {
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
		for (EnumIsZxMsg type : EnumIsZxMsg.values()) {
			enumDataMap.put(type.getCode(), type.getName());
		}
		return enumDataMap;
	}
}
