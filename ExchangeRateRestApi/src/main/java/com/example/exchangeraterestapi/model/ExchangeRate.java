package com.example.exchangeraterestapi.model;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode
@JsonIgnoreProperties(ignoreUnknown = true)
public class ExchangeRate {

    @JsonAlias("ccy")
    private String currencyCode; //USD
    @JsonAlias("base_ccy")
    private String baseCurrencyCode; //UAH
    private String buy;//213
    private String sale;//12312

    @Override
    public String toString() {
        return "ExchangeRate{" +
                "ccy='" + currencyCode + '\'' +
                ", base_ccy='" + baseCurrencyCode + '\'' +
                ", buy='" + buy + '\'' +
                ", sale='" + sale + '\'' +
                '}';
    }
}
