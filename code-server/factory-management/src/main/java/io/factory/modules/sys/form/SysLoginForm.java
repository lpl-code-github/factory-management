







package io.factory.modules.sys.form;

import lombok.Data;






@Data
public class SysLoginForm {
    private String username;
    private String password;
    private String captcha;
    private String uuid;


}
