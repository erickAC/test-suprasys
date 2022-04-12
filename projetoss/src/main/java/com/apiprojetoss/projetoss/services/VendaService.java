package com.apiprojetoss.projetoss.services;

import com.apiprojetoss.projetoss.model.Cliente;
import com.apiprojetoss.projetoss.model.Produto;
import com.apiprojetoss.projetoss.model.Venda;
import com.apiprojetoss.projetoss.model.VendaProduto;
import com.apiprojetoss.projetoss.repositories.ClienteRepository;
import com.apiprojetoss.projetoss.repositories.ProdutoRepository;
import com.apiprojetoss.projetoss.repositories.VendaProdutoRepository;
import com.apiprojetoss.projetoss.repositories.VendaRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import javax.websocket.ClientEndpoint;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@Service
public class VendaService {

    @Autowired
    private VendaRepository vendaRepository;

    @Autowired
    private VendaProdutoRepository vendaProdutoRepository;

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
        if(cliente.equals(null)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Cliente não encontrado");
        } else {
            cliente.setVenda(venda);
            cliente.setId(cliente.getId());
            clienteRepository.save(cliente);
        }
        venda.getVendaProduto().stream().forEach(vendaProduto -> {
           Integer id = vendaProduto.getProduto().getId();
           Produto produto = produtoRepository.findById(id).get();
           vendaProduto.setProduto(produto);
           verificaEstoque(produto);
           produto.setEstoque(produto.getEstoque() - 1);
           vendaProduto.setDesconto(vendaProduto.getProduto().getDesconto()/100);
           vendaProduto.setValor(vendaProduto.getProduto().getValor() * vendaProduto.getDesconto());
           vendaProduto.setTotal(vendaProduto.getValor() * vendaProduto.getQuantidade());
        });
        venda.setCliente(cliente);
        venda.getVendaProduto().forEach(i -> i.setVenda(venda));
        venda.setData(LocalDate.now());
        return vendaRepository.save(venda);
    }
    public void delete(Integer id) {
        vendaRepository.deleteById(id);
    }

    public boolean verificaEstoque(Produto produto) {
        if(produto.getEstoque().equals(0) || produto.getEstoque().equals(null)) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Produto sem estoque");
        }
        return true;
    }

}
