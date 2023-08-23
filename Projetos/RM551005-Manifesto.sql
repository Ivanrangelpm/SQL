
CREATE TABLE aeronave_RM551005(
    matricula VARCHAR2(20) NOT NULL,
    modelo VARCHAR2(100) NOT NULL,
    capacidade INTEGER NOT NULL,
    ano_fabricacao INTEGER NOT NULL,
    companhia_aerea_proprietaria VARCHAR2(100) NOT NULL
);

CREATE TABLE carga_RM551005(
    identificacao_carga INTEGER NOT NULL,
    descricao VARCHAR2(200) NOT NULL,
    peso NUMBER(10,3) NOT NULL,
    volume NUMBER(10,3) NOT NULL
);

CREATE TABLE passageiro_RM551005(
    numero_passageiro INTEGER NOT NULL,
    nome VARCHAR2(100) NOT NULL,
    documento_identificaçao VARCHAR2(20) NOT NULL,
    data_nascimento DATE NOT NULL 
);

CREATE TABLE tripulante_RM551005(
    numero_tripulante INTEGER NOT NULL,
    nome VARCHAR2(100) NOT NULL,
    documento_identificacao VARCHAR2(20),
    funcao VARCHAR2(50)NOT NULL
);

CREATE TABLE voo_RM551005(
    nr_voo INTEGER NOT NULL,
    origem VARCHAR2(100) NOT NULL,
    destino VARCHAR2(100) NOT NULL,
    data_partida DATE NOT NULL,
    data_chegada DATE NOT NULL,
    matricula VARCHAR2(20)
);

DROP TABLE voo_RM551005;

SELECT * FROM voo_RM551005;

CREATE TABLE voo_carga_RM551005(
    id INTEGER NOT NULL,
    nr_voo INTEGER NOT NULL,
    identificacao_carga INTEGER NOT NULL
);

CREATE TABLE voo_tripulante_RM551005(
    nr_voo INTEGER NOT NULL,
    numero_tripulante INTEGER NOT NULL,
    id INTEGER NOT NULL
);

CREATE TABLE voo_passageiro_RM551005(
    nr_voo INTEGER NOT NULL,
    numero_passageiro INTEGER NOT NULL,
    id INTEGER NOT NULL
);

SELECT * FROM voo_passageiro_RM551005;

ALTER TABLE aeronave_RM551005 MODIFY matricula PRIMARY KEY;
ALTER TABLE carga_RM551005 MODIFY identificacao_carga PRIMARY KEY;
ALTER TABLE passageiro_RM551005 MODIFY numero_passageiro PRIMARY KEY; 
ALTER TABLE voo_RM551005 MODIFY nr_voo PRIMARY KEY;
ALTER TABLE voo_carga_RM551005 MODIFY id PRIMARY KEY;
ALTER TABLE voo_tripulante_RM551005 MODIFY id PRIMARY KEY;
ALTER TABLE tripulante_RM551005 MODIFY numero_tripulante PRIMARY KEY;
ALTER TABLE voo_passageiro_RM551005 MODIFY id PRIMARY KEY;

ALTER TABLE voo_RM551005 ADD CONSTRAINT voo_aeronave_FK FOREIGN KEY(matricula) REFERENCES aeronave_RM551005(matricula);
ALTER TABLE voo_carga_RM551005 ADD CONSTRAINT voo_carga_voo_FK FOREIGN KEY(nr_voo) REFERENCES voo_RM551005(nr_voo);
ALTER TABLE voo_carga_RM551005 ADD CONSTRAINT voo_carga_carga_FK FOREIGN KEY(identificacao_carga) REFERENCES carga_RM551005(identificacao_carga);
ALTER TABLE voo_passageiro_RM551005 ADD CONSTRAINT voo_passageiro_voo_FK FOREIGN KEY (nr_voo) REFERENCES voo_RM551005(nr_voo);
ALTER TABLE voo_passageiro_RM551005 ADD CONSTRAINT voo_passageiro_passageiro_FK FOREIGN KEY (numero_passageiro) REFERENCES passageiro_RM551005(numero_passageiro);
ALTER TABLE voo_tripulante_RM551005 ADD CONSTRAINT voo_tripulante_voo_FK FOREIGN KEY (nr_voo) REFERENCES voo_RM551005(nr_voo);
ALTER TABLE voo_tripulante_RM551005 ADD CONSTRAINT voo_tripulante_tripulante_FK FOREIGN KEY (numero_tripulante) REFERENCES tripulante_RM551005(numero_tripulante);


ALTER TABLE aeronave_RM551005 ADD CONSTRAINT ano_fabricacao_CK CHECK (ano_fabricacao > 2000)

INSERT INTO aeronave_RM551005 VALUES ('mat4567', 'Boeing 777', 400, 2015, 'GOL');

SELECT * FROM aeronave_rm551005;
--INSERT INTO aeronave_RM551005 VALUES ('mat326', 'Airbus A320', 500, 1999, 'AZUL');


