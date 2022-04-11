package com.apiprojetoss.projetoss.model;

import com.apiprojetoss.projetoss.model.enums.EnumCliente;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cliente {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length = 100)
    private String nome;

    @Column(length = 20)
    private String login;

    @Column(length = 20)
    private String senha;

    @Enumerated(EnumType.STRING)
    @Column(name = "situacao")
    private EnumCliente situacao;

}
