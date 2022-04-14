package com.apiprojetoss.projetoss.repositories;

import java.util.Optional;

import com.apiprojetoss.projetoss.model.Cliente;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Integer> {

    Optional<Cliente> findByNome(String nome);

}
