package com.ipc.ctrlproxy;

import com.ipc.ctrlproxy.services.CTRLWebServices;
import org.junit.jupiter.api.Test;
import org.springframework.util.ResourceUtils;

import java.io.File;
import java.nio.file.Files;

public class UnitTests {


    @Test
    void testDecode() throws  Exception
    {
        String str = load("classpath:messages/ctrl/details-2.json");
        System.out.println(str);
        str = CTRLWebServices.unescape(str);
//        System.out.println(str);
    }


    public String load(String path) throws Exception
    {
        File file = ResourceUtils.getFile(path);
        return new String(Files.readAllBytes(file.toPath()));
    }
}
