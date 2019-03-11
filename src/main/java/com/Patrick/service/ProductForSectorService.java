package com.Patrick.service;

public interface ProductForSectorService {
    public int deletePSRecord(int id);
    public int updatePSRecord(int record_id, String sector_name, int product_id);
    public int addPSRecord(String sector_name, int product_id);

    public int deleteSector(String sector_name);
    public int addSector(String sector_name);
    public int updateSector(int id, String sector_name);
}
