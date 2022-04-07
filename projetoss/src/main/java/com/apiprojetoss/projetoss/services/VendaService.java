package com.apiprojetoss.projetoss.services;

import com.apiprojetoss.projetoss.model.Produto;
import com.apiprojetoss.projetoss.model.Venda;
import com.apiprojetoss.projetoss.repositories.VendaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class VendaService {

    @Autowired
    private VendaRepository vendaRepository;

    public List<Venda> findAll() {
        return vendaRepository.findAll();
    }

    public Optional<Venda> findById(Integer id) {
        return vendaRepository.findById(id);
    }

    public Venda create(Venda venda) {
        return vendaRepository.save(venda);
    }

    public void delete(Integer id) {
        vendaRepository.deleteById(id);
    }
}
