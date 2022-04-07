package com.apiprojetoss.projetoss.services;

import com.apiprojetoss.projetoss.model.VendaProduto;
import com.apiprojetoss.projetoss.repositories.VendaProdutoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VendaProdutoService {

    @Autowired
    private VendaProdutoRepository vendaProdutoRepository;

    public void create(VendaProduto vendaProduto) {
        vendaProdutoRepository.save(vendaProduto);
    }

    public VendaProduto findById(Integer id) {
        return vendaProdutoRepository.findById(id).get();
    }
}
