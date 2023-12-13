CREATE DATABASE bdDesafioPI;

USE bdDesafioPI;

create table empresa (
idEmpresa int primary key auto_increment,
nome varchar(50),
cnpj char(14),
email varchar(60),
logradouro varchar(70),
numero int
);

insert into empresa (nome, cnpj, email, logradouro, numero) values
	("Tecidos Soluctions", "01234567892023", "soluctions@gmail.com", "Rua Ana Rosa", 272),
    ("Irmãos Tecidos", "32029876543210", "irmaos@gmail.com", "Avenida Ipiranga", 797),
    ("Tecidos Top", "98765432102023", "top@gmail.com", "Rua Chácara Kablin", 286);

create table usuario (
idUsuario int auto_increment,
nome varchar(45),
email varchar(50),
senha varchar(20),
cpf char(11),
fkEmpresa int,
primary key (idUsuario, fkEmpresa),
constraint fkempresausuario foreign key (fkEmpresa) references empresa(idEmpresa)
);

create table sensorTcrt (
idSensor int auto_increment,
nomeSensor varchar(45),
fkEmpresa int,
primary key (idSensor, fkEmpresa),
constraint fkempresasensor foreign key (fkEmpresa) references empresa(idEmpresa)
);

insert into sensorTcrt (nomeSensor, fkEmpresa) values
	('Sensor A', 1),
    ('Sensor B', 1),
    ('Sensor C', 2),
    ('Sensor D', 3),
    ('Sensor E', 2),
    ('Sensor F', 3);

create table registro (
idRegistro int,
leitura int,
fkSensor int,
primary key (idRegistro, fkSensor),
constraint fksensorregistro foreign key (fkSensor) references sensorTcrt(idSensor)
);

create user "desafioLocal"@'localhost' identified by "desafioPI";
grant all privileges on bdDesafioPI.* to "desafioLocal"@'localhost';
flush privileges;