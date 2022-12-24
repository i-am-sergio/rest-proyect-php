drop database restaurant;
create database if not exists restaurant;

use restaurant;

create table usuario(
	id integer primary key,
    nombres varchar(30),
    primer_apellido varchar(20),
    segundo_apellido varchar(20),
    correo varchar(30),
    telefono integer,
	usuario varchar(20),
    contrasenha varchar(20)
);

create table administrador(
	id integer primary key,
    nivel_acceso varchar(50),
    foreign key (id) references usuario(id)
);
create table cliente(
	id integer primary key,
    direccion varchar(100),
    fecha_nacimiento date,
    foreign key (id) references usuario(id)
);

create table trabajador_restaurante(
	dni integer primary key,
    nombres varchar(30),
    primer_apellido varchar(20),
    segundo_apellido varchar(20),
    fecha_nacimiento date,
    telefono integer,
    correo varchar(50),
    foto_path varchar(1000)
);

create table chef(
	dni integer primary key,
    fecha_ingreso date,
    foreign key (dni) references trabajador_restaurante(dni)
);
create table especialidad_chef(
	id_chef integer,
    especialidad varchar(30),
    primary key(id_chef,especialidad),
    foreign key(id_chef) references chef(dni) 
);

create table ayudante_chef(
	dni integer primary key,
    id_chef integer,
    foreign key (dni) references trabajador_restaurante(dni),
    foreign key (id_chef) references chef(dni)
);

create table repartidor(
	dni integer primary key,
    entrega_realizada integer,
    entrega_faltada integer,
    entrega_tardada integer,
    foreign key (dni) references trabajador_restaurante(dni)
);

create table orden(
	id_orden integer primary key AUTO_INCREMENT,
    total float,
    cantidad integer,
    fecha date,
    id_cliente integer,
    id_repartidor integer,
    foreign key (id_cliente) references cliente(id),
    foreign key (id_repartidor) references repartidor(dni)
);

create table proveedor(
	id_proveedor integer primary key,
    nombre varchar(100)
);

create table tipo_proveedor(
	id_proveedor integer,
    tipo varchar(100),
    primary key(id_proveedor,tipo),
    foreign key (id_proveedor) references proveedor(id_proveedor)
);

create table consumible(
	id_consumible integer primary key,
    nombre varchar(100),
    descripcion varchar(1000),
    stock integer,
    precio float,
    id_chef integer,
    id_proveedor integer,
    foto_path varchar(1000),
    foreign key (id_chef) references chef(dni),
    foreign key (id_proveedor) references proveedor(id_proveedor)
);

create table plato(
	id_consumible integer primary key,
    foreign key (id_consumible) references consumible(id_consumible)
);

create table ingrediente_plato(
	id_consumible integer,
    ingrediente varchar(30),
    primary key(id_consumible,ingrediente),
    foreign key(id_consumible) references plato(id_consumible)
);

create table bebida(
	id_consumible integer primary key,
    temperatura varchar(30),
    foreign key (id_consumible) references consumible(id_consumible)
);

create table sabor_bebida(
	id_consumible integer,
    sabor varchar(30),
    primary key(id_consumible,sabor),
    foreign key(id_consumible) references bebida(id_consumible)
);

create table orden_consumible(
	id_orden integer,
    id_consumible integer,
    cantidad integer,
    primary key(id_orden,id_consumible),
    foreign key(id_orden) references orden(id_orden),
    foreign key(id_consumible) references consumible(id_consumible)
);

