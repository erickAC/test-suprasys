package com.apiprojetoss.projetoss.rest.controllers.exceptions;

public class ClienteExistente extends RuntimeException{

    public ClienteExistente(String message) {
        super(message);
    }

}