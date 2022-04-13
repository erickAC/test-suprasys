package com.apiprojetoss.projetoss.rest.controllers;

import com.apiprojetoss.projetoss.model.Produto;
import com.apiprojetoss.projetoss.model.Venda;
import com.apiprojetoss.projetoss.rest.controllers.exceptions.NoItensVenda;
import com.apiprojetoss.projetoss.services.ClienteService;
import com.apiprojetoss.projetoss.services.VendaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/venda")
public class VendaController {

    @Autowired
    private VendaService vendaService;

    @Autowired
    private ClienteService clienteService;

    @GetMapping("/listar")
    @ResponseStatus(HttpStatus.OK)
    public List<Venda> findAll() {
        return vendaService.findAll();
    }

    @GetMapping("listar/{id}")
    @ResponseStatus(HttpStatus.OK)
    public Venda findById(@PathVariable Integer id)  {
        return vendaService.findById(id).get();
    }

    @Transactional
    @PostMapping("/gravar")
    @ResponseStatus(HttpStatus.CREATED)
    public Venda create(@RequestBody Venda venda) {
        if(venda.getVendaProduto().isEmpty()){
            throw new NoItensVenda("Um venda não pode ficar sem itens");
        }
        return vendaService.create(venda);

    }

    @DeleteMapping("/deletar/{id}")
    public void delete(@PathVariable Integer id) {
        vendaService.findById(id)
                .map(c -> {
                    vendaService.delete(id);
                    return null;
                });
    }

}
