package com.apiprojetoss.projetoss.rest.controllers;

import com.apiprojetoss.projetoss.model.Cliente;
import com.apiprojetoss.projetoss.model.enums.EnumCliente;
import com.apiprojetoss.projetoss.services.ClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

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
    public Cliente findById(@PathVariable Integer id)  {
        Optional<Cliente> cliente = clienteService.findById(id);
            return clienteService.findById(id).get();
    }

    @GetMapping("/listar/nome/{nome}")
    @ResponseStatus(HttpStatus.OK )
    public Cliente findByNome(@PathVariable String nome) {
        return clienteService.findByNome(nome).get();
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

    @PutMapping("/gravar/{id}")
    @ResponseStatus(HttpStatus.ACCEPTED)
    public Cliente update(@PathVariable Integer id, @RequestBody Cliente cliente) {
        //Cliente clienteExistente = clienteService.findById(id).get();
        cliente.setId(id);
        cliente.setSituacao(EnumCliente.ATIVO);
        return clienteService.update(cliente);
    }

    @PutMapping("/situacao/{id}")
    @ResponseStatus(HttpStatus.OK)
    public Cliente atualizaSituacao(@PathVariable Integer id) {
        Cliente cliente = clienteService.findById(id).get();
        if(cliente.getSituacao().equals(EnumCliente.ATIVO)) {
            cliente.setSituacao(EnumCliente.DESATIVO);
        } else {
            cliente.setSituacao(EnumCliente.ATIVO);
        }
        return clienteService.atualizaSituacao(cliente);
    }

}
