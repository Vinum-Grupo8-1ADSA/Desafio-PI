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