package com.apiprojetoss.projetoss.exceptions;

import com.apiprojetoss.projetoss.model.Cliente;
import com.apiprojetoss.projetoss.model.exceptions.DetailsError;
import com.apiprojetoss.projetoss.rest.controllers.exceptions.ClienteExistente;
import com.apiprojetoss.projetoss.rest.controllers.exceptions.NoItensVenda;
import com.apiprojetoss.projetoss.rest.controllers.exceptions.ProdutoSemEstoque;
import org.hibernate.ObjectNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.NoSuchElementException;

@ControllerAdvice
public class RestExceptionHandler extends RuntimeException {

    @ExceptionHandler(NoSuchElementException.class)
    public ResponseEntity<?> handleRecursoNaoEncontrado(NoSuchElementException e,
                                                           HttpServletRequest request) {

        DetailsError errorDetail = new DetailsError();
        errorDetail.setStatus(HttpStatus.NOT_FOUND.value());
        errorDetail.setTitle("Recurso não encontrado.");
        errorDetail.setMessage(e.getClass().getName());
        errorDetail.setDate(LocalDate.now());

        return new ResponseEntity<>(errorDetail, null, HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(NoItensVenda.class)
    public ResponseEntity<?> handleNoItensVenda(NoItensVenda e,
                                                        HttpServletRequest request) {

        DetailsError errorDetail = new DetailsError();
        errorDetail.setStatus(HttpStatus.BAD_GATEWAY.value());
        errorDetail.setTitle(e.getMessage());
        errorDetail.setMessage(e.getClass().getName());
        errorDetail.setDate(LocalDate.now());

        return new ResponseEntity<>(errorDetail, null, HttpStatus.BAD_GATEWAY);
    }

    @ExceptionHandler(ProdutoSemEstoque.class)
    public ResponseEntity<?> handleNoItensVenda(ProdutoSemEstoque e,
                                                HttpServletRequest request) {

        DetailsError errorDetail = new DetailsError();
        errorDetail.setStatus(HttpStatus.BAD_REQUEST.value());
        errorDetail.setTitle(e.getMessage());
        errorDetail.setMessage(e.getClass().getName());
        errorDetail.setDate(LocalDate.now());

        return new ResponseEntity<>(errorDetail, null, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(ClienteExistente.class)
    public ResponseEntity<?> handleNoItensVenda(ClienteExistente e,
                                                HttpServletRequest request) {

        DetailsError errorDetail = new DetailsError();
        errorDetail.setStatus(HttpStatus.BAD_REQUEST.value());
        errorDetail.setTitle(e.getMessage());
        errorDetail.setMessage(e.getClass().getName());
        errorDetail.setDate(LocalDate.now());

        return new ResponseEntity<>(errorDetail, null, HttpStatus.BAD_REQUEST);
    }

}
