package com.apiprojetoss.projetoss.rest.controllers.exceptions;

import lombok.Data;

@Data
public class ProdutoSemEstoque extends RuntimeException{

    public ProdutoSemEstoque(String message) {
        super(message);
    }
}
