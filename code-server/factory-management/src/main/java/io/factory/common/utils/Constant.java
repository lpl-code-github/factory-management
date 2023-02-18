







package io.factory.common.utils;

import io.factory.common.validator.group.AliyunGroup;
import io.factory.common.validator.group.QcloudGroup;
import io.factory.common.validator.group.QiniuGroup;

import java.util.Optional;
import java.util.stream.Stream;






public class Constant {
    


    public static final int SUPER_ADMIN = 1;
    


    public static final String PAGE = "page";
    


    public static final String LIMIT = "limit";
    


    public static final String ORDER_FIELD = "sidx";
    


    public static final String ORDER = "order";
    


    public static final String ASC = "asc";

    






    public enum MenuType {
        


        CATALOG(0),
        


        MENU(1),
        


        BUTTON(2);

        private int value;

        MenuType(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }
    }

    






    public enum ScheduleStatus {
        


        NORMAL(0),
        


        PAUSE(1);

        private int value;

        ScheduleStatus(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }
    }

    


    public enum CloudService {
        


        QINIU(1, QiniuGroup.class),
        


        ALIYUN(2, AliyunGroup.class),
        


        QCLOUD(3, QcloudGroup.class);

        private int value;

        private Class<?> validatorGroupClass;

        CloudService(int value, Class<?> validatorGroupClass) {
            this.value = value;
            this.validatorGroupClass = validatorGroupClass;
        }

        public int getValue() {
            return value;
        }

        public Class<?> getValidatorGroupClass() {
            return this.validatorGroupClass;
        }

        public static CloudService getByValue(Integer value) {
            Optional<CloudService> first = Stream.of(CloudService.values()).filter(cs -> value.equals(cs.value)).findFirst();
            if (!first.isPresent()) {
                throw new IllegalArgumentException("非法的枚举值:" + value);
            }
            return first.get();
        }
    }

}
