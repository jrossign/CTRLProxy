package com.ipc.ctrlproxy.services;


import lombok.extern.slf4j.Slf4j;
import okhttp3.Interceptor;
import okhttp3.Response;

import javax.validation.constraints.NotNull;
import java.io.IOException;

@Slf4j
public class RetryInterceptor implements Interceptor {
    @Override
    public @NotNull Response intercept(Chain chain) throws IOException {
        var request = chain.request();
        Response response = null;
        boolean responseOK = false;
        byte tryCount = 0;
        while (!responseOK && tryCount < 3) {
            try {
                Thread.sleep(1000 * tryCount);
                response = chain.proceed(request);
                responseOK = response.isSuccessful();

            }catch ( InterruptedException e){
                e.printStackTrace();
                log.error("Request was not successful: {} . Retrying." , tryCount);
            }finally{
                assert response != null;
                if (!responseOK)
                    response.close();
                tryCount++;
            }
        }

        return response != null ? response : chain.proceed(request);
    }
}
