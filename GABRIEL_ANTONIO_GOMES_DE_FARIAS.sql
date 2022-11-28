/*Gabriel Antonio Gomes de Farias*/

DROP DATABASE IF EXISTS Rede_Hotel;
CREATE DATABASE Rede_Hotel;
USE Rede_Hotel;

CREATE TABLE Hotel (
    Codigo_Hotel INTEGER PRIMARY KEY,
    Cidade VARCHAR(90),
    Bairro VARCHAR(60),
    Rua VARCHAR(150),
    Numero_Rua VARCHAR(20),
    Classificacao INTEGER
);

CREATE TABLE Funcionario (	
	Codigo_Funcionario INTEGER PRIMARY KEY,
    Nome VARCHAR(100),
    CPF CHAR(11),
    Data_de_Nascimento DATE,
    Estado_Funcionario VARCHAR(60),
    Horario_Entrada TIMESTAMP,
    Horario_Saida TIMESTAMP
);

CREATE TABLE Cargo (
	Codigo_Cargo INTEGER PRIMARY KEY,
    Nome_Cargo VARCHAR(50),
    Salario DOUBLE
);

CREATE TABLE Cliente (
    Codigo_Cliente INTEGER PRIMARY KEY,
    Nome VARCHAR(100),
    CPF CHAR(11),
    Data_de_Nascimento DATE,
    Telefone VARCHAR(20),
    E_mail VARCHAR(60)
);

CREATE TABLE Setor (
    Codigo_Setor INTEGER PRIMARY KEY,
    Nome_Setor VARCHAR(40),
    Tipo_Setor VARCHAR(20),
    Valor_Setor DOUBLE,
    Estado_Setor VARCHAR(30)
);

CREATE TABLE Reserva (
    Codigo_Reserva INTEGER PRIMARY KEY,
    Data_Check_In DATE,
    Data_Check_Out DATE,
    Quantidade_Hospedes INTEGER
);

CREATE TABLE Evento (
    Codigo_Evento INTEGER PRIMARY KEY,
    Data_Evento DATE,
    Quantidade_Convidados INTEGER,
    Tipo_Evento VARCHAR(20),
    Valor_Evento DOUBLE
);

CREATE TABLE Suite (
    Codigo_Suite INTEGER PRIMARY KEY,
    Numero_Suite VARCHAR(30),
    Tipo_Suite VARCHAR(30),
    Valor_Suite DOUBLE,
    Estado_Suite VARCHAR(50)
);

CREATE TABLE Hospede (
    Codigo_Hospede INTEGER PRIMARY KEY,
    Nome VARCHAR(100),
    CPF CHAR(11),
    Data_de_Nascimento DATE,
    Estado_Hospede VARCHAR(50)
);

CREATE TABLE Item_Cardapio (
    Codigo_Item INTEGER PRIMARY KEY,
    Nome_Item VARCHAR(60),
    Tipo_Item VARCHAR(60),
    Valor_Item DOUBLE
);

CREATE TABLE Servico_Hospedagem (
    Codigo_Servico INTEGER PRIMARY KEY,
    Descricao_Servico VARCHAR(100),
    Tipo_Servico VARCHAR(50),
    Valor_Servico DOUBLE,
    Data_Requisicao TIMESTAMP,
    Data_Agendada TIMESTAMP,
    Data_Termino TIMESTAMP,
    Estado_Servico VARCHAR(80)
);

CREATE TABLE ClienteEvento (
    Codigo_Cliente INTEGER,
    Codigo_Evento INTEGER,
    primary key (Codigo_Cliente,Codigo_Evento),
    foreign key (Codigo_Cliente) references Cliente(Codigo_Cliente),
	foreign key (Codigo_Evento) references Evento(Codigo_Evento)
);

