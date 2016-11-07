package com.advancedspark.serving.tensorflow;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.sidecar.EnableSidecar;

@SpringBootApplication
//@EnableSidecar
public class SidecarApplication {
    public static void main(String[] args) {
        new SpringApplication(SidecarApplication.class).run(args);
    }
}