INSERT INTO usuario VALUES (77530091,'Grecia','Zeballos','Espinoza','Grecia.Zeballos@gmail.com','87742531','Grecia.Zeballos','9JHBX');
INSERT INTO usuario VALUES (35204999,'Alexa','Ramos','Llanos','Alexa.Ramos@gmail.com','806877328','Alexa.Ramos','LK428L');
INSERT INTO usuario VALUES (20763986,'Juan','Marto','Rivas','Juan.Marto@gmail.com','545892211','Juan.Marto','HK956J');
INSERT INTO usuario VALUES (82611904,'Sergio','Mogollon','Caceres','Sergio.Mogollon@gmail.com','550452224','Sergio.Mogollon','KO999L');
INSERT INTO usuario VALUES (23992373,'Gregorio','Santo','Mármol','Gregorio.Santo@gmail.com','386776027','Gregorio.Santo','RR943G');
INSERT INTO usuario VALUES (15092815,'Rosa','Ramos','Quispe','Rosa.Ramos@gmail.com','504874369','Rosa.Ramos','NM234B');
INSERT INTO usuario VALUES (35942257,'Marianela','Coaquia','Mestas','Marianela.Coaquia@gmail.com','17519073','Marianela.Coaquia','PQ667H');
INSERT INTO usuario VALUES (49822653,'Luciana','Gomez','Ramon','Luciana.Gomez@gmail.com','51447939','Luciana.Gomez','PM745J');
INSERT INTO usuario VALUES (51407745,'Nelzon','Lopez','de Casares','Nelzon.Lopez@gmail.com','155820100','Nelzon.Lopez','XU668M');
INSERT INTO usuario VALUES (25936410,'Sebastian','Taboada','López','Sebastian.Taboada@gmail.com','163105633','Sebastian.Taboada','OF898R');
INSERT INTO usuario VALUES (60886106,'Luz','Carreras','Mate','Luz.Carreras@gmail.com','567879143','Luz.Carreras','CP657H');
INSERT INTO usuario VALUES (36938855,'Margaretth','Quiroga','Cuevas','Margaretth.Quiroga@gmail.com','647911210','Margaretth.Quiroga','MO646U');
INSERT INTO usuario VALUES (38509122,'Orlando','Seco','Viana','Orlando.Seco@gmail.com','130659085','Orlando.Seco','YL944V');
INSERT INTO usuario VALUES (77623683,'Manuel','Piñol','Alberdi','Manuel.Piñol@gmail.com','534284336','Manuel.Piñol','LH661L');
INSERT INTO usuario VALUES (55197350,'Julio','Matas','Oliva','Julio.Matas@gmail.com','663537623','Julio.Matas','XM373H');
INSERT INTO usuario VALUES (87517776,'Augusto','Iborra ','Bou','Augusto.Iborra @gmail.com','648794599','Augusto.Iborra ','JR227I');
INSERT INTO usuario VALUES (28688071,'Gustavo','Carrillo','de Carrillo','Gustavo.Carrillo@gmail.com','621270561','Gustavo.Carrillo','VX472S');
INSERT INTO usuario VALUES (20209010,'Abel','Llanos ','Ariza','Abel.Llanos @gmail.com','731289286','Abel.Llanos ','GO502U');
INSERT INTO usuario VALUES (30741595,'Luis','Alcántara','Galiano ','Luis.Alcántara@gmail.com','721757680','Luis.Alcántara','KA305K');
INSERT INTO usuario VALUES (30478645,'Bryan','Caro','Roldán','Bryan.Caro@gmail.com','845396898','Bryan.Caro','VP544W');
INSERT INTO usuario VALUES (81055723,'Alisson','Domingo ','Palmer','Alisson.Domingo @gmail.com','864128366','Alisson.Domingo ','ID187Z');
INSERT INTO usuario VALUES (16207231,'Diego','Cabo ','Múñiz','Diego.Cabo @gmail.com','884037543','Diego.Cabo ','RG295U');
INSERT INTO usuario VALUES (70105279,'Santos','Galán','Galán','Santos.Galán@gmail.com','110432329','Santos.Galán','XR381G');
INSERT INTO usuario VALUES (63071868,'Leon','Carreño ','Borrell','Leon.Carreño @gmail.com','139212319','Leon.Carreño ','KG801C');
INSERT INTO usuario VALUES (38413216,'Avelino','Vera ','Enríquez','Avelino.Vera @gmail.com','845042063','Avelino.Vera ','UH930W');
INSERT INTO usuario VALUES (56868109,'Tadeo ','Tore','de Porras','Tadeo .Tore@gmail.com','106050651','Tadeo .Tore','IU304L');
INSERT INTO usuario VALUES (73042559,'Gloria ','Alemany ','Moreno','Gloria .Alemany @gmail.com','761596699','Gloria .Alemany ','KO900H');
INSERT INTO usuario VALUES (26887576,'Hortensia ','Verdejo ','Cáceres','Hortensia .Verdejo @gmail.com','591669110','Hortensia .Verdejo ','VI308B');
INSERT INTO usuario VALUES (85015033,'Galo','Taboada','Almeida','Galo.Taboada@gmail.com','216816615','Galo.Taboada','JW928Z');
INSERT INTO usuario VALUES (36427861,'Luna','Perales','Abella','Luna.Perales@gmail.com','496914904','Luna.Perales','AT913O');
INSERT INTO usuario VALUES (31803228,'Héctor','Conesa','Medina','Héctor.Conesa@gmail.com','792204067','Héctor.Conesa','JZ602P');
INSERT INTO usuario VALUES (71720381,'Flor','Durán','Blasco','Flor.Durán@gmail.com','841396102','Flor.Durán','IN881Z');
INSERT INTO usuario VALUES (21149095,'Merche','Zabaleta','Izquierdo','Merche.Zabaleta@gmail.com','718955595','Merche.Zabaleta','II417G');
INSERT INTO usuario VALUES (63099963,'Josep','Torrent','Parejo','Josep.Torrent@gmail.com','870478171','Josep.Torrent','XT154P');
INSERT INTO usuario VALUES (16623351,'Calixta','Peinado','Ropero','Calixta.Peinado@gmail.com','523319194','Calixta.Peinado','ZQ292S');
INSERT INTO usuario VALUES (23122863,'Andrés Felipe','Mesa','Gascón','Andrés Felipe.Mesa@gmail.com','734079768','Andrés Felipe.Mesa','BS962K');
INSERT INTO usuario VALUES (28198224,'Luciano','Ropero','Peinado','Luciano.Ropero@gmail.com','391132758','Luciano.Ropero','FG335E');
INSERT INTO usuario VALUES (22833057,'Rocío','Izquierdo','Zabaleta','Rocío.Izquierdo@gmail.com','636331619','Rocío.Izquierdo','FR278H');
INSERT INTO usuario VALUES (65551002,'Marciano','Chacón','Tomas','Marciano.Chacón@gmail.com','322916434','Marciano.Chacón','FM780W');
INSERT INTO usuario VALUES (42995958,'Porfirio','Dueñas','Alberto','Porfirio.Dueñas@gmail.com','388460718','Porfirio.Dueñas','VS807W');

#--------------------------
INSERT INTO cliente VALUES (77530091,'Av. Abancay 197','2003-10-16');
INSERT INTO cliente VALUES (35204999,'Av. La Mar 711','1982-2-14');
INSERT INTO cliente VALUES (20763986,'Av. Manco Capac 317','1981-9-6');
INSERT INTO cliente VALUES (82611904,'Av. Canada 753','1997-7-17');
INSERT INTO cliente VALUES (23992373,'Av. EEUU 271','1982-3-8');
INSERT INTO cliente VALUES (15092815,'Av. Jose Larco 947','1994-10-7');
INSERT INTO cliente VALUES (35942257,'Av. 28 de Julio 778','1982-5-7');
INSERT INTO cliente VALUES (49822653,'Av. Naranjal 946','1984-11-28');
INSERT INTO cliente VALUES (51407745,'Av. Pachacutec 509','1998-9-19');
INSERT INTO cliente VALUES (25936410,'Av. Primavera 141','1991-8-30');
INSERT INTO cliente VALUES (60886106,'Av. Reducto 740','1991-5-1');
INSERT INTO cliente VALUES (36938855,'Av. España 376','1991-2-27');
INSERT INTO cliente VALUES (38509122,'Av. Francisco Bolognesi 566','1991-12-21');
INSERT INTO cliente VALUES (77623683,'Av. Tacna 967','1993-10-1');
INSERT INTO cliente VALUES (55197350,'Av. Uruguay 110','1990-2-2');
INSERT INTO cliente VALUES (87517776,'Av. Iquitos 898','1990-12-5');
INSERT INTO cliente VALUES (28688071,'Av. Venezuela 942','1982-11-11');
INSERT INTO cliente VALUES (20209010,'Av. Isabel 720','1988-6-4');
INSERT INTO cliente VALUES (30741595,'Av. Javier Prado 720','2002-11-29');
INSERT INTO cliente VALUES (30478645,'Av. Garzón 926','1993-3-30');

#----------
INSERT INTO administrador VALUES (81055723,'Total');
INSERT INTO administrador VALUES (16207231,'Total');
INSERT INTO administrador VALUES (70105279,'Total');
INSERT INTO administrador VALUES (63071868,'Total');
INSERT INTO administrador VALUES (38413216,'Total');
INSERT INTO administrador VALUES (56868109,'Total');
INSERT INTO administrador VALUES (73042559,'Total');
INSERT INTO administrador VALUES (26887576,'Total');
INSERT INTO administrador VALUES (85015033,'Total');
INSERT INTO administrador VALUES (36427861,'Total');
INSERT INTO administrador VALUES (31803228,'Total');
INSERT INTO administrador VALUES (71720381,'Total');
INSERT INTO administrador VALUES (21149095,'Total');
INSERT INTO administrador VALUES (63099963,'Total');
INSERT INTO administrador VALUES (16623351,'Total');
INSERT INTO administrador VALUES (23122863,'Total');
INSERT INTO administrador VALUES (28198224,'Total');
INSERT INTO administrador VALUES (22833057,'Total');
INSERT INTO administrador VALUES (65551002,'Total');
INSERT INTO administrador VALUES (42995958,'Total');