CREATE TABLE ReservaSuite (
    Codigo_Reserva INTEGER,
	Codigo_Suite INTEGER,
    primary key (Codigo_Reserva,Codigo_Suite),
	foreign key (Codigo_Reserva) references Reserva(Codigo_Reserva),
    foreign key (Codigo_Suite) references Suite(Codigo_Suite)
);

CREATE TABLE HotelFuncionario (
    Codigo_Hotel INTEGER,
    Codigo_Funcionario INTEGER,
    primary key (Codigo_Hotel, Codigo_Funcionario),
    foreign key (Codigo_Hotel) references Hotel(Codigo_Hotel),
    foreign key (Codigo_Funcionario) references Funcionario(Codigo_Funcionario)
);

CREATE TABLE HotelSetor (
    Codigo_Hotel INTEGER,
    Codigo_Setor INTEGER,
    primary key (Codigo_Hotel, Codigo_Setor),
	foreign key (Codigo_Hotel) references Hotel(Codigo_Hotel),
    foreign key (Codigo_Setor) references Setor(Codigo_Setor)
);

CREATE TABLE EventoSetor (
    Codigo_Evento INTEGER,
	Codigo_Setor INTEGER,
    primary key (Codigo_Evento, Codigo_Setor),
	foreign key (Codigo_Evento) references Evento(Codigo_Evento),
    foreign key (Codigo_Setor) references Setor(Codigo_Setor)
);

CREATE TABLE FuncionarioCargo (
	Codigo_Funcionario INTEGER,
    Codigo_Cargo INTEGER,
    primary key (Codigo_Funcionario, Codigo_Cargo),
    foreign key (Codigo_Funcionario) references Funcionario(Codigo_Funcionario),
    foreign key (Codigo_Cargo) references Cargo(Codigo_Cargo)
);

CREATE TABLE FuncionarioSetor (
    Codigo_Funcionario INTEGER,
    Codigo_Setor INTEGER,
    primary key (Codigo_Funcionario, Codigo_Setor),
    foreign key (Codigo_Funcionario) references Funcionario(Codigo_Funcionario),
    foreign key (Codigo_Setor) references Setor(Codigo_Setor)
);

CREATE TABLE HotelReserva(
	Codigo_Hotel INTEGER,
    Codigo_Reserva INTEGER,
    primary key (Codigo_Hotel, Codigo_Reserva),
    foreign key (Codigo_Hotel) references Hotel(Codigo_Hotel),
    foreign key (Codigo_Reserva) references Reserva(Codigo_Reserva)
);

CREATE TABLE HotelEvento (
    Codigo_Hotel INTEGER,
    Codigo_Evento INTEGER,
    primary key (Codigo_Hotel, Codigo_Evento),
    foreign key (Codigo_Hotel) references Hotel(Codigo_Hotel),
    foreign key (Codigo_Evento) references Evento(Codigo_Evento)
);

CREATE TABLE SuiteHospede (
    Codigo_Suite INTEGER,
    Codigo_Hospede INTEGER,
    primary key (Codigo_Suite,Codigo_Hospede),
    foreign key (Codigo_Suite) references Suite(Codigo_Suite),
    foreign key (Codigo_Hospede) references Hospede(Codigo_Hospede)
);

CREATE TABLE HotelCliente (
    Codigo_Hotel INTEGER,
    Codigo_Cliente INTEGER,
	primary key (Codigo_Hotel,Codigo_Cliente),
    foreign key (Codigo_Hotel) references Hotel(Codigo_Hotel),
    foreign key (Codigo_Cliente) references Cliente(Codigo_Cliente)
);

CREATE TABLE ClienteReserva (
    Codigo_Cliente INTEGER,
    Codigo_Reserva INTEGER,
	primary key (Codigo_Cliente,Codigo_Reserva),
    foreign key (Codigo_Cliente) references Cliente(Codigo_Cliente),
    foreign key (Codigo_Reserva) references Reserva(Codigo_Reserva)
);

