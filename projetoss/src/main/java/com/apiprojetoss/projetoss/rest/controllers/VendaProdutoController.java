package com.apiprojetoss.projetoss.rest.controllers;

import com.apiprojetoss.projetoss.model.Produto;
import com.apiprojetoss.projetoss.model.VendaProduto;
import com.apiprojetoss.projetoss.services.ProdutoService;
import com.apiprojetoss.projetoss.services.VendaProdutoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/venda_produto")
public class VendaProdutoController {

    @Autowired
    private VendaProdutoService vendaProdutoService;

    @Autowired
    private ProdutoService produtoService;

    @GetMapping("/listar/{id}")
    @ResponseStatus(HttpStatus.OK)
    public VendaProduto findById(@PathVariable Integer id) {
        return vendaProdutoService.findById(id);
    }

    @PostMapping("/gravar")
    public VendaProduto create(@RequestBody VendaProduto vendaProduto) {
        Produto produto = produtoService.findById(vendaProduto.getProduto().getId()).get();
        vendaProduto.setProduto(produto);
        vendaProduto.setDesconto(vendaProduto.getDesconto() * vendaProduto.getProduto().getDesconto());
        vendaProduto.setValor(vendaProduto.getProduto().getValor() * vendaProduto.getQuantidade());
        vendaProduto.setTotal(vendaProduto.getValor() - vendaProduto.getDesconto());
        return vendaProdutoService.create(vendaProduto);
    }

    @DeleteMapping("/deletar/{id}")
    public void delete(@PathVariable Integer id) {

    }

}
