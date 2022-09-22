package com.example.exchangeraterestapi.controller;

import com.example.exchangeraterestapi.model.ExchangeRate;
import com.example.exchangeraterestapi.service.PrivateBankApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ExchangeRateController {

    private final PrivateBankApiService privateBankApiService;

    @Autowired
    public ExchangeRateController(PrivateBankApiService privateBankApiService) {
        this.privateBankApiService = privateBankApiService;
    }

    @GetMapping("/")
    public ExchangeRate[] getPBExchangeRate() {
        return privateBankApiService.getPBExchangeRate();
    }
}
