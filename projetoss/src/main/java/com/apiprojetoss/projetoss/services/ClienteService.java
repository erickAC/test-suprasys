package com.apiprojetoss.projetoss.services;

import java.util.List;
import java.util.Optional;

import com.apiprojetoss.projetoss.model.Cliente;
import com.apiprojetoss.projetoss.repositories.ClienteRepository;
import com.apiprojetoss.projetoss.rest.controllers.exceptions.ClienteExistente;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClienteService {

    @Autowired
    private ClienteRepository clienteRepository;

    public Cliente create(Cliente cliente) {
        Optional<Cliente> clienteOpt = clienteRepository.findByNome(cliente.getNome());
        if (clienteOpt.isPresent()) {
            throw new ClienteExistente("Cliente " + cliente.getNome() + " Existente, tente outro nome");
        }
        return clienteRepository.save(cliente);
    }

    public Cliente update(Cliente cliente) {
        return clienteRepository.save(cliente);
    }

    public List<Cliente> findAll() {
        return clienteRepository.findAll();
    }

    public Optional<Cliente> findById(Integer id) {
        return clienteRepository.findById(id);
    }

    public void delete(Integer id) {
        clienteRepository.deleteById(id);
    }

    public Optional<Cliente> findByNome(String nome) {
        return clienteRepository.findByNome(nome);
    }

    public Cliente atualizaSituacao(Cliente cliente) {
        return clienteRepository.save(cliente);
    }
}