#-------------------
INSERT INTO trabajador_restaurante VALUES (11672402,'Isabella','Gonzales','Rodriguez','1999-12-11','101784573','Isabella.Gonzales@gmail.com','https://static8.depositphotos.com/1011643/1067/i/600/depositphotos_10674550-stock-photo-female-chef-with-delicious-hand.jpg');
INSERT INTO trabajador_restaurante VALUES (45270906,'Daniel','Gomez','Fernandez','1981-7-13','533556541','Daniel.Gomez@gmail.com','https://images-ext-2.discordapp.net/external/KZQZbb1zFX8WVNgf3kBxHraT7r11rlgBbGnSOfkZy2c/https/estereofonica.com/wp-content/uploads/2022/09/luisito-comunica-abre-restaurante-de-hamburguesas-en-madrid_unnamed-3.jpg?width=450&height=675');
INSERT INTO trabajador_restaurante VALUES (25920552,'Olivia','Lopez','Diaz','1991-12-14','574822393','Olivia.Lopez@gmail.com','https://www.lavanguardia.com/files/content_image_mobile_filter/uploads/2020/03/03/5e997cbf5e523.jpeg');
INSERT INTO trabajador_restaurante VALUES (38227443,'David','Martinez','Perez','1997-2-9','389233770','David.Martinez@gmail.com','https://media.discordapp.net/attachments/1049140237735051375/1055889854099099648/FKie7hnXsBU2QpB.png');
INSERT INTO trabajador_restaurante VALUES (54712448,'Alexis','Garcia','Sanchez','1990-11-3','475222932','Alexis.Garcia@gmail.com','https://www.turismotailandes.com/wp-content/uploads/2019/04/Pepe-imagen-e1554911883125.jpg');
INSERT INTO trabajador_restaurante VALUES (63507877,'Gabriel','Romero','Sosa','1989-2-8','509838340','Gabriel.Romero@gmail.com','https://static2.mujerhoy.com/www/multimedia/202201/25/media/cortadas/jesus-sanchez1-kMj-U160651653586mpB-1248x1248@MujerHoy.jpg');
INSERT INTO trabajador_restaurante VALUES (75725818,'Sofia','Alvarez','Torres','1980-5-22','620596788','Sofia.Alvarez@gmail.com','https://www.libreriagastronomica.com/cdnassets//bego-1.jpg');
INSERT INTO trabajador_restaurante VALUES (74033159,'Benjamin','Ruiz','Ramirez','1982-2-18','59511094','Benjamin.Ruiz@gmail.com','https://imagenes.elpais.com/resizer/5ZlJirN35cq546wTpgJ5YVJ3eYQ=/414x0/cloudfront-eu-central-1.images.arcpublishing.com/prisa/GDTRXGIV5YK2DXJ2TT5ZHNRRKU.jpg');
INSERT INTO trabajador_restaurante VALUES (39243685,'Victoria','Flores','Acosta','1982-11-19','653608551','Victoria.Flores@gmail.com','https://www.lavanguardia.com/files/content_image_mobile_filter/uploads/2020/03/03/5e997cd50590d.jpeg');
INSERT INTO trabajador_restaurante VALUES (57920373,'Samuel','Benitez','Medina','1986-12-10','622077138','Samuel.Benitez@gmail.com','https://static.wixstatic.com/media/880113_f741a40f7e9b43e9bfdb0dbce870e141.jpg/v1/fill/w_242,h_319,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/880113_f741a40f7e9b43e9bfdb0dbce870e141.jpg');
INSERT INTO trabajador_restaurante VALUES (88720723,'Amelia','Suarez','Herrera','1981-10-24','234380213','Amelia.Suarez@gmail.com','https://cloudfront-eu-central-1.images.arcpublishing.com/prisa/RSA6CX2TINFQLGZ3WLCGFRRQLQ.jpg');
INSERT INTO trabajador_restaurante VALUES (63918305,'Lucas','Aguirre','Pereyra','1989-1-30','48805327','Lucas.Aguirre@gmail.com','https://cruceroadicto.com/wp-content/uploads/2018/03/Ramon-Freixa-MSC-Cruceros.jpg');
INSERT INTO trabajador_restaurante VALUES (76385188,'Alexa','Gutierrez','Gimenez','1997-4-16','232635988','Alexa.Gutierrez@gmail.com','https://cdn.create.vista.com/api/media/medium/241663896/stock-photo-beautiful-female-chef-uniform-hat?token=');
INSERT INTO trabajador_restaurante VALUES (34183811,'Angel','Molina','Silva','2000-5-25','496978563','Angel.Molina@gmail.com','https://buenazo.cronosmedia.glr.pe/original/2021/07/23/60faf2f0000179738b6bee4a.jpg');
INSERT INTO trabajador_restaurante VALUES (79622564,'Julia','Castro','Rojas','1987-1-5','517992329','Julia.Castro@gmail.com','https://i.pinimg.com/736x/a7/fc/f5/a7fcf5f67501543a57a42d7b29534623--thinking-out-loud-freedom.jpg');
INSERT INTO trabajador_restaurante VALUES (17749023,'Jose','Ortiz','Nuñez','1987-10-25','239968646','Jose.Ortiz@gmail.com','https://img.europapress.es/fotoweb/fotonoticia_20211124180450_1200.jpg');
INSERT INTO trabajador_restaurante VALUES (15917299,'Camila','Luna','Juarez','1989-1-1','112091755','Camila.Luna@gmail.com','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZIPzE_LeFpYRH36o99hWYh931KQjuqIndCnmcqPhYqwi74-D8LPa4cWm9uwW1hXp7w0I&usqp=CAU');
INSERT INTO trabajador_restaurante VALUES (18870758,'Adrian','Cabrera','Rios','1996-1-25','590659142','Adrian.Cabrera@gmail.com','https://pbs.twimg.com/media/ExWX3laWgAEROds.jpg:large');
INSERT INTO trabajador_restaurante VALUES (16379171,'Alexandra','Ferreyra','Godoy','2001-6-22','550463803','Alexandra.Ferreyra@gmail.com','https://www.shutterstock.com/image-photo/beautiful-female-waiter-empty-tray-260nw-1915341556.jpg');
INSERT INTO trabajador_restaurante VALUES (50866180,'Sebastia','Morales','Dominguez','1988-10-5','692448051','Sebastia.Morales@gmail.com','https://www.institutomaurer.com.mx/cursos/assets/images/mesero_profesional.jpg');
INSERT INTO trabajador_restaurante VALUES (17616152,'Xavier','Moreno','Peralta','1980-7-14','226526154','Xavier.Moreno@gmail.com','https://us.123rf.com/450wm/andreypopov/andreypopov1406/andreypopov140600891/29528836-retrato-de-la-sonrisa-joven-mesero-que-sostiene-la-campana-del-servicio-m%C3%A1s-de-blanco.jpg');
INSERT INTO trabajador_restaurante VALUES (20913314,'Juan','Vega','Carrizo','1985-5-29','143471631','Juan.Vega@gmail.com','https://uniformesweb.es/blog/wp-content/plugins/aawp/public/image.php?url=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNDFyeC0zUXdweEwuanBn');
INSERT INTO trabajador_restaurante VALUES (32452099,'Luis','Quiroga','Castillo','2001-9-18','417249665','Luis.Quiroga@gmail.com','https://www.chefworks.com/media/catalog/product/cache/af664ac659887df3535f2c8cf27b66dd/e/c/eccb-wht_sf.jpg');
INSERT INTO trabajador_restaurante VALUES (33772142,'Diego','Ledesma','Muñoz','1997-7-15','359936696','Diego.Ledesma@gmail.com','https://ae01.alicdn.com/kf/H70f6d6a54a174c6eb09542c544cd4be05/Chaqueta-de-Chef-de-manga-larga-Unisex-abrigo-de-cocinero-para-restaurante-Hotel-ropa-de-cocina.jpg_Q90.jpg_.webp');
INSERT INTO trabajador_restaurante VALUES (41490530,'Eva','Ojeda','Ponce','2004-10-26','75220798','Eva.Ojeda@gmail.com','https://norvil-web.storage.googleapis.com/cms_multimedia/cms_medias/files/000/001/391/tablet/1538.jpg');
INSERT INTO trabajador_restaurante VALUES (67852275,'Angelina','Vera','Vazquez','1997-5-19','617876397','Angelina.Vera@gmail.com','https://img.freepik.com/fotos-premium/chef-su-ayudante-cocina-bistro_1398-6075.jpg?w=2000');
INSERT INTO trabajador_restaurante VALUES (25811005,'Luis','Villalba','Cardozo','1990-9-10','86441612','Luis.Villalba@gmail.com','https://dhb3yazwboecu.cloudfront.net/508/IMATGES/8526834_1G.JPG');
INSERT INTO trabajador_restaurante VALUES (27157274,'Diego','Navarro','Ramos','1992-2-17','550630868','Diego.Navarro@gmail.com','https://i.pinimg.com/originals/b2/bf/59/b2bf5949cd756b61922b1445ef322fd0.jpg');
INSERT INTO trabajador_restaurante VALUES (28417673,'Carlos','Arias','Coronel','1980-8-28','296792802','Carlos.Arias@gmail.com','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe8_ENR--uufpZk306QTv8_LPjm7nOAU1WosS8EdRmIJPNTUh4pzTthUui2ZyeATJUQr0&usqp=CAU');
INSERT INTO trabajador_restaurante VALUES (75264152,'Jesus','Cordoba','Figueroa','1992-8-2','272807056','Jesus.Cordoba@gmail.com','https://norvil-web.storage.googleapis.com/cms_multimedia/cms_medias/files/000/001/385/tablet/1537.jpg?1570114507');
INSERT INTO trabajador_restaurante VALUES (36956117,'Alex','Correa','Caceres','1997-2-11','313008768','Alex.Correa@gmail.com','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn53mwBY1iL0yAjGdls21paaAw41ClBOJo1fzDqNi0Y_A7XS14gSlAX880LmPbVrR2hBY&usqp=CAU');
INSERT INTO trabajador_restaurante VALUES (26790114,'Max','Vargas','Maldonado','1981-10-10','103331984','Max.Vargas@gmail.com','https://i.pinimg.com/236x/d4/03/ef/d403ef7382b67138d0ffedc7ab151b4f.jpg');
INSERT INTO trabajador_restaurante VALUES (67440235,'Valeria','Mansilla','Farias','1998-1-13','749918880','Valeria.Mansilla@gmail.com','https://gourmetdemexico.com.mx/wp-content/uploads/2021/03/meseras-cdmx.jpg');
INSERT INTO trabajador_restaurante VALUES (88147809,'Rodrigo','Rivero','Paz','1998-9-25','297950479','Rodrigo.Rivero@gmail.com','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZIPzE_LeFpYRH36o99hWYh931KQjuqIndCnmcqPhYqwi74-D8LPa4cWm9uwW1hXp7w0I&usqp=CAU');
INSERT INTO trabajador_restaurante VALUES (59301328,'Omar','Miranda','Roldan','2001-4-26','694020217','Omar.Miranda@gmail.com','https://creamas.org/wp-content/uploads/2017/08/foto-edi-pasaporte-carnet-.jpg');
INSERT INTO trabajador_restaurante VALUES (69435750,'Paúl','Mnedez','Lucero','2002-5-13','309633715','Paúl.Mnedez@gmail.com','https://media.istockphoto.com/id/481864562/es/foto/fotograf%C3%ADa-de-un-pasaporte-cool-guy-en-una-camisa-azul.jpg?s=612x612&w=0&k=20&c=0SlCMZCgsJ_RIgr-IePdMUSmY6Xajwn1CjbvyHckRaY=');
INSERT INTO trabajador_restaurante VALUES (63252223,'Ándres','Cruz','Hernandez','1997-10-19','821868102','Ándres.Cruz@gmail.com','https://media.istockphoto.com/id/1315808211/es/foto/foto-del-pasaporte-de-un-joven-adulto-brasile%C3%B1o-serio-con-aparatos-ortop%C3%A9dicos.jpg?s=612x612&w=0&k=20&c=KcYK1Jgk4vsyEfpssuKtn3MexnftDDI7qUiHDACLzyU=');
INSERT INTO trabajador_restaurante VALUES (45943070,'Julián','Aguero','Paez','1999-10-18','187893335','Julián.Aguero@gmail.com','https://media.istockphoto.com/id/1287598154/es/foto/foto-del-pasaporte-del-hombre-latinoamericano-con-barba.jpg?s=612x612&w=0&k=20&c=IXVrzE0ylWr0gwI4nqZkMnzZahE3Ej4psUNyTpvptGw=');
INSERT INTO trabajador_restaurante VALUES (88766027,'Josue','Blanco','Mendoza','1982-1-15','438788505','Josue.Blanco@gmail.com','https://media.istockphoto.com/id/174930593/es/foto/maduro-hombre-hispano.jpg?s=612x612&w=0&k=20&c=H_ywpE5IqqJfjXtpzBz9xUkUZfGtc6uaGlrb4S2BRRg=');
INSERT INTO trabajador_restaurante VALUES (70107586,'Román','Escobar','Avila','2003-3-19','501000133','Román.Escobar@gmail.com','https://media.istockphoto.com/id/180746433/es/foto/treinta-algo-hombre.jpg?s=612x612&w=0&k=20&c=IfQ20VAGT4xzbmlmNNldZNKKEFuXcGrgJyGkq82WCBY=');
INSERT INTO trabajador_restaurante VALUES (47167361,'Ramon','Toledo','Andrada','1994-7-27','730799370','Ramon.Toledo@gmail.com','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO1QqdugzVR_risHXE3v_aEuS4-D1vKfqbew&usqp=CAU');
INSERT INTO trabajador_restaurante VALUES (28244296,'Vicky','Bravo','Frnaco','2003-12-5','869183922','Vicky.Bravo@gmail.com','https://creamas.org/wp-content/uploads/2019/07/FOTOGRAFIA-CARNET.jpg');
INSERT INTO trabajador_restaurante VALUES (25439469,'Rosa','Soto','Olivera','2003-6-22','197922816','Rosa.Soto@gmail.com','https://i.pinimg.com/736x/97/6c/96/976c966ae2722d2e51507ea7a7740f91.jpg');
INSERT INTO trabajador_restaurante VALUES (72598315,'Friz','Campos','Moyano','1982-1-3','559666610','Friz.Campos@gmail.com','http://blog.danielberlanga.es/wp-content/uploads/2010/11/MG_9189-393x590.jpg');
INSERT INTO trabajador_restaurante VALUES (37128995,'Max','Martinez','Soto','1997-9-2','666109739','Max.Martinez@gmail.com','https://media.istockphoto.com/id/1086350530/es/foto/retrato-de-un-joven-profesional.jpg?s=612x612&w=0&k=20&c=fpQHHOLCaOWeGJt_LWkWjUnGt0gdIr9QH_gjUIg1TR0=');
INSERT INTO trabajador_restaurante VALUES (56162516,'Luz','Duarte','Soto','1984-10-16','83015733','Luz.Duarte@gmail.com','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfCeVdizGTxpDSAD6mH5Rqfn9I4F83r5C8e8BFrLH0S8Kzefkp8J6scUunv2s_xR2tdD0&usqp=CAU');
INSERT INTO trabajador_restaurante VALUES (18697054,'Rosa','Franco','Bravo','1985-1-24','664391233','Rosa.Franco@gmail.com','https://media.istockphoto.com/id/856599656/es/foto/foto-de-pasaporte-de-una-sonriente-mujer-de-negocios-turco.jpg?s=612x612&w=0&k=20&c=PKEmzqGfBIS-xh1lHckgCkEw0HoZL25twaVrla-62NE=');
INSERT INTO trabajador_restaurante VALUES (59376484,'Marta','Valdezz','Toledo','2001-2-10','13985243','Marta.Valdezz@gmail.com','https://media.istockphoto.com/id/1305257837/es/foto/foto-del-pasaporte-de-una-mujer-latinoamericana-adulta-madura-grave.jpg?s=612x612&w=0&k=20&c=aP1LHxKsyd_4DOvRZSw2aRUkP6iNjJigtYf7BOl2Z9o=');
INSERT INTO trabajador_restaurante VALUES (87086197,'Julian','Andrada','Anndrade','1986-10-22','393512394','Julian.Andrada@gmail.com','https://media.istockphoto.com/id/580109640/es/foto/sonriente-hombre.jpg?s=612x612&w=0&k=20&c=9Oa3WaW5X9BaylA5Ww_fE6Pe0AiumJYgRQzgx89qp9Y=');
INSERT INTO trabajador_restaurante VALUES (74680401,'Maxmiliano','Montenegro','Leguizamon','1989-12-26','742460076','Maxmiliano.Montenegro@gmail.com','https://media.istockphoto.com/id/473690882/es/foto/pasaporte-foto-de-un-chico-en-una-camisa-gris.jpg?s=612x612&w=0&k=20&c=REm12bAohdXRAWxwPNPhdvDXRmusBOLLzv08dtwNSCk=');

