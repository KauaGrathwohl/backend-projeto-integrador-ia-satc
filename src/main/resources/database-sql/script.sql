CREATE TABLE ENTIDADES (
    ID                  NUMERIC(19) NOT NULL,
    NOME_CONSULTORIO    VARCHAR(100) NOT NULL,
    CNPJ                VARCHAR(100) NOT NULL,
    LOCALIZACAO         VARCHAR(150) NOT NULL,
    CONSTRAINT PK_ENTIDADES PRIMARY KEY (ID)
);

CREATE TABLE USUARIOS (
    ID              NUMERIC(19) NOT NULL,
    ID_ENTIDADES    NUMERIC(19) NOT NULL,
    USUARIO         VARCHAR(50) NOT NULL,
    SENHA           VARCHAR(20) NOT NULL,
    NOME            VARCHAR(100) NOT NULL,
    DT_NASCIMENTO   TIMESTAMP(6) NOT NULL,
    CRN             VARCHAR(10) NOT NULL,
    CPF_CNPJ        VARCHAR(14) NOT NULL,
    STATUS          VARCHAR(1) NOT NULL,
    DH_CRIACAO      TIMESTAMP(6) NOT NULL,
    CONSTRAINT PK_USUARIOS PRIMARY KEY (ID)
);
ALTER TABLE USUARIOS ADD CONSTRAINT FK_USUARIOS_ENTIDADES FOREIGN KEY (ID_ENTIDADES) REFERENCES ENTIDADES(ID);

CREATE TABLE CONFIGURACOES_GERAIS (
    ID                NUMERIC(19) NOT NULL,
    ID_USUARIOS       NUMERIC(19) NOT NULL,
    TEMA_SISTEMA      VARCHAR(1) NOT NULL,
    CONSTRAINT PK_CONFIGURACOES_GERAIS PRIMARY KEY (ID)
);
ALTER TABLE CONFIGURACOES_GERAIS ADD CONSTRAINT FK_CONFIGURACOES_GERAIS_USUARIOS FOREIGN KEY (ID_USUARIOS) REFERENCES USUARIOS(ID);

CREATE TABLE USUARIOS_ENTIDADES (
    ID                NUMERIC(19) NOT NULL,
    ID_ENTIDADES      NUMERIC(19) NOT NULL,
    ID_USUARIOS       NUMERIC(19) NOT NULL,
    CONSTRAINT PK_USUARIOS_ENTIDADES PRIMARY KEY (ID)
);
ALTER TABLE USUARIOS_ENTIDADES ADD CONSTRAINT FK_USUARIOS_ENTIDADES_ENTIDADES FOREIGN KEY (ID_ENTIDADES) REFERENCES ENTIDADES(ID);
ALTER TABLE USUARIOS_ENTIDADES ADD CONSTRAINT FK_USUARIOS_ENTIDADES_USUARIOS FOREIGN KEY (ID_USUARIOS) REFERENCES USUARIOS(ID);

CREATE TABLE PACIENTES (
    ID              NUMERIC(19) NOT NULL,
    ID_ENTIDADES    NUMERIC(19) NOT NULL,
    ID_USUARIOS     NUMERIC(19) NOT NULL,
    NOME            VARCHAR(100) NOT NULL,
    CPF             VARCHAR(11) NOT NULL,
    DT_NASCIMENTO   TIMESTAMP(6) NOT NULL,
    STATUS          VARCHAR(1) NOT NULL,
    PESO            NUMERIC(3,2) NOT NULL,
    ALTURA          NUMERIC(3,2) NOT NULL,
    OBJETIVO        VARCHAR(500) NOT NULL,
    RESTRICOES      VARCHAR(300) NOT NULL,
    PREFERENCIAS    VARCHAR(200) NOT NULL,
    DH_CRIACAO      TIMESTAMP(6) NOT NULL,
    CONSTRAINT PK_PACIENTES PRIMARY KEY (ID)
);
ALTER TABLE PACIENTES ADD CONSTRAINT FK_PACIENTES_ENTIDADES FOREIGN KEY (ID_ENTIDADES) REFERENCES ENTIDADES(ID);
ALTER TABLE PACIENTES ADD CONSTRAINT FK_PACIENTES_USUARIOS FOREIGN KEY (ID_USUARIOS) REFERENCES USUARIOS(ID);

CREATE TABLE PLANOS_METAS (
    ID                          NUMERIC(19) NOT NULL,
    ID_ENTIDADES                NUMERIC(19) NOT NULL,
    ID_USUARIOS                 NUMERIC(19) NOT NULL,
    ID_PACIENTES                NUMERIC(19) NOT NULL,
    QTD_DIARIA_CALORIAS         NUMERIC(5) NOT NULL,
    QTD_DIARIA_PROTEINAS        NUMERIC(5) NOT NULL,
    QTD_DIARIA_CARBOIDRATOS     NUMERIC(5) NOT NULL,
    DT_INICIO_META              TIMESTAMP(6) NOT NULL,
    DT_FINAL_META               TIMESTAMP(6),
    DH_CRIACAO                  TIMESTAMP(6) NOT NULL,
    CONSTRAINT PK_PLANOS_METAS PRIMARY KEY (ID)
);
ALTER TABLE PLANOS_METAS ADD CONSTRAINT FK_PLANOS_METAS_ENTIDADES FOREIGN KEY (ID_ENTIDADES) REFERENCES ENTIDADES(ID);
ALTER TABLE PLANOS_METAS ADD CONSTRAINT FK_PLANOS_METAS_USUARIOS FOREIGN KEY (ID_USUARIOS) REFERENCES USUARIOS(ID);
ALTER TABLE PLANOS_METAS ADD CONSTRAINT FK_PLANOS_METAS_PACIENTES FOREIGN KEY (ID_PACIENTES) REFERENCES PACIENTES(ID);

