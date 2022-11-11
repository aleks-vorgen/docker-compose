package com.example.exchangeraterestapi.service;

import com.example.exchangeraterestapi.model.ExchangeRate;

public interface PrivateBankApiService {
    ExchangeRate[] getPBExchangeRate();
}
