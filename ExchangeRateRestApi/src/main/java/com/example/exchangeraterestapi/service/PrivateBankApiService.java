package com.example.exchangeraterestapi.service;

import com.example.exchangeraterestapi.model.ExchangeRate;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class PrivateBankApiService {
    private final RestTemplate restTemplate = new RestTemplate();
    private static final String PB_API_URL = "https://api.privatbank.ua/p24api/pubinfo?exchange&json&coursid=11";

    public ExchangeRate[] getPBExchangeRate() {
        return restTemplate.getForObject(PB_API_URL, ExchangeRate[].class);
    }
}
