package com.example.BEFlutter_Example.dto.response;

import com.example.BEFlutter_Example.dto.ApiResponseDTO;
import lombok.Data;

@Data
public class ResponseGetAll {
    private Long id;

    private String urlImage;
    private String name;
    private String ratingVote;

}
