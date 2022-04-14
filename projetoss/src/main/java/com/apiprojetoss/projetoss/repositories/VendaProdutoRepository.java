package com.apiprojetoss.projetoss.repositories;

import com.apiprojetoss.projetoss.model.VendaProduto;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VendaProdutoRepository extends JpaRepository<VendaProduto, Integer> {
}