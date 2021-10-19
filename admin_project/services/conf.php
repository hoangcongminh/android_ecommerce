<?php

class CONF {

    /* Flag for demo version */
    public $DEMO_VERSION = false;

    /* Data configuration for database */
    public $DB_SERVER   = "localhost";
    public $DB_USER     = "root";
    public $DB_PASSWORD = "";
    public $DB_NAME     = "markeet";

    /* FCM key for notification */
    public $FCM_KEY     = "AAAA-WbAcjw:APA91bF3GkvaY7loT98hCkHVdIGvqyTnCHLwt543543gR1YWjlKTmJApDQqtaE-4udj6g4JTb9fnBModT9Qeko-MO9L3VP8I0nT05YRHCf1I-HQWIIh09Y3TiCPrr0glU50gsCTFmdr7";


    /* [ IMPORTANT ] be careful when edit this security code, use AlphaNumeric only*/
    /* This string must be same with security code at Android, if its different android unable to submit order */
    public $SECURITY_CODE = "YeC9aoHAz6SUwizq9CmLDmUqgisVESFfyLDv6cICuPprv4qSbRonNc1Qxtzqzzc6vCayQc5G0gWeBdzrQHl7gZ1nUIsmzMlWouXe";

    /* Mailer config ---------------------------------------------------- */

    // change with yours
    public $SMTP_EMAIL      = "hinhchupbymin2@gmail.com";
    public $SMTP_PASSWORD   = "hoangcongminh232";
    public $SMTP_HOST       = "smtp.gmail.com";
    public $SMTP_PORT       = 587;

    // for administrator & for buyer
    public $SUBJECT_EMAIL_NEW_ORDER = "Don hang moi";
    public $TITLE_REPORT_NEW_ORDER  = "Đơn hàng mới";

    // for buyer
    public $SUBJECT_EMAIL_ORDER_PROCESSED   = "Don hang duoc xu li";
    public $TITLE_REPORT_ORDER_PROCESSED    = "Trạng thái đơn hàng đã chuyển thành ĐÃ XỬ LÍ";

    public $SUBJECT_EMAIL_ORDER_UPDATED     = "Du lieu don hang da duoc cap nhat";
    public $TITLE_REPORT_ORDER_UPDATED      = "Dữ liệu đơn hàng được cập nhật bởi Admin";
}

?>