#------------------------------
INSERT INTO chef VALUES (11672402,'2014-11-2');
INSERT INTO chef VALUES (45270906,'2020-2-4');
INSERT INTO chef VALUES (25920552,'2012-3-10');
INSERT INTO chef VALUES (38227443,'2011-5-9');
INSERT INTO chef VALUES (54712448,'2016-2-29');
INSERT INTO chef VALUES (63507877,'2019-2-15');
INSERT INTO chef VALUES (75725818,'2021-10-25');
INSERT INTO chef VALUES (74033159,'2012-5-18');
INSERT INTO chef VALUES (39243685,'2021-3-1');
INSERT INTO chef VALUES (57920373,'2017-2-6');
INSERT INTO chef VALUES (88720723,'2020-8-18');
INSERT INTO chef VALUES (63918305,'2012-7-3');
INSERT INTO chef VALUES (76385188,'2011-10-28');
INSERT INTO chef VALUES (34183811,'2016-5-21');
INSERT INTO chef VALUES (79622564,'2018-12-2');
INSERT INTO especialidad_chef VALUES (11672402,'Chef Saucier');
INSERT INTO especialidad_chef VALUES (45270906,'Chef Poissonnier');
INSERT INTO especialidad_chef VALUES (25920552,'Chef rotisseur');
INSERT INTO especialidad_chef VALUES (38227443,'Chef friturier');
INSERT INTO especialidad_chef VALUES (54712448,'Chef entremetier');
INSERT INTO especialidad_chef VALUES (63507877,'Chef tournant');
INSERT INTO especialidad_chef VALUES (75725818,'Chef de despensa');
INSERT INTO especialidad_chef VALUES (74033159,'Chef boucher');
INSERT INTO especialidad_chef VALUES (39243685,'Chef patissier');
INSERT INTO especialidad_chef VALUES (57920373,'Chef bebida');
INSERT INTO especialidad_chef VALUES (88720723,'Chef bebida');
INSERT INTO especialidad_chef VALUES (63918305,'Chef bebida');
INSERT INTO especialidad_chef VALUES (76385188,'Chef bebida');
INSERT INTO especialidad_chef VALUES (34183811,'Chef bebida');
INSERT INTO especialidad_chef VALUES (79622564,'Chef bebida');
#----------------------------------
INSERT INTO ayudante_chef VALUES (17749023,'11672402');
INSERT INTO ayudante_chef VALUES (15917299,'45270906');
INSERT INTO ayudante_chef VALUES (18870758,'25920552');
INSERT INTO ayudante_chef VALUES (16379171,'38227443');
INSERT INTO ayudante_chef VALUES (50866180,'54712448');
INSERT INTO ayudante_chef VALUES (17616152,'63507877');
INSERT INTO ayudante_chef VALUES (20913314,'75725818');
INSERT INTO ayudante_chef VALUES (32452099,'74033159');
INSERT INTO ayudante_chef VALUES (33772142,'39243685');
INSERT INTO ayudante_chef VALUES (41490530,'57920373');
INSERT INTO ayudante_chef VALUES (67852275,'88720723');
INSERT INTO ayudante_chef VALUES (25811005,'63918305');
INSERT INTO ayudante_chef VALUES (27157274,'76385188');
INSERT INTO ayudante_chef VALUES (28417673,'34183811');
INSERT INTO ayudante_chef VALUES (75264152,'79622564');

