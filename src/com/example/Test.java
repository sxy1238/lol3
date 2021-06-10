package com.example;

import java.util.Calendar;
import java.util.Date;

public class Test {
    public static void main(String[] args){
        Date date=DateUtil.getCurrentYearEndTime();
        System.out.println(date.toLocaleString());
    }
}