CREATE TABLE HotelHospede (
	Avaliacao_Hotel INTEGER,
    Codigo_Hotel INTEGER,
    Codigo_Hospede INTEGER,
	primary key (Codigo_Hotel,Codigo_Hospede),
    foreign key (Codigo_Hotel) references Hotel(Codigo_Hotel),
    foreign key (Codigo_Hospede) references Hospede(Codigo_Hospede)
);

CREATE TABLE HotelSuite (
    Codigo_Hotel INTEGER,
    Codigo_Suite INTEGER,
	primary key (Codigo_Hotel,Codigo_Suite),
    foreign key (Codigo_Hotel) references Hotel(Codigo_Hotel),
    foreign key (Codigo_Suite) references Suite(Codigo_Suite)
);

CREATE TABLE Comanda (
	Valor_Total DOUBLE,
    Codigo_Hospede INTEGER,
    Codigo_Item INTEGER,
	primary key (Codigo_Hospede,Codigo_Item),
    foreign key (Codigo_Hospede) references Hospede(Codigo_Hospede),
    foreign key (Codigo_Item) references Item_Cardapio(Codigo_Item)
);

CREATE TABLE HospedeServico_Hospedagem (
    Codigo_Hospede INTEGER,
    Codigo_Servico INTEGER,
	primary key (Codigo_Hospede,Codigo_Servico),
    foreign key (Codigo_Hospede) references Hospede(Codigo_Hospede),
    foreign key (Codigo_Servico) references Servico_Hospedagem(Codigo_Servico)
);
 
insert into Hotel values(1,"Cornélio Procópio","Centro","Rua das Couves","100", 10);
insert into Hotel values(2,"Curitiba","Água Verde","Rua das Couves","1001", 9);
insert into Hotel values(3,"Londrina","Gleba Palhano","Rua das Couves","300", 4);
insert into Hotel values(4,"Rio de Janeiro","Maracana", "Rua das Couves", "400", 7);

insert into Cliente values(1,'João das Couves','01234567890','1974-10-31','5543999990000','joaocouves@gabmail.com.br');
insert into Cliente values(2,'Bastião das Lavouras','01234567890','1974-10-31','5543999990000','bastlavouras@gabmail.com.br');

insert into Funcionario values(1,'Quandale Dingle','12345678901','1960-06-09','Horário Cumprido','2020-05-01 08:00:00','2020-05-01 18:00:00');
insert into Funcionario values(2,'Quanlinling Dingle','12345678901','1961-06-09','Horário Cumprido','2020-05-01 08:00:00','2020-05-01 18:00:00');
insert into Funcionario values(3,'John Wick','12345678901','1980-06-09','Horário Cumprido','2020-05-01 13:00:00','2020-05-01 23:59:00');
insert into Funcionario values(4,'João Morbius','12345678901','1962-06-09','Horário Cumprido','2020-05-01 00:00:00','2020-05-01 13:00:00');
insert into Funcionario values(5,'Anacleto Felano','12345678901','1981-06-09','Absente','2020-09-11 08:00:00','2020-09-11 18:00:00');
insert into Funcionario values(6,'Gordom Ramsay','12345678901','1973-06-09','Absente','2020-09-11 07:30:00','2020-09-11 16:00:00');
insert into Funcionario values(7,'Zézinho das Couves','12345678901','1969-06-09','Absente','2020-09-11 6:00:00','2020-09-11 17:00:00');
insert into Funcionario values(8,'Jill Stingray','12345678901','1998-06-09','Horário Cumprido','2020-05-01 17:00:00','2020-05-01 23:00:00');
insert into Funcionario values(9,'Dorothy Haze','12345678901','1969-06-09','Horário Cumprido','2020-05-01 17:00:00','2020-05-01 23:00:00');

insert into Cargo values(1, 'Faxineiro', 800.00);
insert into Cargo values(2, 'Segurança', 2000.00);
insert into Cargo values(3, 'Barista', 1800.00); 
insert into Cargo values(4, 'Recepcionista', 1200.00);
insert into Cargo values(5, 'Garçom', 800.00);
insert into Cargo values(6, 'Cozinheiro', 2000.00);

