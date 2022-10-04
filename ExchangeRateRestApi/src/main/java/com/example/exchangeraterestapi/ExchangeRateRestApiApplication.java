package com.example.exchangeraterestapi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.context.annotation.Bean;

import java.util.ArrayList;
import java.util.Collection;

@SpringBootApplication
@EnableCaching
public class ExchangeRateRestApiApplication {

    public static void main(String[] args) {
        SpringApplication.run(ExchangeRateRestApiApplication.class, args);
    }

    @Bean
    public CacheManager cacheManager() {
        return new ConcurrentMapCacheManager("exchangeRate");
    }

}
