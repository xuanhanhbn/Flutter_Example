package com.example.BEFlutter_Example.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApiResponseDTO<T> {
    private List<T> data;
    private int messageCode;
}