insert into FuncionarioCargo values(1,1);
insert into FuncionarioCargo values(4,2);
insert into FuncionarioCargo values(8,3);
insert into FuncionarioCargo values(7,4);
insert into FuncionarioCargo values(9,3);
insert into FuncionarioCargo values(3,2);
insert into FuncionarioCargo values(5,5);
insert into FuncionarioCargo values(2,1);
insert into FuncionarioCargo values(6,6);

insert into HotelFuncionario values(1, 1);
insert into HotelFuncionario values(1, 4);
insert into HotelFuncionario values(1, 8);
insert into HotelFuncionario values(2, 7);
insert into HotelFuncionario values (2, 9);
insert into HotelFuncionario values(2, 6);
insert into HotelFuncionario values (3,5);
insert into HotelFuncionario values(3, 3);
insert into HotelFuncionario values (4,2);



insert into Setor values(1,'Piscina','Recreação',300.00,'Aberto');
insert into Setor values(2,'Salão de Festas', 'Recreação', 400, 'Aberto');
insert into Setor values(3,'Salão de Reunião','Negócios',1350.00,'Fechado');


insert into HotelSetor values(1,1);
insert into HotelSetor values(1,2);
insert into HotelSetor values(2,3);


insert into Evento values(1,'2022-10-31',44,'Promocional',10000.00);
insert into Evento values(2,'2022-10-31',70,'Promocional',10000.00);
insert into Evento values(3,'2022-10-31',120,'Promocional',10000.00);
insert into Evento values(4,'2022-10-31',50,'Promocional',10000.00);

insert into EventoSetor values(1,1);
insert into EventoSetor values(1,2);
insert into EventoSetor values(2,3);

insert into Reserva values(1,'2022-06-28','2022-07-10',2);
insert into Reserva values(2,'2022-06-28','2022-07-10',3);
insert into Reserva values(3,'2022-06-28','2022-07-10',1);


insert into ClienteReserva values(1,1);
insert into ClienteReserva values(1,2);
insert into ClienteReserva values(2,3);

insert into Suite values(1,'N° 1001','Padrão',100.00,'Desocupada');
insert into Suite values(2,'N° 2002','Padrão',100.00,'Desocupada');
insert into Suite values(3,'N° 1337','Luxo',800.00,'Desocupada');
insert into Suite values(4,'N° 789','Padrão',400.00,'Desocupada');
insert into Suite values(5,'N° 606','Luxo',100.00,'Desocupada');
insert into Suite values(6,'N° 101','Acessibilidade',100.00,'Desocupada');
insert into Suite values(7,'N° 909','Acessibilidade',100.00,'Ocupada');

insert into ReservaSuite values(1,3);
insert into ReservaSuite values(2,3);
insert into ReservaSuite values(1,2);
insert into ReservaSuite values(2,1);
insert into ReservaSuite values(1,4);

insert into Hospede values (1,'José', '12345678901', '1990-01-20','Check-in realizado');
insert into Hospede values (2,'João', '23456789012', '1989-01-20','Check-in realizado');
insert into Hospede values (3,'Orácio', '34567890123', '1960-01-20','Check-in realizado');
insert into Hospede values (4,'Anacleto', '45678901234', '2007-01-20','Check-in realizado');
insert into Hospede values (5,'Fábio', '56789012345', '2002-01-20','Check-in realizado');


