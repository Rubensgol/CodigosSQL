use mydb;
insert into pessoa 
values("12593099755","Rubens"),
("24441833040","Sophia Vitória da Conceição"),
("92993768751","Diego Sebastião da Rosa"),
("42322855804","Vitor Lorenzo Paulo Sales"),
("02707587800","Vitória Eloá Sophia Araújo"),
("85789247113","Lara Marli Sales"),
("15854083280","Sônia Silvana Porto"),
("27210834907","Eliane Sebastiana Rayssa da Paz");

insert into cliente 
values(9148,"24441833040"),
( 4472,"42322855804"),
( 4805,"85789247113");

insert into gerente
values("02707587800"),
("27210834907");

insert into planta
values(1,"CONVOLVULACEAE","Ipomoea pes-caprae","Branquear a roupa",". Devido as raízes longas é conhecida comumente como Zarça de Smilax","Ilha de Marajó (PA)"),
(2,"ASTERACEAE","Baccharis articulata","Tônico","Goza das mesmas proprie­dades que a precedente; é menos amargosa.","Qualquer lugar"),
(3,"BROMELIACEAE","Aechmea bromeliifolia (Rudge)","Propriedades terapêuticas","A raiz da planta dá uma tinta amarela, que é muito usada pelos indígenas para tingirem as redes","Caravelas (BA)");


insert into motorista
values (818664041),
(919048074);


insert into frete
values(1,'2015-11-20',818664041,"27210834907"),
(2,'2015-7-12',818664041,"27210834907"),
(3,'2015-8-20',818664041,"02707587800"),
(4,'2015-5-25',919048074,"02707587800"),
(5,'2015-11-5',919048074,"27210834907"),
(6,'2015-5-30',919048074,"27210834907"),
(7,'2015-6-3',818664041,"27210834907"),
(8,'2015-2-19',818664041,"02707587800");

insert into entrega
values(2,3,10.15,200),
(2,4,12.25,250),
(3,6,100,20),
(3,7,150,15),
(3,2,70,100);


insert into loja
values
(1,"Rua fernandis","02707587800"),
(2,"Rua Cajui","27210834907");

insert into vendedor values
("92993768751",1),
("27210834907",2);

insert into estoque values
(3,1,100,300),
(2,2,35,100);

START TRANSACTION;
insert into venda values
(1,3,null,'2015-10-10',0.2,100,1),
(1,2,null,'2015-10-10',10,150,2);

commit;