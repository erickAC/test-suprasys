package com.apiprojetoss.projetoss.services;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import com.apiprojetoss.projetoss.model.Cliente;
import com.apiprojetoss.projetoss.model.Produto;
import com.apiprojetoss.projetoss.model.Venda;
import com.apiprojetoss.projetoss.repositories.ClienteRepository;
import com.apiprojetoss.projetoss.repositories.ProdutoRepository;
import com.apiprojetoss.projetoss.repositories.VendaRepository;
import com.apiprojetoss.projetoss.rest.controllers.exceptions.ProdutoSemEstoque;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

@Service
public class VendaService {

    @Autowired
    private VendaRepository vendaRepository;

    @Autowired
    private ClienteRepository clienteRepository;

    @Autowired
    private ProdutoRepository produtoRepository;

    public List<Venda> findAll() {
        return vendaRepository.findAll();
    }

    public Optional<Venda> findById(Integer id) {
        return vendaRepository.findById(id);
    }

    @Transactional
    public Venda create(Venda venda) {
        Cliente cliente = clienteRepository.findById(venda.getCliente().getId()).get();
        if (cliente.equals(null)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Cliente não encontrado");
        } else {
            cliente.setVenda(venda);
            cliente.setId(cliente.getId());
            clienteRepository.save(cliente);
        }
        venda.getVendaProduto().forEach(i -> i.setVenda(venda));
        venda.getVendaProduto().stream().forEach(vendaProduto -> {
            Integer id = vendaProduto.getProduto().getId();
            Produto produto = produtoRepository.findById(id).get();
            vendaProduto.setProduto(produto);
            verificaEstoque(produto);
            produto.setEstoque(produto.getEstoque() - vendaProduto.getQuantidade());
            verificaEstoque(produto);
            vendaProduto.setDesconto(produto.getDesconto() * vendaProduto.getQuantidade());
            vendaProduto.setValor(produto.getValor() * vendaProduto.getQuantidade());
            vendaProduto.setTotal(vendaProduto.getValor() - vendaProduto.getDesconto());
        });
        venda.setTotal(venda.getVendaProduto()
                .stream()
                .mapToDouble(i -> i.getTotal().doubleValue())
                .sum());
        venda.setDesconto(venda.getVendaProduto()
                .stream()
                .mapToDouble(i -> i.getDesconto().doubleValue())
                .sum());
        venda.setValor(venda.getVendaProduto()
                .stream()
                .mapToDouble(i -> i.getValor().doubleValue())
                .sum());
        venda.setTotal(venda.getVendaProduto()
                .stream()
                .mapToDouble(i -> i.getTotal().doubleValue())
                .sum());
        venda.setCliente(cliente);
        venda.setData(LocalDate.now());
        return vendaRepository.save(venda);
    }

    public void delete(Integer id) {
        vendaRepository.deleteById(id);
    }

    public boolean verificaEstoque(Produto produto) {
        if (produto.getEstoque().equals(0) || produto.getEstoque().equals(null) || produto.getEstoque() < 0) {
            throw new ProdutoSemEstoque("Produto sem estoque");
        }
        return true;
    }

}
