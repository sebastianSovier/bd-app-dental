  insert into especialidad_profesional values(1,"Cirujano Dentista",CURRENT_TIMESTAMP);
  insert into especialidad_profesional values(2,"Ortodoncista",CURRENT_TIMESTAMP);
  insert into especialidad_profesional values(3,"Implantologo",CURRENT_TIMESTAMP);
  insert into especialidad_profesional values(4,"Cirujano Estetico",CURRENT_TIMESTAMP);
  insert into especialidad_profesional values(5,"Endodoncista",CURRENT_TIMESTAMP);
 

insert into alternativa_pregunta values(1,1,1,'Consulta',CURRENT_TIMESTAMP);
insert into alternativa_pregunta values(2,1,2,'Dolor',CURRENT_TIMESTAMP);
insert into alternativa_pregunta values(3,1,3,'Sensibilidad o molestia',CURRENT_TIMESTAMP);
insert into alternativa_pregunta values(4,1,4,'Estético',CURRENT_TIMESTAMP);


insert into alternativa_pregunta values(5,2,1,'SÍ',CURRENT_TIMESTAMP);
insert into alternativa_pregunta values(6,2,2,'NO',CURRENT_TIMESTAMP);

insert into alternativa_pregunta values(7,3,1,'SÍ',CURRENT_TIMESTAMP);
insert into alternativa_pregunta values(8,3,2,'NO',CURRENT_TIMESTAMP);

insert into alternativa_pregunta values(9,4,1,'Halitosis',CURRENT_TIMESTAMP);
insert into alternativa_pregunta values(10,4,2,'Sarro',CURRENT_TIMESTAMP);
insert into alternativa_pregunta values(11,4,3,'Caries',CURRENT_TIMESTAMP);
insert into alternativa_pregunta values(12,4,4,'Mejorar la sonrisa',CURRENT_TIMESTAMP);

insert into alternativa_pregunta values(13,5,1,'SÍ',CURRENT_TIMESTAMP);
insert into alternativa_pregunta values(14,5,2,'NO',CURRENT_TIMESTAMP);
insert into alternativa_pregunta values(15,1,5,'Ninguna de las anteriores',CURRENT_TIMESTAMP);
insert into alternativa_pregunta values(16,4,6,'Ninguna de las anteriores',CURRENT_TIMESTAMP);

insert into pregunta values(1,"¿Cuál es su motivo principal para solicitar atención odontológica en esta ocasión?",CURRENT_TIMESTAMP);
insert into pregunta values(2,"¿Ha tenido alguna consulta odontológica en el último año, ya sea de control o tratamiento?",CURRENT_TIMESTAMP);
insert into pregunta values(3,"¿Hay algo que debamos tener en cuenta por experiencias pasadas que no fueron del todo positivas?",CURRENT_TIMESTAMP);
insert into pregunta values(4,"¿Hay algo en particular que le preocupe o le gustaría mejorar sobre su salud bucal o su sonrisa?",CURRENT_TIMESTAMP);
insert into pregunta values(5,"¿Le gustaría que evaluáramos juntos una alternativa integral que sea lo menos invasiva posible para usted?",CURRENT_TIMESTAMP);




insert into perfil values(1,'paciente',CURRENT_TIMESTAMP);
insert into perfil values(2,'profesional',CURRENT_TIMESTAMP);
insert into perfil values(3,'administrador',CURRENT_TIMESTAMP);

 insert into profesional values(1,'99999999','9','3',0,"administrador","administrador","administrador","1989-10-19","1111111","re@re.cl","los canelos 333",CURRENT_TIMESTAMP);

 insert into contrasena_profesional values (1,1,"$2a$11$IpaZxSO5d9i95g4m5pKtWu8/ZG8pw9y3hAreWOesJwbgBd8Xyh0DK",CURRENT_TIMESTAMP);
 
