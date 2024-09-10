
# Desafio Target Sistemas


### Desafio 1:



###### int INDICE = 12, SOMA = 0, K = 1;

###### enquanto K < INDICE faça

###### { K = K + 1; SOMA = SOMA + K;}

###### imprimir(SOMA);  ->  soma = 12

### Desafio 2:

Descubra a lógica e complete o próximo elemento:

a) 1, 3, 5, 7, __9

b) 2, 4, 8, 16, 32, 64, ____128

c) 0, 1, 4, 9, 16, 25, 36, ____49

d) 4, 16, 36, 64, ____100

e) 1, 1, 2, 3, 5, 8, ____13

f) 2,10, 12, 16, 17, 18, 19, ____20

### Desafio 3:

Resaposta no diretorio lib 

### Desafio 4:

### Diagrama (Modelo Entidade-Relacionamento):

**Tabela: clientes**
----------------

| cliente_id (PK)  |
| razao_social     |
| estado_id (FK)  |

**Tabela: telefones**
-----------------

| telefone_id (PK)  |
| cliente_id (FK)    |
| tipo_id (FK)        |
| numero              |

**Tabela: tipos_telefone**
----------------------

| tipo_id (PK)     |
| descricao        |

**Tabela: estados**
---------------

| estado_id (PK)   |
| sigla                  |
| nome                |

- clientes.estado_id → estados.estado_id (FK)
- telefones.cliente_id → clientes.cliente_id (FK)
- telefones.tipo_id → tipos_telefone.tipo_id (FK)

1. Criação da Tabela clientes:

CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(255) NOT NULL,
    estado_id INT,
    FOREIGN KEY (estado_id) REFERENCES estados(estado_id)
);

CREATE TABLE telefones (
    telefone_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    tipo_id INT,
    numero VARCHAR(20) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (tipo_id) REFERENCES tipos_telefone(tipo_id)
);

3. Criação da Tabela tipos_telefone:

CREATE TABLE tipos_telefone (
    tipo_id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL
);

4. Criação da Tabela estados:

CREATE TABLE estados (
    estado_id INT PRIMARY KEY AUTO_INCREMENT,
    sigla CHAR(2) NOT NULL,
    nome VARCHAR(100) NOT NULL
);

5. Comando SQL para Buscar Clientes e Telefones do Estado de São Paulo:

SELECT
    c.cliente_id,
    c.razao_social,
    t.numero AS telefone
FROM
    clientes c
JOIN
    telefones t ON c.cliente_id = t.cliente_id
JOIN
    estados e ON c.estado_id = e.estado_id
WHERE
    e.sigla = 'SP';


#### Desafio 5:

Resposta: Embora o carro seja mais rápido, ele é prejudicado pelo tempo extra que gasta nos pedágios, enquanto o caminhão mantém uma velocidade constante sem obstáculos. Quando eles se cruzam, o caminhão estará mais próximo de Ribeirão Preto.
