







package io.factory.common.xss;

import io.factory.common.exception.RRException;
import org.apache.commons.lang.StringUtils;






public class SQLFilter {

    



    public static String sqlInject(String str){
        if(StringUtils.isBlank(str)){
            return null;
        }
        
        str = StringUtils.replace(str, "'", "");
        str = StringUtils.replace(str, "\"", "");
        str = StringUtils.replace(str, ";", "");
        str = StringUtils.replace(str, "\\", "");

        //转换成小写
        str = str.toLowerCase();

        //非法字符
        String[] keywords = {"master", "truncate", "insert", "select", "delete", "update", "declare", "alter", "drop"};

        //判断是否包含非法字符
        for(String keyword : keywords){
            if(str.indexOf(keyword) != -1){
                throw new RRException("包含非法字符");
            }
        }

        return str;
    }
}