insert into Servico_Hospedagem values(1,'Abastacer frigobar','Quarto',50.00,'2022-03-01 13:01:02','2022-03-01 14:30:00','2022-03-01 15:43:02','Concluido');
insert into Servico_Hospedagem values(2,'Limpeza banheiro','Quarto',50.00,'2022-03-01 13:01:02','2022-03-01 14:30:00','2022-03-01 15:43:02','Concluido');
insert into Servico_Hospedagem values(3,'Delivery de refeição','Quarto',50.00,'2022-03-01 13:01:02','2022-03-01 14:30:00','2022-03-01 15:43:02','Concluido');
insert into Servico_Hospedagem values(4,'Delivery de café','Quarto',50.00,'2022-03-01 13:01:02','2022-03-01 14:30:00','2022-03-01 15:43:02','Concluido');
insert into Servico_Hospedagem values(5,'Delivery de encomenda','Quarto',50.00,'2022-03-01 13:01:02','2022-03-01 14:30:00','2022-03-01 15:43:02','Concluido');
insert into Servico_Hospedagem values(6,'Estacionar veículo','Garagem',50.00,'2022-03-01 13:01:02','2022-03-01 14:30:00','2022-03-01 15:43:02','Cancelado');
insert into Servico_Hospedagem values(7,'Internet 100MBPS','Rede',50.00,'2022-03-01 13:01:02','2022-03-01 14:30:00','2022-03-01 15:43:02','Cancelado');
insert into Servico_Hospedagem values(8,'Delivery','Quarto',50.00,'2022-03-01 13:01:02','2022-03-01 14:30:00','2022-03-01 15:43:02','Cancelado');
insert into Servico_Hospedagem values(9,'Internet 100MBPS','Rede',50.00,'2022-03-01 13:01:02','2022-03-01 14:30:00','2022-03-01 15:43:02','Cancelado');

insert into HotelSuite values(1,1);
insert into HotelSuite values(1,2);
insert into HotelSuite values(2,3);
insert into HotelSuite values(2,4);
insert into HotelSuite values(3,5);
insert into HotelSuite values(3,6);
insert into HotelSuite values(4,7);


insert into Item_Cardapio values(1,'Coca-cola','Industrializado', 10.00);
insert into Item_Cardapio values(2, 'X-Burguer', 'Cozinha', 25.00);
insert into Item_Cardapio values(3,'Coca-cola','Industrializado', 10.00);

insert into Comanda values(120.0, 1, 1);
insert into Comanda values(300.0, 2, 3);
insert into Comanda values(500.0, 1,2);

insert into HotelHospede values(10,1,1);
insert into HotelHospede values(10,2,2);
insert into HotelHospede values(10,3,3);
insert into HotelHospede values(10,4,4);
insert into HotelHospede values(10,1,5);

insert into HospedeServico_Hospedagem values(1,1);
insert into HospedeServico_Hospedagem values(1,2);
insert into HospedeServico_Hospedagem values(2,3);

-- Queries / Informações 

-- 1. Quais os hoteis com avaliação igual ou superior à 8? 
Select H.Codigo_Hotel, H.Cidade, H.Classificacao 
From Hotel H 
Where H.Classificacao >= 8
Order by H.Codigo_Hotel;

-- 2. Qual o cargo de funcionário que cumpre mais horas no total?
Select C.Nome_Cargo , sum(TIMESTAMPDIFF(hour, F.Horario_Entrada, F.Horario_Saida)) as TotalHoras
From Funcionario F, Cargo C, FuncionarioCargo FC
Where F.Codigo_Funcionario = FC.Codigo_Funcionario and C.Codigo_Cargo = FC.Codigo_Cargo
Group by C.Nome_Cargo
Order by TotalHoras desc
Limit 1;

-- 3. Qual a despeza do salário dos funcionários de cada hotel?
Select H.Codigo_Hotel, Sum(C.Salario) as Despesa_Empregados
From Hotel H, HotelFuncionario HF, Funcionario F, Cargo C, FuncionarioCargo FC
Where F.Codigo_Funcionario = HF.Codigo_Funcionario and H.Codigo_Hotel = HF.Codigo_Hotel and F.Codigo_Funcionario = FC.Codigo_Funcionario and C.Codigo_Cargo = FC.Codigo_Cargo
Group by H.Codigo_Hotel
Order by H.Codigo_Hotel;