ALTER TABLE aeronave_RM551005 ADD CONSTRAINT capacidade_CK CHECK (capacidade <= 500);

INSERT INTO aeronave_RM551005 VALUES ('mat399', 'Boeing 787', 489, 2019, 'AZUL');
INSERT INTO aeronave_RM551005 VALUES ('mat398', 'Boeing 787', 489, 2019, 'AZUL');
INSERT INTO aeronave_RM551005 VALUES ('mat397', 'Boeing 787', 489, 2019, 'AZUL');
INSERT INTO aeronave_RM551005 VALUES ('mat396', 'Boeing 787', 489, 2019, 'AZUL');


UPDATE aeronave_rm551005 
    SET capacidade = 400 
    WHERE (capacidade > 500)


ALTER TABLE voo_RM551005 ADD CONSTRAINT data_voo_CK CHECK (data_partida < data_chegada);

INSERT INTO voo_RM551005 VALUES (101, 'BSB','SSP', TO_DATE('2023-08-24', 'YYYY-MM-DD'), TO_DATE('2023-08-26', 'YYYY-MM-DD'), 'mat399' );

SELECT * FROM voo_RM551005;

ALTER TABLE voo_RM551005 ADD data_registro DATE DEFAULT SYSDATE

INSERT INTO voo_RM551005 VALUES (102, 'RIO','SSA', TO_DATE('2023-08-26', 'YYYY-MM-DD'), TO_DATE('2023-08-27', 'YYYY-MM-DD'), 'mat398', TO_DATE('2023-08-21', 'YYYY-MM-DD'));
--INSERT INTO voo_RM551005 VALUES (103, 'RIO','SSA', TO_DATE('2023-08-26', 'YYYY-MM-DD'), TO_DATE('2023-08-27', 'YYYY-MM-DD'), 'mat398', TO_DATE('2023-08-21', 'YYYY-MM-DD'));    

ALTER TABLE voo_RM551005 ADD CONSTRAINT data_registro_ck CHECK (data_registro <= data_partida);

ALTER TABLE voo_RM551005 ADD CONSTRAINT matricula_unique UNIQUE (matricula);

ALTER TABLE voo_passageiro_RM551005 ADD CONSTRAINT passageiro_unique UNIQUE (numero_passageiro);

ALTER TABLE voo_tripulante_RM551005 ADD CONSTRAINT tripulante_unique UNIQUE (numero_tripulante);

ALTER TABLE voo_RM551005 ADD CONSTRAINT destino_ck CHECK(origem != destino);



CREATE TABLE modelos_aeronave_RM551005(
    id INTEGER NOT NULL,
    modelo VARCHAR2(30) NOT NULL,
    capacidade INTEGER NOT NULL,
    ano_fabricacao INTEGER NOT NULL,
    pais_origem VARCHAR2(20)
);

DROP TABLE modelos_aeronave_RM551005;

TRUNCATE TABLE aeronave_RM551005;
SELECT * FROM aeronave_RM551005;
TRUNCATE TABLE voo_RM551005;

ALTER TABLE aeronave_RM551005 DROP COLUMN modelo;

ALTER TABLE modelos_aeronave_RM551005 MODIFY modelo PRIMARY KEY;

/* -- > Crie os scripts para atender as solicitações abaixo:

 1 - Adicione a chave primária em todas as entidades utilizando o comando ALTER;
 2 - Adicione todas as chave estrangeiras (FOREIGN KEYS ou Chave de referência)
 3 - Adicione uma chave de verificação (CHECK) para o ano de fabricação da aeronave maior que 2000;
 4 - Adicione uma chave de verificação (CHECK) para a capacidade de passageiros na aeronave menor ou igual a 500;
 5 - Adicione uma chave de verificação (CHECK) no voo onde a data de chegada deve ser superior a data de partida

 6 - Sabendo que o comando SYSDATE, adicione um novo atributo nomeado como data_registro na
     tabela tbl_voo_RMxxxx, este atributo deverá ter o valor padrão de SYSDATE, e adicione
     uma chave de verificação do campo data_partida maior ou igual a data_registro?

 7 - Adicione uma restrição unica na tabela de voos indicando que uma aeronave não pode efetuar duas viagens na mesma data.
 8 - Adicione uma restrição Unica (chave única) para passageiros no voo, evitando assim varios registros duplicados.
 9 - Adicione uma restrição Unica (chave única) para tripulantes no voo, evitando assim varios registros duplicados.
10 - Adicione uma verificação no tbl_voo onde a origem e o destino sejam diferentes
11 - Crie uma entidade para adicionar os modelos para aeronaves contendo um ID, modelo, capacidade de passageiros, ano de 
     fabricação e pais de origem, altere a estrutura da tabela tbl_aeronave, referenciando a tabela de modelos, crie as
	 verificações adicionadas anteriormente e remova as informações duplicadas (desnecessárias).
*/




















