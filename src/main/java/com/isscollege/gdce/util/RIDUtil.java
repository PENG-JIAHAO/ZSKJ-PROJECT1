package com.isscollege.gdce.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class RIDUtil
{
    private RIDUtil(){}

    static boolean isTest = false;
    static String testString;
    static SimpleDateFormat millisecondsFormat = new SimpleDateFormat("yyyyMMddHHmmss0SSS");
    static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    public static String getRID()
    {
        if(!isTest)
        {
            return "AR" + millisecondsFormat.format(System.currentTimeMillis());
        }
        else
        {
            isTest=false;
            return testString;
        }
    }

    public static String getCreateDate()
    {
        return dateFormat.format(System.currentTimeMillis());
    }

    public static String getRIDTest()
    {
        testString = "AR" + millisecondsFormat.format(System.currentTimeMillis());
        isTest = true;
        return testString;
    }

}
