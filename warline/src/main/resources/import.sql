
insert into Bestia values(10, 30, 5, 20,1, 'boqueron', 10, 70, 100, 50);

insert into Bestia values(11, 50, 15, 50, 3, 'rata', 30, 75, 90, 80);

insert into Bestia values(12, 70, 30, 75, 5, 'tejon', 60, 77, 105, 110);

insert into Bestia values(13, 110, 40, 100, 7, 'komodo', 80, 75, 110, 150);

insert into Bestia values(14, 100, 50, 120, 9, 'lobo', 100, 80, 140, 190);

insert into Bestia values(15, 140, 75, 140, 11, 'pantera', 150, 82, 150, 230);

insert into Bestia values(16, 200, 100, 250, 13, 'oso', 200, 78, 140, 300);

insert into Bestia values(17, 200, 130, 200, 15, 'tigre', 260, 83, 160, 340);

insert into Bestia values(18, 400, 200, 300, 17, 'rhino', 400, 76, 180, 450);

insert into Bestia values(19, 500, 250, 400, 19, 'elefante', 500, 80, 190, 600);

insert into Bestia values(110, 650, 400, 600, 21, 'dragon', 800, 90, 235, 800);

insert into Bestia values(111, 900, 750, 900, 23, 'hydra', 1500, 95, 245, 950);
--create table bestia (id bigint generated by default as identity (start with 1), defensa integer not null, exp integer not null, fuerza integer not null, imagen varchar(255), nivel integer not null, nombre varchar(255), oro integer not null, precision integer not null, velocidad integer not null, vida integer not null, primary key (id))
insert into Heroe values (1,10,10,'resources/combates/fotos/fuerte.png',1,'user',50,30,5,100,0);
insert into User values (1,false, '$2a$10$E44pf9xwD4CFda8FtvrWGeX1Axj2RnC49AK/vjttAWARoyGfrSGPm', 'user', 'user',2);
insert into User values (2,false, '$2a$10$EhYtXcHYOMXXUWAyiOfKIO21uxLRf4dNDdXZL73NLfMVQqiFdZncW', 'admin', 'admin',null);
insert into User values (3, false, '$2a$10$sj7CegQYfvKqcuxKoVbis.rId1sdR/qpfNOua63XFUTlTOnLXazLO', 'adminw', 'admin', null);