package com.example.exchangeraterestapi.service;

import com.example.exchangeraterestapi.model.ExchangeRate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class PrivateBankApiServiceImpl implements PrivateBankApiService {
    private final Logger log = LoggerFactory.getLogger(PrivateBankApiServiceImpl.class);
    private final RestTemplate restTemplate = new RestTemplate();
    private static final String PB_API_URL = "https://api.privatbank.ua/p24api/pubinfo?exchange&json&coursid=11";

    @Cacheable("exchangeRate")
    public ExchangeRate[] getPBExchangeRate() {
        log.info("Service method was called...");
        return restTemplate.getForObject(PB_API_URL, ExchangeRate[].class);
    }
}
