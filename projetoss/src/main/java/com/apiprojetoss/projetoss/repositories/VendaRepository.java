package com.apiprojetoss.projetoss.repositories;

import com.apiprojetoss.projetoss.model.Venda;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VendaRepository extends JpaRepository<Venda, Integer> {
}