#--------------------------------------
INSERT INTO repartidor VALUES (36956117,'5','4','2');
INSERT INTO repartidor VALUES (26790114,'2','5','2');
INSERT INTO repartidor VALUES (67440235,'4','1','3');
INSERT INTO repartidor VALUES (88147809,'4','5','2');
INSERT INTO repartidor VALUES (59301328,'1','5','5');
INSERT INTO repartidor VALUES (69435750,'3','4','2');
INSERT INTO repartidor VALUES (63252223,'2','2','1');
INSERT INTO repartidor VALUES (45943070,'1','1','3');
INSERT INTO repartidor VALUES (88766027,'1','1','3');
INSERT INTO repartidor VALUES (70107586,'1','3','3');
INSERT INTO repartidor VALUES (47167361,'5','2','5');
INSERT INTO repartidor VALUES (28244296,'3','2','3');
INSERT INTO repartidor VALUES (25439469,'5','5','1');
INSERT INTO repartidor VALUES (72598315,'4','4','4');
INSERT INTO repartidor VALUES (37128995,'3','2','2');
INSERT INTO repartidor VALUES (56162516,'1','5','4');
INSERT INTO repartidor VALUES (18697054,'2','2','2');
INSERT INTO repartidor VALUES (59376484,'5','1','1');
INSERT INTO repartidor VALUES (87086197,'1','1','2');
INSERT INTO repartidor VALUES (74680401,'2','1','1');

