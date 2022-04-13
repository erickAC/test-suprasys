package com.apiprojetoss.projetoss.exceptions;

import com.apiprojetoss.projetoss.model.exceptions.DetailsError;
import org.hibernate.ObjectNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import javax.servlet.http.HttpServletRequest;
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

        return new ResponseEntity<>(errorDetail, null, HttpStatus.NOT_FOUND);
    }
}