CREATE TABLE PLANOS_METAS_REFEICOES (
    ID                          NUMERIC(19) NOT NULL,
    ID_ENTIDADES                NUMERIC(19) NOT NULL,
    ID_USUARIOS                 NUMERIC(19) NOT NULL,
    ID_PLANOS_METAS             NUMERIC(19) NOT NULL,
    QTD_CALORIAS_REFEICAO       NUMERIC(5) NOT NULL,
    QTD_PROTEINAS_REFEICAO      NUMERIC(5) NOT NULL,
    QTD_CARBOIDRATOS_REFEICAO   NUMERIC(5) NOT NULL,
    TIPO_REFEICAO               VARCHAR(1) NOT NULL,
    CONSTRAINT PK_PLANOS_METAS_REFEICOES PRIMARY KEY (ID)
);
ALTER TABLE PLANOS_METAS_REFEICOES ADD CONSTRAINT FK_PLANOS_METAS_REFEICOES_ENTIDADES FOREIGN KEY (ID_ENTIDADES) REFERENCES ENTIDADES(ID);
ALTER TABLE PLANOS_METAS_REFEICOES ADD CONSTRAINT FK_PLANOS_METAS_REFEICOES_USUARIOS FOREIGN KEY (ID_USUARIOS) REFERENCES USUARIOS(ID);
ALTER TABLE PLANOS_METAS_REFEICOES ADD CONSTRAINT FK_PLANOS_METAS_REFEICOES_PLANOS_METAS FOREIGN KEY (ID_PLANOS_METAS) REFERENCES PLANOS_METAS(ID);

CREATE TABLE RECEITAS (
    ID                          NUMERIC(19) NOT NULL,
    ID_ENTIDADES                NUMERIC(19) NOT NULL,
    ID_USUARIOS                 NUMERIC(19) NOT NULL,
    NOME                        VARCHAR(50) NOT NULL,
    CALORIAS                    NUMERIC(4) NOT NULL,
    PROTEINAS                   NUMERIC(4) NOT NULL,
    CARBOIDRATOS                NUMERIC(4) NOT NULL,
    TIPO_REFEICAO               VARCHAR(1) NOT NULL,
    DESCRICAO                   VARCHAR(1000) NOT NULL,
    DH_CRIACAO                  TIMESTAMP(6) NOT NULL,
    CONSTRAINT PK_RECEITAS PRIMARY KEY (ID)
);
ALTER TABLE RECEITAS ADD CONSTRAINT FK_RECEITAS_ENTIDADES FOREIGN KEY (ID_ENTIDADES) REFERENCES ENTIDADES(ID);
ALTER TABLE RECEITAS ADD CONSTRAINT FK_RECEITAS_USUARIOS FOREIGN KEY (ID_USUARIOS) REFERENCES USUARIOS(ID);

CREATE TABLE PLANOS_METAS_REFEICOES_RECEITAS (
    ID                          NUMERIC(19) NOT NULL,
    ID_ENTIDADES                NUMERIC(19) NOT NULL,
    ID_USUARIOS                 NUMERIC(19) NOT NULL,
    ID_PLANOS_METAS_REFEICOES   NUMERIC(19) NOT NULL,
    ID_RECEITAS                 NUMERIC(19) NOT NULL,
    DESCRICAO                   VARCHAR(1000) NOT NULL,
    QTD_CALORIS_RECEITA         NUMERIC(5) NOT NULL,
    QTD_PROTEINAS_RECEITA       NUMERIC(5) NOT NULL,
    QTD_CARBOIDRATOS_RECEITA    NUMERIC(5) NOT NULL,
    CONSTRAINT PF_PLANOS_METAS_REFEICOES_RECEITAS PRIMARY KEY (ID)
);
ALTER TABLE PLANOS_METAS_REFEICOES_RECEITAS ADD CONSTRAINT FK_PLANOS_METAS_REFEICOES_RECEITAS_ENTIDADES FOREIGN KEY (ID_ENTIDADES) REFERENCES ENTIDADES(ID);
ALTER TABLE PLANOS_METAS_REFEICOES_RECEITAS ADD CONSTRAINT FK_PLANOS_METAS_REFEICOES_RECEITAS_USUARIOS FOREIGN KEY (ID_USUARIOS) REFERENCES USUARIOS(ID);
ALTER TABLE PLANOS_METAS_REFEICOES_RECEITAS ADD CONSTRAINT FK_PLANOS_METAS_REFEICOES_RECEITAS_PLANOS_METAS_REFEICOES FOREIGN KEY (ID_PLANOS_METAS_REFEICOES) REFERENCES PLANOS_METAS_REFEICOES(ID);
ALTER TABLE PLANOS_METAS_REFEICOES_RECEITAS ADD CONSTRAINT FK_PLANOS_METAS_REFEICOES_RECEITAS_RECEITAS FOREIGN KEY (ID_RECEITAS) REFERENCES RECEITAS(ID);