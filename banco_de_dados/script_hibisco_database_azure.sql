
use Hibisco;

create table tb_address_data (
    id_address int not null primary key IDENTITY(1,1),
    address varchar(150),
    neighborhood varchar(100),
    city varchar(60),
    uf char(2), 
    cep varchar(8),
    number int
);

create table tb_donator (
	id_donator int not null primary key IDENTITY(1,1),
    name_donator varchar(255) not null,
    cpf char(14) not null,
    blood_type char(3) not null,
    email varchar(100) not null, 
    password varchar(100) not null,
    phone1 varchar(14) not null,
    phone2 varchar(14),
    fk_address int not null foreign key (fk_address) references tb_address_data (id_address)
);

create table tb_hospital (
    id_hospital int not null primary key IDENTITY(1,1),
    name_hospital varchar(255),
    email varchar(100),
    password varchar(100),
    fk_address int not null foreign key (fk_address) references tb_address_data (id_address)
);

create table tb_appointment (
    id_appointment int not null primary key IDENTITY(1,1),
    dh_scheduling datetime default current_timestamp,
    is_accepted BIT not null default 0,
    fk_donator int not null, 
    fk_hospital int not null, 
    foreign key (fk_donator) references tb_donator (id_donator),
    foreign key (fk_hospital) references tb_hospital (id_hospital)
);



select GETDATE();