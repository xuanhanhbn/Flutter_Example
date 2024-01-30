package com.example.BEFlutter_Example.repository;

import com.example.BEFlutter_Example.entity.PlaceEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PlaceRepository extends JpaRepository<PlaceEntity,Long> {
}
