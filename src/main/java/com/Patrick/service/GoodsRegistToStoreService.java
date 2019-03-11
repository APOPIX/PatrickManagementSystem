package com.Patrick.service;

public interface GoodsRegistToStoreService {
    public int deleteGSRecord(int id);
    public int updateGSRecord(int record_id, int product_id, int store_id, int inventory, double original_price, double discount, int product_status);
    public int addGSRecord(int product_id, int store_id, int inventory, double original_price, double discount, int product_status);

}