-- 4. Qual o tipo de serviço menos requisitados?
Select S_H.Descricao_Servico, S_H.Tipo_Servico, count(*) as Qtd_Requisicoes
From Servico_Hospedagem S_H
Group by S_H.Tipo_Servico
Order by count(*) 
Limit 1;

-- 5. Qual o tipo de serviço mais cancelado?
Select S_H.Tipo_Servico, count(*) as Qtd_Cancelamento
From Servico_Hospedagem S_H
Where S_H.Estado_Servico = "Cancelado"
Group by S_H.Tipo_Servico
Order by count(*) desc
Limit 1;

-- 6.	Quais as suítes disponíveis em cada hotel? 
Select H.Codigo_Hotel, S.Numero_Suite, S.Tipo_Suite
From Hotel H, Suite S, HotelSuite HS
Where S.Codigo_Suite = HS.Codigo_Suite and H.Codigo_Hotel = HS.Codigo_Hotel
Order by H.Codigo_Hotel;

-- 7. Qual o tipo de suíte mais reservada?
Select S.Tipo_Suite, count(*) as Qtd_Reservas
From Suite S, ReservaSuite RS
Where S.Codigo_Suite = RS.Codigo_Suite
Group by S.Tipo_Suite
Order by count(*) desc
Limit 1;

-- 8. Quantos setores que cada hotel possui?
Select H.Codigo_Hotel, count(*) as Qtd_Setores
From Hotel H, Setor S, HotelSetor HS
Where H.Codigo_Hotel = HS.Codigo_Hotel and S.Codigo_Setor = HS.Codigo_Setor
Group by H.Codigo_Hotel
Order by H.Codigo_Hotel;

-- 9. Qual o item do cardápio que mais vende?
Select I_C.Nome_Item, count(*) as Vendas
From Item_Cardapio I_C, Comanda C 
Where I_C.Codigo_Item = C.Codigo_Item
Group by I_C.Nome_Item
Order by Vendas desc
Limit 1;

-- 10. Quais os itens que cada hospede consumiu?
Select H.Codigo_Hospede, H.Nome, I_C.Nome_Item
From Hospede H, Item_Cardapio I_C, Comanda C
Where H.Codigo_Hospede = C.Codigo_Hospede and I_C.Codigo_Item = C.Codigo_Item
Order by H.Codigo_Hospede; 

-- 11. Qual o Cliente que realizou mais reservas?
Select C.Nome, count(*) as Qtd_Reservas
From Cliente C, ClienteReserva CR
Where C.Codigo_Cliente = CR.Codigo_Cliente 
Group by C.Nome
Order by Qtd_Reservas desc
Limit 1;

-- 12. Qual o Evento do tipo "Promocional" com o maior número de convidados?
Select E.Codigo_Evento, E.Quantidade_Convidados
From Evento E
Where E.Tipo_Evento = "Promocional"
Order by E.Quantidade_Convidados desc
Limit 1;

-- 13. Qual o valor total e quantidade de setores alocados em cada evento?
Select E.Codigo_Evento, sum(S.Valor_Setor) as Total_Alocacao, count(*) as Qtd_Setores
From Evento E, EventoSetor ES, Setor S 
Where E.Codigo_Evento = ES.Codigo_Evento and S.Codigo_Setor = ES.Codigo_Setor
Group by E.Codigo_Evento
Order by E.Codigo_Evento;

-- 14. Qual a quantidade de hospedes em cada hotel?
Select HT.Codigo_Hotel, count(*) as Qtd_Hospedes
From Hotel HT, HotelHospede HH, Hospede HS 
Where HT.Codigo_Hotel = HH.Codigo_Hotel and HS.Codigo_Hospede = HH.Codigo_Hospede
Group by HT.Codigo_Hotel
Order by HT.Codigo_Hotel;

-- 15. Qual o tipo de setor mais comum?
Select S.Tipo_Setor, count(*) as Quantidade
From Setor S
Group by S.Tipo_Setor
Order by Quantidade desc
Limit 1;

