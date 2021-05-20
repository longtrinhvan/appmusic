package com.appmusic.controller;

import java.util.ArrayList;

public class test {

	public static void main(String[] args) {

		var list = new ArrayList<String>();
		list.add("a");
		list.add("b");
		list.add("c");
//		for (String x : list) {
//			System.out.println(x);
//		}
		var ds = new ArrayList<String>();
		boolean flag = false;
		for (String x : list) {
			if ("b" == x) {
				flag = true;
			}
			if (flag == true) {
				ds.add(x);
			}
		}
		for (String x : list) {
			if ("b" == x) {
				break;
			}
			ds.add(x);
		}
		for (String x : ds) {
			System.out.println(x);
		}
	}
}
