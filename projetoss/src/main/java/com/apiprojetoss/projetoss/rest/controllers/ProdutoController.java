package com.apiprojetoss.projetoss.rest.controllers;

import java.util.List;

import com.apiprojetoss.projetoss.model.Produto;
import com.apiprojetoss.projetoss.rest.controllers.exceptions.ProdutoSemEstoque;
import com.apiprojetoss.projetoss.services.ProdutoService;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/produto")
public class ProdutoController {

    @Autowired
    private ProdutoService produtoService;

    @GetMapping("/listar")
    @ResponseStatus(HttpStatus.OK)
    public List<Produto> findAll() {
        return produtoService.findAll();
    }

    @GetMapping("listar/{id}")
    @ResponseStatus(HttpStatus.OK)
    public Produto findById(@PathVariable Integer id) {
        return produtoService.findById(id).get();
    }

    @PostMapping("/gravar")
    @ResponseStatus(HttpStatus.CREATED)
    public Produto create(@RequestBody Produto produto) {
        if (produto.getEstoque() == 0 || produto.getEstoque() == null) {
            throw new ProdutoSemEstoque(produto.getNome() + " sem estoque");
        }
        return produtoService.create(produto);
    }

    @DeleteMapping("/deletar/{id}")
    public void delete(@PathVariable Integer id) {
        produtoService.findById(id)
                .map(c -> {
                    produtoService.delete(id);
                    return null;
                });
    }

    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.ACCEPTED)
    public Produto update(@PathVariable Integer id, @RequestBody Produto produto) {
        Produto produtoExistente = produtoService.findById(id).get();
        BeanUtils.copyProperties(produto, produtoExistente);
        produto.setId(id);
        return produtoService.create(produto);
    }

}
