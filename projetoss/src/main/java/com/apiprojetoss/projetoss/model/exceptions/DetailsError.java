package com.apiprojetoss.projetoss.model.exceptions;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailsError {

    private String title;
    private int Status;
    private String message;
    private LocalDate date;


}
