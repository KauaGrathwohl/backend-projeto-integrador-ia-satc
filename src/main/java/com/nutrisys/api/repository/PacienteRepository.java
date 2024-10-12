package com.nutrisys.api.repository;

import com.nutrisys.api.model.Paciente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface PacienteRepository extends JpaRepository<Paciente, Long>, CustomPacienteRepository {
}