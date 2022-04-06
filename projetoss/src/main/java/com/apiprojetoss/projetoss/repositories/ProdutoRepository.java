package com.apiprojetoss.projetoss.repositories;

import com.apiprojetoss.projetoss.model.Produto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Integer> {
}
