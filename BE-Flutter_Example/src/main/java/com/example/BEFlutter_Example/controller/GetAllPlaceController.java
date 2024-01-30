package com.example.BEFlutter_Example.controller;

import com.example.BEFlutter_Example.dto.ApiResponseDTO;
import com.example.BEFlutter_Example.dto.response.ResponseGetAll;
import com.example.BEFlutter_Example.entity.PlaceEntity;
import com.example.BEFlutter_Example.service.GetAllPlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/v1")
public class GetAllPlaceController {
    @Autowired
    private GetAllPlaceService getAllPlaceService;

    @GetMapping("/getAll")
    public List<PlaceEntity> getAll(){
        List<PlaceEntity> placeEntities = new ArrayList<>();
        try{
            placeEntities = getAllPlaceService.getAllPlace();

        }catch (Exception ex){
            System.out.println(ex.getMessage());

        }
        return placeEntities;

    }
}
