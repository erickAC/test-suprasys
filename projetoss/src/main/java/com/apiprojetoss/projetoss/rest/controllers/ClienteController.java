package com.apiprojetoss.projetoss.rest.controllers;

import com.apiprojetoss.projetoss.model.Cliente;
import com.apiprojetoss.projetoss.model.enums.EnumCliente;
import com.apiprojetoss.projetoss.services.ClienteService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
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


    @GetMapping("/listar/nome/{nome}")
    public Optional<Cliente> findByNome(@PathVariable String nome) {
        return clienteService.findByNome(nome);
    }

    @PostMapping("/gravar")
    @ResponseStatus(HttpStatus.CREATED)
    public Cliente create(@RequestBody Cliente cliente) {
        cliente.setSituacao(EnumCliente.ATIVO);
        return clienteService.create(cliente);
    }

    @DeleteMapping("/deletar/{id}")
    public void delete(@PathVariable Integer id) {
        clienteService.findById(id)
                .map(c -> {
                    clienteService.delete(id);
                    return null;
                });
    }

    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.ACCEPTED)
    public Cliente update(@PathVariable Integer id, @RequestBody Cliente cliente) {
        Cliente clienteExistente = clienteService.findById(id).get();
        BeanUtils.copyProperties(cliente, clienteExistente);
        cliente.setId(id);
        return clienteService.create(cliente);
    }



    @PatchMapping("/situacao/{id}")
    public Cliente atualizaSituacao(@PathVariable Integer id) {
        Cliente cliente = clienteService.findById(id).get();
        if(cliente.getSituacao().equals(EnumCliente.ATIVO)) {
            cliente.setSituacao(EnumCliente.DESATIVO);
        } else {
            cliente.setSituacao(EnumCliente.ATIVO);
        }
        return clienteService.create(cliente);
    }


}
