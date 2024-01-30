package com.example.BEFlutter_Example.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "Place")
public class PlaceEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "PLACE_NAME")
    private String placeName;
    @Column(name = "IMAGE")
    private String urlImage;
    @Column(name = "STAR_RATING")
    private String starRating;
}
