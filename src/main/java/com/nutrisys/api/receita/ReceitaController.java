package com.nutrisys.api.receita;

import com.nutrisys.api.exception.BadRequestException;
import com.nutrisys.api.exception.ResourceNotFoundException;
import com.nutrisys.api.receita.dto.CreateReceitaDto;
import com.nutrisys.api.receita.dto.CreatedReceitaDto;
import com.nutrisys.api.receita.dto.ListReceitaDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/receita")
public class ReceitaController {

    @Autowired
    private ReceitaService receitaService;

    @PostMapping
    public CreatedReceitaDto createReceita(@RequestBody CreateReceitaDto createReceitaDto) {
        try {
            return receitaService.createReceita(createReceitaDto);
        } catch (Exception e) {
            throw new BadRequestException("Erro ao criar receita: " + e.getMessage());
        }
    }

    @GetMapping
    public List<ListReceitaDto> listReceitas() {
        try {
            return receitaService.listReceitaDtos();
        } catch (Exception e) {
            throw new ResourceNotFoundException("Erro ao listar receita: " + e.getMessage());
        }
    }
}