#----------------------------------------------------
INSERT INTO proveedor VALUES (94,'Abastecimiento de Perecedores "El cuerno"');
INSERT INTO proveedor VALUES (95,'Suministro de bebidas "La Hacienda"');
INSERT INTO proveedor VALUES (85,'Suministro de Carnes "La granja" ');
INSERT INTO proveedor VALUES (89,'Proveedor Avicola "Chicken"');
INSERT INTO proveedor VALUES (76,'Abastecimiento de Hierbas "La Vista"');
INSERT INTO proveedor VALUES (16,'Suministro de bebidas "La Roja"');
INSERT INTO proveedor VALUES (80,'Suministro de Utencilios de cocina "Fuego"');
INSERT INTO proveedor VALUES (83,'Desechables y Consumibles "Los Higiénicos"');
INSERT INTO proveedor VALUES (42,'Abastecimiento de Perecedores "La huerta"');
INSERT INTO proveedor VALUES (35,'Abastecimiento de Perecedores "El sable"');
INSERT INTO proveedor VALUES (43,'Abastecimiento de condimentos "La vaca"');
INSERT INTO proveedor VALUES (49,'Suministro de bebida Natural "La delicia" ');
INSERT INTO proveedor VALUES (56,'Proveedor de Pasta "La Italiana" ');
INSERT INTO proveedor VALUES (90,'Proveedor de Limones "El limon"');
INSERT INTO proveedor VALUES (75,'Proveedor el Manantial');
INSERT INTO proveedor VALUES (21,'Proveedor de Mariscos');
INSERT INTO proveedor VALUES (59,'Proveedor de Bebidas Gasificadas');
INSERT INTO proveedor VALUES (66,'Proveedor de Lomo');
INSERT INTO proveedor VALUES (99,'Proveedor de Bebidas Alcholicas');
INSERT INTO proveedor VALUES (50,'Proveedor de Utencilios ');

INSERT INTO tipo_proveedor VALUES (94,'Comestibles que requieren refrigeración');
INSERT INTO tipo_proveedor VALUES (95,'Bebidas Alcohólicas');
INSERT INTO tipo_proveedor VALUES (85,'Carne de Cerdo');
INSERT INTO tipo_proveedor VALUES (89,'Pollo');
INSERT INTO tipo_proveedor VALUES (76,'Hierbas');
INSERT INTO tipo_proveedor VALUES (16,'Bebidas Gasificadas');
INSERT INTO tipo_proveedor VALUES (80,'Instrumentos de cocina');
INSERT INTO tipo_proveedor VALUES (83,'Productos de higiene');
INSERT INTO tipo_proveedor VALUES (42,'Verduras');
INSERT INTO tipo_proveedor VALUES (35,'Condimentos');
INSERT INTO tipo_proveedor VALUES (43,'Lácteos');
INSERT INTO tipo_proveedor VALUES (49,'Bebidas Frutales');
INSERT INTO tipo_proveedor VALUES (56,'Pasta');
INSERT INTO tipo_proveedor VALUES (90,'Limones');
INSERT INTO tipo_proveedor VALUES (75,'Agua mineral');
INSERT INTO tipo_proveedor VALUES (21,'Mariscos');
INSERT INTO tipo_proveedor VALUES (59,'Bebidas Gasificadas');
INSERT INTO tipo_proveedor VALUES (66,'Lomo Fino');
INSERT INTO tipo_proveedor VALUES (99,'Bebidas ');
INSERT INTO tipo_proveedor VALUES (50,'Utencilios ');

