package com.apiprojetoss.projetoss.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Venda {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @OneToOne
    private Cliente cliente;

    @Column(nullable = false)
    @JsonFormat(pattern = "dd/mm/yyyy")
    private LocalDate data;

    @Column(nullable = false)
    private Double valor;

    @Column(nullable = false)
    private Double desconto;

    @Column(nullable = false)
    private Double total;

}
