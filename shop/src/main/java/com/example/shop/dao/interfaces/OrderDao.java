package com.example.shop.dao.interfaces;

import com.example.shop.model.Order;

import java.util.List;

public interface OrderDao {
    List<Order> getOrderList();

    Order getOrder(int id);

    void insertOrder(Order order);

    void updateOrder(Order order);

    void deleteOrder(int id);
}
