package com.apiprojetoss.projetoss.rest.controllers;

import com.apiprojetoss.projetoss.model.Cliente;
import com.apiprojetoss.projetoss.services.ClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("cliente")
public class ClienteController {

    @Autowired
    private ClienteService clienteService;

    @GetMapping("/listar")
    @ResponseStatus(HttpStatus.OK)
    public List<Cliente> findAll() {
        return clienteService.findAll();
    }

    @GetMapping("listar/{id}")
    @ResponseStatus(HttpStatus.OK)
    public Optional<Cliente> findById(@PathVariable Integer id)  {
        return clienteService.findById(id);
    }

    @PostMapping("/gravar")
    @ResponseStatus(HttpStatus.CREATED)
    public Cliente create(@RequestBody Cliente cliente) {
        return clienteService.create(cliente);
    }

    @DeleteMapping("/deletar/{id}")
    public void delete(@PathVariable Integer id) {
        Optional<Cliente> clienteOpt = clienteService.findById(id);
        clienteOpt
                .map(c -> {
                    clienteService.delete(id);
                    return null;
                });
    }

}