#---------------------------------------------------------
INSERT INTO consumible VALUES (472,'Sidra','Bebida alcohólica','35','88.99','57920373','95','http://www.elcorreo.com/noticias/201501/15/media/cortadas/sidra--490x578.jpg');
INSERT INTO consumible VALUES (707,'Cerveza','Bebida alcohólica','29','98.74','88720723','95','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2Yp4AG5q6MZawx98U9EEJCtDLBOUtvlXW_Q&usqp=CAU');
INSERT INTO consumible VALUES (187,'Vino','Bebida alcohólica','36','55.66','63918305','95','https://t1.uc.ltmcdn.com/es/posts/4/3/6/curiosidades_del_vino_51634_600_square.jpg');
INSERT INTO consumible VALUES (621,'Vermouth','Bebida alcohólica','38','83.18','76385188','95','https://www.acouplecooks.com/wp-content/uploads/2020/03/Vermouth-003.jpg');
INSERT INTO consumible VALUES (801,'Aguardiente','Bebida alcohólica','25','80.14','34183811','95','https://sumerce.pe/wp-content/uploads/2020/08/agua-ardiente.png');
INSERT INTO consumible VALUES (891,'Jarggermeister','Bebida alcohólica','26','64.86','79622564','95','https://licoresdestilados.es/wp-content/uploads/2022/03/que-es-el-jagermeister-y-como-se-toma.jpg.webp');
INSERT INTO consumible VALUES (611,'Ginebra','Bebida alcohólica','11','15.39','57920373','95','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2Uc2IKO9O5WTXPq-1gms1-SBphe8c-D9-0w&usqp=CAU');
INSERT INTO consumible VALUES (319,'Brandy','Bebida alcohólica','33','66.21','88720723','95','https://brandydomecq.com/wp-content/uploads/portada-brandy-domecq.jpg');
INSERT INTO consumible VALUES (599,'Ron','Bebida alcohólica','12','22.35','63918305','95','https://onlinelicor.es/wp-content/uploads/D3S_3594.jpg');
INSERT INTO consumible VALUES (551,'Tequila','Bebida alcohólica','32','78.36','76385188','95','https://cdn-3.expansion.mx/ec/c4/453061704b8cb5ce3da75a7d002f/istock-139256293.jpg');
INSERT INTO consumible VALUES (278,'Vodka','Bebida alcohólica','24','2.3','34183811','95','https://images.absolutdrinks.com/ingredient-images/Raw/Absolut/3b2c4c4b-4833-4c51-a302-16f510481fdd.jpg?imwidth=500');
INSERT INTO consumible VALUES (847,'Coñac','Bebida alcohólica','10','38.14','79622564','95','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYPhx84Jh1PTXKH_vxgkUTEPBFTYVJQ_7iBQ&usqp=CAU');
INSERT INTO consumible VALUES (195,'Whisky','Bebida alcohólica','34','59.43','57920373','95','https://media.revistagq.com/photos/6358e2dfe39ba178a95cd709/1:1/w_2424,h_2424,c_limit/GettyImages-689479477.jpg');
INSERT INTO consumible VALUES (391,'Absenta','Bebida alcohólica','30','6.06','88720723','95','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgw0srKfMC-W77dG8CGdc9nS570c59R3vy0A&usqp=CAU');
INSERT INTO consumible VALUES (387,'Limonada','Bebida de Limón','39','83.5','63918305','90','https://t1.uc.ltmcdn.com/es/posts/7/6/6/como_hacer_limonada_7667_orig.jpg');
INSERT INTO consumible VALUES (587,'Chicha','Bebida de Maiz Morado','26','60.39','76385188','49','https://polleriaslagranja.com/wp-content/uploads/2022/10/La-Granja-Real-Food-Chicken-Jarra-de-Chicha-Morada.png');
INSERT INTO consumible VALUES (772,'Jugo de Naranja','Bebida de Naranja','40','26.08','34183811','49','https://www.gastrolabweb.com/u/fotografias/m/2021/5/4/f638x638-12673_70840_5050.jpg');
INSERT INTO consumible VALUES (141,'Té ','Bebidá de infusión de Hierbas','22','42.23','79622564','76','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZMdd2ND-s6tRzckSUSbeodxZk9BYSBhkawg&usqp=CAU');
INSERT INTO consumible VALUES (783,'Gaseosa','Bebida Gasificada','19','35.84','57920373','16','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9nFbYFcrMjKekakIJLHQo7ZmDyXyHVwtfFut-DwvFAvxw1MjhjKfbBPslF8a2MSRZhM8&usqp=CAU');
INSERT INTO consumible VALUES (617,'Agua','Agua Mineral','32','22.98','88720723','76','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ26e4ap9pCHN7DMD0r5chWanXbdPfE7z5EJjL5ufSYolhB47Q-ajlOg1yb0P2oJuJuzqE&usqp=CAU');
INSERT INTO consumible VALUES (484,'Ceviche de Camarones','Camarones en nuestra sSalsa Picante,Naranja ,Limón y Cilantro','18','89.02','45270906','21','https://www.comidasperuanas.vip/wp-content/uploads/2020/03/ceviche-de-camarones_.jpg');
INSERT INTO consumible VALUES (448,'Crepes Rellenos ','Jamón , Pollo o Atún','25','4.81','74033159','89','https://content-cocina.lecturas.com/medio/2018/07/19/crepes-rellenas-de-espinacas-jamon-dulce-y-queso-blanco_b6e5d508_800x800.jpg');
INSERT INTO consumible VALUES (274,'Aguacate Rellenos','Pollo en Brunoise o Atún en Lomitos , Verduras y Mayonesa','28','0.87','25920552','89','https://www.cuerpomente.com/medio/2022/06/07/recetas-de-aguacates-rellenos_01771d21_1200x1200.jpg');
INSERT INTO consumible VALUES (423,'Plato Surtido de Frutas','Combinación exquisita de Fruta','23','11.15','54712448','42','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQBTEFxF1IlbjLX85grOgoj41t5X3iQKIMUfgBNxap0IpmiIduEMFyVHwjx28t9r8DDbY&usqp=CAU');
INSERT INTO consumible VALUES (597,'Espárragos Palmitos a la Vinagreta','Ensalada de Espárragos con Salsa de la Casa','23','84.83','54712448','42','https://www.mexicoenmicocina.com/wp-content/uploads/2017/08/Ensalada-de-corazon-de-palma-1-320x320.jpg');
INSERT INTO consumible VALUES (127,'Champipollo','Champiñones , Fajitas de Pollo y Salsa de Ajo','12','17.09','54712448','42','https://e00-telva.uecdn.es/apps/cocina/imagenes/recetas/carne/champipollo.jpg');
INSERT INTO consumible VALUES (504,'Champiñones al Ajillo','Champiñones , salteados en Fina Salsa de Ajo','12','34.63','74033159','42','https://images.hola.com/imagenes/cocina/recetas/20200622170697/champinones-ajillo/0-839-189/champis-ajillo-m.jpg');
INSERT INTO consumible VALUES (790,'Sopa de Cebolla a la Francesa','Deliciosa Sopa al Gratín en Consomé , Vino Blanco','20','65.4','11672402','42','https://www.nuestrorecetario.com/wp-content/uploads/2016/12/Sopa-de-cebolla-1-500x437.jpg');
INSERT INTO consumible VALUES (409,'Filete Mignon','Lomo Fino , Tocineta , Salasa Demiglase y Champiñones','31','18.2','63507877','66','https://www.tipicochileno.cl/wp-content/uploads/2021/05/filete-mignon-1080-1080.jpg');
INSERT INTO consumible VALUES (880,'Mechadito Argentino','Lomo Fino , Tocineta , Salsa Chimichurri','15','90.6','63507877','66','https://cocinerosargentinos.com/content/recipes/500x500/peceto-con-papas-a-la-cacerola.4591.jpg');
INSERT INTO consumible VALUES (252,'Baby Beef','Filete de Lomo Fino con Chimichurri en Finas Hierbas','35','39.21','63507877','66','https://losganaderos.pe/wp-content/uploads/2020/12/baby-beef-1-los-ganaderos.jpg');
INSERT INTO consumible VALUES (250,'Beef Stroganof','Lomo Fino en Julianas , Salsa Demiglase , Vino Tinto,Champiñones','32','63.46','63507877','66','https://www.kitchensanctuary.com/wp-content/uploads/2020/01/Beef-Stroganoff-square-FS-46.jpg');
INSERT INTO consumible VALUES (355,'Bistec a Caballo','Lomo Fino , En Salsa a la Criolla y Huevo Frito','34','7.48','63507877','66','https://img-global.cpcdn.com/recipes/bbe5fca025a2b100/400x400cq70/photo.jpg');
INSERT INTO consumible VALUES (664,'Pollo Grille','Pechuga apanada , rellena de jamón y queso','36','36.51','45270906','89','https://s3.amazonaws.com/nv-almadechef/recetas/a/pechugas-de-pollo-grille-_300x270.jpg');
INSERT INTO consumible VALUES (133,'Cordon Blue Pollo','Jugosa pechuga flameada','36','29.99','25920552','89','https://cdn2.cocinadelirante.com/sites/default/files/styles/gallerie/public/images/2016/09/polloconquesoyjamon.jpg');
INSERT INTO consumible VALUES (502,'Suprema de Pollo ','A las Finas Hiervas , a la Indican , en Champiñones y a la Miel Mostaza','29','89.99','75725818','76','https://t1.uc.ltmcdn.com/es/posts/8/6/6/como_hacer_supremas_de_pollo_rellenas_36668_600.jpg');
INSERT INTO consumible VALUES (887,'Pollo a la Americana','Provocativa Pechuga a la Plancha , Tocienta y Duraznos o Tomate al gratín','26','89.47','25920552','89','https://images.hola.com/imagenes/cocina/recetas/20200205159814/alitas-de-pollo-a-la-americana-buffalo-wings/0-778-671/aitas-de-pollo-a-la-americana-o-buffalo-wings-m.jpg');
INSERT INTO consumible VALUES (374,'Lomo de Cerdo ','Tropical B.B.Q. Exótica,Hawaina,Maracuyá,Cítricos ','18','84.17','25920552','85','https://cdn2.cocinadelirante.com/sites/default/files/styles/gallerie/public/images/2020/12/como-hacer-lomo-de-cerdo-al-ajo-con-mantequilla.jpg');
INSERT INTO consumible VALUES (512,'Milanesa de Cerdo','Exquisito Lomo Apanado con Slasa Rosada','15','65.59','63507877','66','https://www.blogichef.com/wp-content/uploads/2022/11/milanesas-de-cerdo-e1668183025590.webp');
INSERT INTO consumible VALUES (630,'Camarones Orientales A la Plancha','Con frutos de Mar','18','49.95','45270906','21','https://camaroneros.info/wp-content/uploads/camarones-plancha.jpg');

