package com.apiprojetoss.projetoss.repositories;

import com.apiprojetoss.projetoss.model.Produto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Integer> {

    @Query("select p from Produto p where p.nome like %:nome%")
    List<Produto> findAllByNomeLike(@Param("nome") String nome);

}
