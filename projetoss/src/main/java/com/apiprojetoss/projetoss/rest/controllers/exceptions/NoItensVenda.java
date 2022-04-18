package com.apiprojetoss.projetoss.rest.controllers.exceptions;

import lombok.Data;

@Data
public class NoItensVenda extends RuntimeException{

    public NoItensVenda(String message) {
        super(message);
    }

}
