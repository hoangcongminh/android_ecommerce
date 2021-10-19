package com.example.markeetapp.utils;

import android.graphics.Bitmap;

public interface CallbackImageNotif {

    void onSuccess(Bitmap bitmap);

    void onFailed(String string);

}
