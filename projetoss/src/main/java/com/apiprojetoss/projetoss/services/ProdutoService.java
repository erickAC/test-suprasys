package com.apiprojetoss.projetoss.services;

import java.util.List;
import java.util.Optional;

import com.apiprojetoss.projetoss.model.Produto;
import com.apiprojetoss.projetoss.repositories.ProdutoRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProdutoService {

    @Autowired
    private ProdutoRepository produtoRepository;

    public List<Produto> findAll() {
        return produtoRepository.findAll();
    }

    public Optional<Produto> findById(Integer id) {
        return produtoRepository.findById(id);
    }

    public Produto create(Produto produto) {
        return produtoRepository.save(produto);
    }

    public void delete(Integer id) {
        produtoRepository.deleteById(id);
    }
}