-- 16. Quais as suítes que estão desocupadas em cada hotel ?
Select H.Codigo_Hotel, S.Numero_Suite, S.Tipo_Suite 
From Hotel H, HotelSuite HS, Suite S 
Where H.Codigo_Hotel = HS.Codigo_Hotel and S.Codigo_Suite = HS.Codigo_Suite and S.Estado_Suite = "Desocupada"
Order by H.Codigo_Hotel;

-- 17. Qual o hospede que mais requisitou serviços de hospedagem ?
Select H.Codigo_Hospede, H.Nome, count(*) as Qtd_Requisicoes 
From Hospede H, HospedeServico_Hospedagem HSH, Servico_Hospedagem S_H
Where H.Codigo_Hospede = HSH.Codigo_Hospede and S_H.Codigo_Servico = HSH.Codigo_Servico
Group by H.Codigo_Hospede
Order by Qtd_Requisicoes desc
Limit 1;

-- 18. Quais os nomes e respectivos cargos de funcionário em cada hotel?
Select H.Codigo_Hotel, F.Codigo_Funcionario, F.Nome, C.Nome_Cargo
From Funcionario F, HotelFuncionario HF, Hotel H, Cargo C, FuncionarioCargo FC
Where F.Codigo_Funcionario = HF.Codigo_Funcionario and H.Codigo_Hotel = HF.Codigo_Hotel and F.Codigo_Funcionario = FC.Codigo_Funcionario and C.Codigo_Cargo = FC.Codigo_Cargo
Order by H.Codigo_Hotel;

-- 19. Quais os eventos com pelo menos 100 convidados em 2022? 
Select E.Codigo_Evento, E.Quantidade_Convidados, E.Data_Evento
From Evento E
Where E.Quantidade_Convidados >= 100 and year(E.Data_Evento) = 2022
Order by E.Codigo_Evento;

-- 20. Quais os funcionários com idade maior ou igual à 60 anos?
Select F.Nome, floor(datediff(now(), F.Data_de_Nascimento)/365) as Idade
From Funcionario F
-- Função floor(datediff) serve para obter a idade
Where floor(datediff(now(), F.Data_de_Nascimento)/365) >= 60
Order by Idade desc;

-- 21.	Qual o nome, idade e CPF de todos os hospedes em cada hotel?

-- PRODUTO CARTESIANO
Select HT.Codigo_Hotel, HS.Nome, floor(datediff(now(), HS.Data_de_Nascimento)/365) as Idade, HS.CPF
-- Função floor(datediff) serve para obter a idade
From Hotel HT, Hospede HS , HotelHospede HH
Where HT.Codigo_Hotel = HH.Codigo_Hotel and HS.Codigo_Hospede = HH.Codigo_Hospede
Order by HT.Codigo_Hotel;

-- JUNÇÃO 
Select HT.Codigo_Hotel, HS.Nome, floor(datediff(now(), HS.Data_de_Nascimento)/365) as Idade, HS.CPF
From Hotel HT
Inner Join HotelHospede HH on HT.Codigo_Hotel = HH.Codigo_Hotel
Inner Join Hospede HS on HS.Codigo_Hospede = HH.Codigo_Hospede
Order by HT.Codigo_Hotel;
    
-- 22. Quais os setores que existem no Hotel 1 mas que não existem no hotel 2?
Select S.Nome_Setor
From Setor S, HotelSetor HS, Hotel H
Where S.Codigo_Setor = HS.Codigo_Setor and H.Codigo_Hotel = HS.Codigo_Hotel and H.Codigo_Hotel = 1 and S.Codigo_Setor not in (
	Select S.Codigo_Setor
    From Setor S, HotelSetor HS, Hotel H
    Where S.Codigo_Setor = HS.Codigo_Setor and H.Codigo_Hotel = HS.Codigo_Hotel and H.Codigo_Hotel = 2
);

