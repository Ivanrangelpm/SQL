CREATE TABLE tbl_departamentos(
    id_departamento INTEGER PRIMARY KEY NOT NULL,
    nome VARCHAR2(30)
);

DESCRIBE tbl_departamentos;

DROP TABLE tbl_departamentos;

SELECT * FROM tbl_departamentos;

INSERT INTO tbl_departamentos VALUES(1, 'RH');
INSERT INTO tbl_departamentos VALUES(2, 'TI');
INSERT INTO tbl_departamentos VALUES(3, 'financeiro');

CREATE TABLE tbl_funcoes(
    id_funcao INTEGER PRIMARY KEY NOT NULL,
    descricao VARCHAR2(30) NOT NULL
);

DROP TABLE tbl_funcoes;

SELECT * FROM tbl_funcoes;

INSERT INTO tbl_funcoes VALUES(20, 'suporte tecnico');
INSERT INTO tbl_funcoes VALUES(21, 'secretaria');
INSERT INTO tbl_funcoes VALUES(22, 'advogado');

CREATE TABLE tbl_tipo_relogio(
    id_tipo_relogio INTEGER NOT NULL PRIMARY KEY,
    descricao VARCHAR2(10) NOT NULL
);

DESCRIBE tbl_tipo_relogio;

DROP TABLE tbl_tipo_relogio;

SELECT * FROM tbl_tipo_relogio;

INSERT INTO tbl_tipo_relogio VALUES(111, 'alarme');
INSERT INTO tbl_tipo_relogio VALUES(112, 'mesa');
INSERT INTO tbl_tipo_relogio VALUES(113, 'parede');

CREATE TABLE tbl_relogios_pontos(
    id_relogio INTEGER PRIMARY KEY NOT NULL,
    descricao VARCHAR2(30) NOT NULL
);

DESCRIBE tbl_relogios_pontos;

DROP TABLE tbl_relogios_pontos;

SELECT * FROM tbl_relogios_pontos;

ALTER TABLE tbl_relogios_pontos ADD(
    id_tipo_relogio INTEGER REFERENCES tbl_tipo_relogio(id_tipo_relogio)
);

INSERT INTO tbl_relogios_pontos VALUES(11, 'mesas', 112);
INSERT INTO tbl_relogios_pontos VALUES(12, 'elevadores', 113);
INSERT INTO tbl_relogios_pontos VALUES(13, 'refeitorio', 113);

CREATE TABLE tbl_feriados(
    dt_feriado DATE PRIMARY KEY NOT NULL,
    descricao VARCHAR2(30) NOT NULL
);

DESCRIBE tbl_feriados;

DROP TABLE tbl_feriados;

SELECT * FROM tbl_feriados;

INSERT INTO tbl_feriados VALUES(TO_DATE('2023-04-21', 'YYYY-MM-DD'), 'Tiradentes');
INSERT INTO tbl_feriados VALUES(TO_DATE('2023-06-08', 'YYYY-MM-DD'), 'Corpus Christi');
INSERT INTO tbl_feriados VALUES(TO_DATE('2023-09-07', 'YYYY-MM-DD'), 'Independencia do Brasil');


CREATE TABLE tbl_motivo_folga(
    id_motivo_folga INTEGER PRIMARY KEY NOT NULL,
    descricao VARCHAR2(30) NOT NULL
);

DESCRIBE tbl_motivo_folga;

DROP TABLE tbl_motivo_folga;

SELECT * FROM tbl_motivo_folga;

INSERT INTO tbl_motivo_folga VALUES (31, 'Atestado');
INSERT INTO tbl_motivo_folga VALUES (32, 'Gravidez');
INSERT INTO tbl_motivo_folga VALUES (33, 'Licenca maternidade');

CREATE TABLE tbl_telefones(
    id_telefone INTEGER PRIMARY KEY NOT NULL,
    numero_telefone VARCHAR2(20) NOT NULL,
    observacao VARCHAR2(30)
);

DESCRIBE tbl_telefones;

DROP TABLE tbl_telefones;

SELECT * FROM tbl_telefones;

INSERT INTO tbl_telefones VALUES('41', 11992342345, 'telefone de casa');
INSERT INTO tbl_telefones VALUES('42', 11992334567,'da mae');
INSERT INTO tbl_telefones VALUES('43', 11992343478, 'celular');

CREATE TABLE tbl_registro_ponto (
    id_registro_ponto INTEGER PRIMARY KEY NOT NULL,
    data DATE NOT NULL
);

DESCRIBE tbl_registro_ponto;

DROP TABLE tbl_registro_ponto;

SELECT * FROM tbl_registro_ponto;

INSERT INTO tbl_registro_ponto VALUES (51,TO_DATE('2023-08-22', 'YYYY-MM-DD'));
INSERT INTO tbl_registro_ponto VALUES (52,TO_DATE('2023-08-21', 'YYYY-MM-DD'));
INSERT INTO tbl_registro_ponto VALUES (53,TO_DATE('2023-08-20', 'YYYY-MM-DD'));

CREATE TABLE tbl_folgas(
    id_folga INTEGER,
    data_saida DATE NOT NULL,
    data_retorno DATE NOT NULL,
    data_aprovacao DATE
);

DESCRIBE tbl_folgas;

DROP TABLE tbl_folgas;

SELECT * FROM tbl_folgas;

INSERT INTO tbl_folgas VALUES (61, TO_DATE('2023-08-26', 'YYYY-MM-DD'), TO_DATE('2023-08-28', 'YYYY-MM-DD'),TO_DATE('2023-08-07', 'YYYY-MM-DD') );
INSERT INTO tbl_folgas VALUES (62, TO_DATE('2023-08-28', 'YYYY-MM-DD'), TO_DATE('2023-08-29', 'YYYY-MM-DD'),TO_DATE('2023-08-05', 'YYYY-MM-DD') );
INSERT INTO tbl_folgas VALUES (63, TO_DATE('2023-08-28', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'),TO_DATE('2023-08-06', 'YYYY-MM-DD') );

CREATE TABLE tbl_funcionarios(
    id_funcionarios INTEGER PRIMARY KEY NOT NULL,
    nome VARCHAR2(30) NOT NULL,
    endereco VARCHAR2(50) NOT NULL,
    numero VARCHAR2(30) NOT NULL,
    bairro VARCHAR2(40) NOT NULL,
    complemento VARCHAR2(30), 
    cidade VARCHAR2(30)NOT NULL,
    estado VARCHAR2(2)  NOT NULL,
    telefone VARCHAR2(15) NOT NULL,
    salario NUMBER(10,2) NOT NULl
);

DESCRIBE tbl_funcionarios;

DROP TABLE tbl_funcionarios;

SELECT * FROM tbl_funcionarios;

