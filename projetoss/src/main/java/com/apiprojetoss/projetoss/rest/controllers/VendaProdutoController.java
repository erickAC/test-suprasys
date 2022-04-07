package com.apiprojetoss.projetoss.rest.controllers;

import com.apiprojetoss.projetoss.model.VendaProduto;
import com.apiprojetoss.projetoss.services.VendaProdutoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/venda_produto")
public class VendaProdutoController {

    @Autowired
    private VendaProdutoService vendaProdutoService;

    @GetMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public VendaProduto findById(@PathVariable Integer id) {
        return vendaProdutoService.findById(id);
    }

}
