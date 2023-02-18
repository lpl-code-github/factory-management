







package io.factory.modules.oss.cloud;

import io.factory.common.utils.DateUtils;
import org.apache.commons.lang.StringUtils;

import java.io.InputStream;
import java.util.Date;
import java.util.UUID;






public abstract class CloudStorageService {
    
    CloudStorageConfig config;

    





    public String getPath(String prefix, String suffix) {
        
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        
        String path = DateUtils.format(new Date(), "yyyyMMdd") + "/" + uuid;

        if(StringUtils.isNotBlank(prefix)){
            path = prefix + "/" + path;
        }

        return path + suffix;
    }

    





    public abstract String upload(byte[] data, String path);

    





    public abstract String uploadSuffix(byte[] data, String suffix);

    





    public abstract String upload(InputStream inputStream, String path);

    





    public abstract String uploadSuffix(InputStream inputStream, String suffix);

}
