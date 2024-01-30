package com.example.BEFlutter_Example.service.impl;

import com.example.BEFlutter_Example.dto.response.ResponseGetAll;
import com.example.BEFlutter_Example.entity.PlaceEntity;
import com.example.BEFlutter_Example.repository.PlaceRepository;
import com.example.BEFlutter_Example.service.GetAllPlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GetAllPlaceServiceImpl implements GetAllPlaceService {

@Autowired
   private PlaceRepository placeRepository;
    @Override
    public List<PlaceEntity> getAllPlace() {
        return placeRepository.findAll();
    }
}
