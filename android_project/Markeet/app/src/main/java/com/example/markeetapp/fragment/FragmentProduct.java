package com.example.markeetapp.fragment;

import android.os.Bundle;
import androidx.annotation.Nullable;
import androidx.annotation.StringRes;

import com.example.markeetapp.ActivityProductDetails;
import com.example.markeetapp.adapter.AdapterProduct;
import com.example.markeetapp.connection.callbacks.CallbackProduct;
import com.example.markeetapp.data.Constant;
import com.example.markeetapp.model.Product;
import com.google.android.material.snackbar.Snackbar;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.example.markeetapp.ActivityCategoryDetails;
import com.example.markeetapp.ActivityMain;
import com.example.markeetapp.R;
import com.example.markeetapp.adapter.AdapterCategory;
import com.example.markeetapp.connection.API;
import com.example.markeetapp.connection.RestAdapter;
import com.example.markeetapp.connection.callbacks.CallbackCategory;
import com.example.markeetapp.model.Category;
import com.example.markeetapp.utils.NetworkCheck;

import java.util.ArrayList;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class FragmentProduct extends Fragment {

    private Long product_id;

    private View root_view;
    private RecyclerView recyclerView;
    private Call<CallbackProduct> callbackCall;
    private AdapterProduct adapter;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        root_view = inflater.inflate(R.layout.fragment_product, null);
        initComponent();
        requestListProduct();

        return root_view;
    }

    private void initComponent() {
        recyclerView = (RecyclerView) root_view.findViewById(R.id.recyclerView);
        recyclerView.setLayoutManager(new GridLayoutManager(getActivity(), 3));

        //set data and list adapter
        adapter = new AdapterProduct(getActivity(), recyclerView, new ArrayList<Product>());
        recyclerView.setAdapter(adapter);
        recyclerView.setNestedScrollingEnabled(false);
        recyclerView.setVisibility(View.GONE);

        adapter.setOnItemClickListener(new AdapterProduct.OnItemClickListener() {
            @Override
            public void onItemClick(View v, Product obj, int position) {
                ActivityProductDetails.navigate(getActivity(), obj.id, false);
            }
        });
    }


    private void requestListProduct() {
        API api = RestAdapter.createAPI();
        callbackCall = api.getListProductF(Constant.PRODUCT_PER_REQUEST, null);
        callbackCall.enqueue(new Callback<CallbackProduct>() {
            @Override
            public void onResponse(Call<CallbackProduct> call, Response<CallbackProduct> response) {
                CallbackProduct resp = response.body();
                if (resp != null && resp.status.equals("success")) {
                    recyclerView.setVisibility(View.VISIBLE);
                    adapter.setItems(resp.products);
                    ActivityMain.getInstance().category_load = true;
                    ActivityMain.getInstance().showDataLoaded();
                } else {
                    onFailRequest();
                }
            }

            @Override
            public void onFailure(Call<CallbackProduct> call, Throwable t) {
                Log.e("onFailure", t.getMessage());
                if (!call.isCanceled()) onFailRequest();
            }

        });
    }

    private void onFailRequest() {
        if (NetworkCheck.isConnect(getActivity())) {
            showFailedView(R.string.msg_failed_load_data);
        } else {
            showFailedView(R.string.no_internet_text);
        }
    }

    private void showFailedView(@StringRes int message) {
        ActivityMain.getInstance().showDialogFailed(message);
    }

}
