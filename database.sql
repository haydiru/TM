CREATE TABLE IF NOT EXISTS `user` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `username` varchar(64) NOT NULL, 
  `nama_depan` varchar(64) NOT NULL, 
  `nama_tengah` varchar(64) NOT NULL, 
  `nama_belakang` varchar(64) NOT NULL, 
  `tg_lahir` DATE, 
  `id_sex` smallint(1), 
  `id_negara` int(11),
   `id_prov` int(11),
   `id_kab` int(11),
   `id_kec` int(11),
   `id_scan` text,
   `aut_key` varchar(32),
   `password_hash` varchar(225),
   `password_reset_token` varchar(225),
   `id_stasus` smallint(6),
   `create_at` int(11),
   `update_at` int(11),
  KEY `id_sex` (`id_sex`), 
  KEY `id_negara` (`id_negara`), 
  KEY `id_prov` (`id_prov`), 
  KEY `id_kab` (`id_kab`),
  KEY `id_kec` (`id_kec`),
  KEY `id_status` (`id_status`),
  PRIMARY KEY (`id`) 
)ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `traveler_posting` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `id_user` int(11) NOT NULL,
	`id_negara_asal` int(11) NOT NULL,
   `id_prov_asal` int(11) NOT NULL,
   `id_kab_asal` int(11) NOT NULL,
   `id_kec_asal` int(11) NOT NULL,
	`id_negara_destinasi` int(11) NOT NULL,
   `id_prov_destinasi` int(11) NOT NULL,
   `id_kab_destinasi` int(11) NOT NULL,
   `id_kec_destinasi` int(11) NOT NULL,
   `id_travel_frek` smallint(6) NOT NULL,
   `day_departure` DATE NOT NULL,
   `day_arrival` DATE NOT NULL,
   `id_barang` int(11),
   `harga` int(11),
   `id_basis_harga` int(11) NOT NULL,
   `weight_price` int(11),
   `volume_price` int(11),
   `person_price` int(11),
   `other_price` int(11),
   `contact_phone` int(11),
   `contact_bb` varchar(64),
   `contact_wa` int(11),
   `contact_email` varchar(64),
   `id_payment` smallint(6),
   `id_status_pos` smallint(6),
   `create_at` int(11),
   `update_at` int(11),
  KEY `id_user` (`id_user`), 
  KEY `id_negara_asal` (`id_negara_asal`), 
  KEY `id_prov_asal` (`id_prov_asal`), 
  KEY `id_kab_asal` (`id_kab_asal`),
  KEY `id_kec_asal` (`id_kec_asal`),
  KEY `id_negara_destinasi` (`id_negara_destinasi`), 
  KEY `id_prov_destinasi` (`id_prov_destinasi`), 
  KEY `id_kab_destinasi` (`id_kab_destinasi`),
  KEY `id_kec_destinasi` (`id_kec_destinasi`),
  KEY `id_barang` (`id_barang`),
  KEY `id_status_pos` (`id_status_pos`),
  KEY `id_payment` (`id_payment`),
  PRIMARY KEY (`id`)
)ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `negara` ( 
  `id` varchar(11) NOT NULL, 
  `nama` varchar(64) NOT NULL, 
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `provinsi` ( 
  `id` varchar(11) NOT NULL, 
  `nama` varchar(64) NOT NULL, 
  `id_negara` varchar(64) NOT NULL, 
  KEY `id_negara` (`id_negara`),
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `kabupaten` ( 
  `id` varchar(11) NOT NULL, 
  `nama` varchar(64) NOT NULL, 
  `id_provinsi` varchar(64) NOT NULL, 
  KEY `id_provinsi` (`id_provinsi`),
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `kecamatan` ( 
  `id` varchar(11) NOT NULL, 
  `nama` varchar(64) NOT NULL, 
  `id_kabupaten` varchar(64) NOT NULL, 
  KEY `id_kabupaten` (`id_kabupaten`),
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `message` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `nama` varchar(64) NOT NULL,
  `idusersender` int(11) NOT NULL, 
  `iduserreceiver` int(11) NOT NULL, 
  `time` int(11) NOT NULL, 
  `isread` boolean NOT NULL, 
  `issent` boolean NOT NULL, 
  `isi` text, 
  KEY `idusersender` (`idusersender`),
  KEY `iduserreceiver` (`iduserreceiver`),
  PRIMARY KEY (`id`)
)ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `testimoni` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `id_traveler_posting` int(11) NOT NULL,
  `id_consumer` int(11) NOT NULL, 
  `rate` smallint(6) NOT NULL, 
  `time` int(11) NOT NULL, 
  `isi` text, 
  `kontak` boolean, 
  KEY `id_traveler_posting` (`id_traveler_posting`),
  KEY `idusersender` (`idusersender`),
  KEY `iduserreceiver` (`iduserreceiver`),
  PRIMARY KEY (`id`)
)ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `barang` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `id_traveler_posting` int(11) NOT NULL,
  `id_type_barang` int(11) NOT NULL,
  KEY `id_traveler_posting` (`id_traveler_posting`),
  KEY `id_type_barang` (`id_type_barang`),
  PRIMARY KEY (`id`)
)ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `type_barang` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `nama` varchar(64),
  PRIMARY KEY (`id`)
)ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `status` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `nama` varchar(64),
  PRIMARY KEY (`id`)
)ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `basis_harga` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `nama` varchar(64),
  PRIMARY KEY (`id`)
)ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `payment` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `nama` varchar(64),
  PRIMARY KEY (`id`)
)ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

ALTER TABLE  `fakta` ADD UNIQUE (`kode_unik`);
ALTER TABLE  `geoserver_url` ADD CONSTRAINT  `geoserver_url_id_wilayah` FOREIGN KEY (`id_wilayah`) REFERENCES `database_gis`.`wilayah` (`id`) ON DELETE CASCADE;
ALTER TABLE `variabel` ADD CONSTRAINT `variabel_id_topik` FOREIGN KEY (`id_topik`) REFERENCES `database_gis`.`topik` (`id`) ON DELETE CASCADE;
ALTER TABLE `kategori` ADD CONSTRAINT `kategori_id_variabel` FOREIGN KEY (`id_variabel`) REFERENCES `database_gis`.`variabel` (`id`) ON DELETE CASCADE;
ALTER TABLE `kamus_indikator` ADD CONSTRAINT `kamus_indikator_id_variabel` FOREIGN KEY (`id_variabel`) REFERENCES `database_gis`.`variabel` (`id`) ON DELETE CASCADE;
ALTER TABLE `fakta` ADD CONSTRAINT `fakta_id_bulan` FOREIGN KEY (`id_bulan`) REFERENCES `database_gis`.`bulan` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `fakta_id_wilayah` FOREIGN KEY (`id_wilayah`) REFERENCES `database_gis`.`wilayah` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `fakta_id_variabel` FOREIGN KEY (`id_variabel`) REFERENCES `database_gis`.`variabel` (`id`) ON UPDATE CASCADE,ADD CONSTRAINT `fakta_id_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `database_gis`.`kategori` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `fakta_id_item_kategori` FOREIGN KEY (`id_item_kategori`) REFERENCES `database_gis`.`item_kategori` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `fakta_id_sumber_data` FOREIGN KEY (`id_sumber_data`) REFERENCES `database_gis`.`sumber_data` (`id`) ON DELETE CASCADE;