package com.example.markeetapp.data;

public class Constant {
    // Server URL
    public static String WEB_URL = "http://10.0.2.2/admin_project/";

    // Code same with Server to get client submit order
    public static final String SECURITY_CODE = "YeC9aoHAz6SUwizq9CmLDmUqgisVESFfyLDv6cICuPprv4qSbRonNc1Qxtzqzzc6vCayQc5G0gWeBdzrQHl7gZ1nUIsmzMlWouXe";

    // Re-register the device data to server
    public static int OPEN_COUNTER = 50;


    // this limit value used for give pagination (request and display) to decrease payload
    public static int NEWS_PER_REQUEST = 10;
    public static int PRODUCT_PER_REQUEST = 10;
    public static int NOTIFICATION_PAGE = 20;
    public static int WISHLIST_PAGE = 20;

    // retry load image notification
    public static int LOAD_IMAGE_NOTIF_RETRY = 3;

    // Method get path to image
    public static String getURLimgProduct(String file_name) {
        return WEB_URL + "uploads/product/" + file_name;
    }

    public static String getURLimgNews(String file_name) {
        return WEB_URL + "uploads/news/" + file_name;
    }

    public static String getURLimgCategory(String file_name) {
        return WEB_URL + "uploads/category/" + file_name;
    }

}
