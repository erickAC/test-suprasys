package com.apiprojetoss.projetoss.repositories;

import com.apiprojetoss.projetoss.model.Venda;
import com.apiprojetoss.projetoss.model.VendaProduto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface VendaProdutoRepository extends JpaRepository<VendaProduto, Integer> {
}