#----------------------------------
INSERT INTO bebida VALUES (472,'Al tiempo');
INSERT INTO bebida VALUES (707,'Helada');
INSERT INTO bebida VALUES (187,'Al tiempo');
INSERT INTO bebida VALUES (621,'1Al tiempo');
INSERT INTO bebida VALUES (801,'Al tiempo');
INSERT INTO bebida VALUES (891,'Helada');
INSERT INTO bebida VALUES (611,'Helada');
INSERT INTO bebida VALUES (319,'Al tiempo');
INSERT INTO bebida VALUES (599,'Al tiempo');
INSERT INTO bebida VALUES (551,'Helada');
INSERT INTO bebida VALUES (278,'Al tiempo');
INSERT INTO bebida VALUES (847,'Al tiempo');
INSERT INTO bebida VALUES (195,'Al tiempo');
INSERT INTO bebida VALUES (391,'Helada');
INSERT INTO bebida VALUES (387,'Helada');
INSERT INTO bebida VALUES (587,'Helada');
INSERT INTO bebida VALUES (772,'Helada');
INSERT INTO bebida VALUES (141,'Helada');
INSERT INTO bebida VALUES (783,'Helada');
INSERT INTO bebida VALUES (617,'Helada');

INSERT INTO sabor_bebida VALUES (472,'Manzana');
INSERT INTO sabor_bebida VALUES (707,'Trigo');
INSERT INTO sabor_bebida VALUES (187,'Uva');
INSERT INTO sabor_bebida VALUES (621,'Cítricos');
INSERT INTO sabor_bebida VALUES (801,'Cítricos');
INSERT INTO sabor_bebida VALUES (891,'Cítricos');
INSERT INTO sabor_bebida VALUES (611,'Cítricos');
INSERT INTO sabor_bebida VALUES (319,'Cítricos');
INSERT INTO sabor_bebida VALUES (599,'Cítricos');
INSERT INTO sabor_bebida VALUES (551,'Cítricos');
INSERT INTO sabor_bebida VALUES (278,'Cítricos');
INSERT INTO sabor_bebida VALUES (847,'Cítricos');
INSERT INTO sabor_bebida VALUES (195,'Cítricos');
INSERT INTO sabor_bebida VALUES (391,'Cítricos');
INSERT INTO sabor_bebida VALUES (387,'Limón');
INSERT INTO sabor_bebida VALUES (587,'Maíz Morado');
INSERT INTO sabor_bebida VALUES (772,'Naranja');
INSERT INTO sabor_bebida VALUES (141,'A elección');
INSERT INTO sabor_bebida VALUES (783,'Té negro');
INSERT INTO sabor_bebida VALUES (617,'No tiene');

#-----------------------------------
INSERT INTO plato VALUES (484);
INSERT INTO plato VALUES (448);
INSERT INTO plato VALUES (274);
INSERT INTO plato VALUES (423);
INSERT INTO plato VALUES (597);
INSERT INTO plato VALUES (127);
INSERT INTO plato VALUES (504);
INSERT INTO plato VALUES (790);
INSERT INTO plato VALUES (409);
INSERT INTO plato VALUES (880);
INSERT INTO plato VALUES (252);
INSERT INTO plato VALUES (250);
INSERT INTO plato VALUES (355);
INSERT INTO plato VALUES (664);
INSERT INTO plato VALUES (133);
INSERT INTO plato VALUES (502);
INSERT INTO plato VALUES (887);
INSERT INTO plato VALUES (374);
INSERT INTO plato VALUES (512);
INSERT INTO plato VALUES (630);

INSERT INTO ingrediente_plato VALUES (484,'Camaron');
INSERT INTO ingrediente_plato VALUES (448,'Pollo');
INSERT INTO ingrediente_plato VALUES (274,'Pollo');
INSERT INTO ingrediente_plato VALUES (423,'Frutas');
INSERT INTO ingrediente_plato VALUES (597,'Espárragos');
INSERT INTO ingrediente_plato VALUES (127,'Pollo y Champiñones');
INSERT INTO ingrediente_plato VALUES (504,'Champiñones');
INSERT INTO ingrediente_plato VALUES (790,'Verduras');
INSERT INTO ingrediente_plato VALUES (409,'Lomo Fino');
INSERT INTO ingrediente_plato VALUES (880,'Lomo Fino');
INSERT INTO ingrediente_plato VALUES (252,'Filete Lomo');
INSERT INTO ingrediente_plato VALUES (250,'Lomo Fino');
INSERT INTO ingrediente_plato VALUES (355,'Lomo Fino');
INSERT INTO ingrediente_plato VALUES (664,'Pollo');
INSERT INTO ingrediente_plato VALUES (133,'Pollo');
INSERT INTO ingrediente_plato VALUES (502,'Pollo');
INSERT INTO ingrediente_plato VALUES (887,'Pollo');
INSERT INTO ingrediente_plato VALUES (374,'Cerdo');
INSERT INTO ingrediente_plato VALUES (512,'Cerdo');
INSERT INTO ingrediente_plato VALUES (630,'Camarones');