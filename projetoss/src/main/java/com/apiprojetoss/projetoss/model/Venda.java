package com.apiprojetoss.projetoss.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Venda implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @OneToOne
    @JsonIgnoreProperties({"login", "senha"})
    private Cliente cliente;

    @OneToMany(mappedBy = "venda")
    @JsonIgnoreProperties({"venda"})
    private List<VendaProduto> vendaProdutos;

    @Column(nullable = false)
    @JsonFormat(pattern = "dd/MM/yyyy")
    private LocalDate data;

    @Column(nullable = false)
    private Double valor;

    @Column(nullable = false)
    private Double desconto;

    @Column(nullable = false)
    private Double total;

}
