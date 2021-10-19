package com.example.markeetapp;

import android.app.Application;
import android.os.Handler;
import android.text.TextUtils;
import android.util.Log;

import com.example.markeetapp.connection.API;
import com.example.markeetapp.connection.RestAdapter;
import com.example.markeetapp.connection.callbacks.CallbackDevice;
import com.example.markeetapp.data.SharedPref;
import com.example.markeetapp.model.DeviceInfo;
import com.example.markeetapp.utils.NetworkCheck;
import com.example.markeetapp.utils.Tools;
import com.google.firebase.iid.FirebaseInstanceId;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class ThisApplication extends Application {

    private static ThisApplication mInstance;
    private SharedPref sharedPref;
    Handler handler = new Handler();
    Runnable runnable = new Runnable() {
        @Override
        public void run() {
            obtainFirebaseToken();
        }
    };

    @Override
    public void onCreate() {
        super.onCreate();
        mInstance = this;
        sharedPref = new SharedPref(this);

        // obtain regId & registering device to server
        obtainFirebaseToken();
    }

    public static synchronized ThisApplication getInstance() {
        return mInstance;
    }

    private void obtainFirebaseToken() {
        String token = FirebaseInstanceId.getInstance().getToken();
        if (TextUtils.isEmpty(token)) {
            handler.removeCallbacks(runnable);
            handler.postDelayed(runnable, 10 * 1000);
        } else {
            sendRegistrationToServer(token);
        }
    }

    private void sendRegistrationToServer(String token) {
        Log.d("FCM_TOKEN", token + "");
        if (NetworkCheck.isConnect(this) && !TextUtils.isEmpty(token) && sharedPref.isOpenAppCounterReach()) {
            DeviceInfo deviceInfo = new DeviceInfo();
            deviceInfo.device = Tools.getDeviceName();
            deviceInfo.os_version = Tools.getAndroidVersion();
            deviceInfo.app_version = Tools.getVersionCode(this) + " (" + Tools.getVersionNamePlain(this) + ")";
            deviceInfo.serial = Tools.getDeviceID(this);
            deviceInfo.regid = token;

            API api = RestAdapter.createAPI();
            Call<CallbackDevice> callbackCall = api.registerDevice(deviceInfo);
            callbackCall.enqueue(new Callback<CallbackDevice>() {
                @Override
                public void onResponse(Call<CallbackDevice> call, Response<CallbackDevice> response) {
                    CallbackDevice resp = response.body();
                    if (resp != null && resp.status.equals("success")) {
                        sharedPref.setOpenAppCounter(0);
                    }
                }

                @Override
                public void onFailure(Call<CallbackDevice> call, Throwable t) {
                    Log.e("onFailure", t.getMessage());
                }
            });
        }
    }
}
