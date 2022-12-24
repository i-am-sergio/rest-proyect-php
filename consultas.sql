

use restaurant;
SELECT a.DNI 'DNI', CONCAT(a.nombres,' ',a.primer_apellido,' ',a.segundo_apellido) AS 'Nombre completo', a.foto_path 'Foto',
ec.especialidad AS `especialidad`
FROM trabajador_restaurante a
INNER JOIN chef b
INNER JOIN especialidad_chef ec
ON b.DNI = a.DNI 
AND ec.id_chef = b.DNI





USE dbrest;
SELECT * FROM `contact`;
SELECT * FROM `customer`;
SELECT * FROM `food`;
SELECT * FROM `manager`;
SELECT * FROM `orders`;
SELECT * FROM `restaurants`;


CREATE TABLE `cocineros` (
  `id` int,
  `nombres` varchar(50),
  `apellidos` varchar(50),
  `description` varchar(200),
  `images_path` varchar(200)
);


INSERT INTO `cocineros` (`id`, `nombres`, `apellidos`, `description`, `images_path`) VALUES
(1, 'Gaston1','Acurio', 'Es un cocinero muy famoso', 'https://www.turismotailandes.com/wp-content/uploads/2019/04/Pepe-imagen-e1554911883125.jpg'),
(2, 'Gaston2','Acurio', 'Es un cocinero muy famoso', 'https://cdn.discordapp.com/attachments/1049140237735051375/1055887806435700757/E5HpzmGXMAAwQ9g.png'),
(3, 'Gaston3','Acurio', 'Es un cocinero muy famoso', 'https://static.wixstatic.com/media/880113_f741a40f7e9b43e9bfdb0dbce870e141.jpg/v1/fill/w_242,h_319,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/880113_f741a40f7e9b43e9bfdb0dbce870e141.jpg'),
(4, 'Gaston4','Acurio', 'Es un cocinero muy famoso', 'https://cruceroadicto.com/wp-content/uploads/2018/03/Ramon-Freixa-MSC-Cruceros.jpg'),
(5, 'Gaston5','Acurio', 'Es un cocinero muy famoso', 'https://buenazo.cronosmedia.glr.pe/original/2021/07/23/60faf2f0000179738b6bee4a.jpg'),
(6, 'Gaston6','Acurio', 'Es un cocinero muy famoso', 'https://buenazo.cronosmedia.glr.pe/original/2021/07/23/60faefe9000179738b6bee49.jpg'),
(7, 'Gaston7','Acurio', 'Es un cocinero muy famoso', 'https://www.cronista.com/files/image/296/296266/5ffe0af5f20e1.webp?oe=jpg'),
(8, 'Gaston8','Acurio', 'Es un cocinero muy famoso', 'https://s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/04/27162529/Chef-Mitsuharu-Tsumura-REVISTA-3-777x1024.jpg'),
(9, 'Gaston9','Acurio', 'Es un cocinero muy famoso', 'https://buenazo.cronosmedia.glr.pe/original/2021/07/23/5fae1552b497360edd1a4283.jpg'),
(10, 'Gaston10','Acurio', 'Es un cocinero muy famoso', 'https://imagenes.elpais.com/resizer/5ZlJirN35cq546wTpgJ5YVJ3eYQ=/414x0/cloudfront-eu-central-1.images.arcpublishing.com/prisa/GDTRXGIV5YK2DXJ2TT5ZHNRRKU.jpg'),
(11, 'Gaston11','Acurio', 'Es un cocinero muy famoso', 'https://static2.mujerhoy.com/www/multimedia/202201/25/media/cortadas/jesus-sanchez1-kMj-U160651653586mpB-1248x1248@MujerHoy.jpg'),
(12, 'Gaston12','Acurio', 'Es un cocinero muy famoso', 'https://images.hola.com/imagenes/cocina/noticiaslibros/20190703145092/mejores-mujeres-cocineras-espana/0-697-558/pepa-munoz-a.jpg'),
(13, 'Gaston13','Acurio', 'Es un cocinero muy famoso', 'http://bitly.ws/ybZz')
