package com.example.BEFlutter_Example.service;

import com.example.BEFlutter_Example.dto.response.ResponseGetAll;
import com.example.BEFlutter_Example.entity.PlaceEntity;

import java.util.List;

public interface GetAllPlaceService {
  public List<PlaceEntity> getAllPlace();
}
