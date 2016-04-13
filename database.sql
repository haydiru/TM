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
CREATE TABLE IF NOT EXISTS `fakta` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `tahun` smallint(6) NOT NULL, 
  `id_bulan` smallint(6) NOT NULL, 
  `id_wilayah` varchar(11) NOT NULL,
	`kode_unik` varchar(50) NOT NULL,
  `id_variabel` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL, 
  `id_item_kategori` int(11) NOT NULL,
  `id_sumber_data`  int(11) NOT NULL,
  `nilai` double NOT NULL,
  PRIMARY KEY (`id`), 
  KEY `id_bulan` (`id_bulan`), 
  KEY `id_wilayah` (`id_wilayah`), 
  KEY `id_variabel` (`id_variabel`), 
  KEY `id_kategori` (`id_kategori`),
  KEY `id_item_kategori` (`id_item_kategori`),
  KEY `id_sumber_data` (`id_sumber_data`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `item_kategori` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `nama` varchar(255) NOT NULL,
  `item_no` int(11) NOT NULL,
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `kamus_indikator` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `kondef` text ,
  `manfaat` text ,
  `interpretasi` text ,
  `rumus` text ,
  `level_penyajian` text ,
  `publikasi` text ,
  `penyedia_informasi` text ,
  `implementasi` text ,
  `sumber_data` text ,
  `keterbatasan` text ,
  `catatan` text ,
  `id_variabel` int(11) NOT NULL,
  PRIMARY KEY (`id`), 
  KEY `id_variabel` (`id_variabel`) 
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `kategori` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `nama` varchar(64) NOT NULL, 
  `id_variabel` int(11) NOT NULL,
  `keterangan` text,
  PRIMARY KEY (`id`),
  KEY `id_variabel` (`id_variabel`) 
)ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;


CREATE TABLE IF NOT EXISTS `sumber_data` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `tipe` smallint(6),
  `nama_cs` varchar(200),
  `tanggal_cs` date,
  `institusi_cs` text,
  `deskripsi_cs` text,
  `nama_buku` varchar(200),
  `tanggal_buku` date,
  `penerbit_buku` text,
  `status` tinyint(1),
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `topik` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(64) NOT NULL, 
  `keterangan` text,
  `id_parent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `variabel` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_topik` int(11) NOT NULL,  
  `nama` varchar(64) NOT NULL, 
  `keterangan` text,
  `satuan` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_topik` (`id_topik`) 
)ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `wilayah` ( 
  `id` varchar(11) NOT NULL, 
  `nama` varchar(64) NOT NULL, 
  `id_parent` varchar(11) NOT NULL,
  `tipe` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `geoserver_url` ( 
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_wilayah` varchar(11) NOT NULL,  
  `url` text NOT NULL,
  `zoom` smallint(3) NOT NULL,
  `center_x` double NOT NULL,
  `center_y` double NOT NULL,
  `tipe` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_wilayah` (`id_wilayah`)
)ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

ALTER TABLE  `fakta` ADD UNIQUE (`kode_unik`);
ALTER TABLE  `geoserver_url` ADD CONSTRAINT  `geoserver_url_id_wilayah` FOREIGN KEY (`id_wilayah`) REFERENCES `database_gis`.`wilayah` (`id`) ON DELETE CASCADE;
ALTER TABLE `variabel` ADD CONSTRAINT `variabel_id_topik` FOREIGN KEY (`id_topik`) REFERENCES `database_gis`.`topik` (`id`) ON DELETE CASCADE;
ALTER TABLE `kategori` ADD CONSTRAINT `kategori_id_variabel` FOREIGN KEY (`id_variabel`) REFERENCES `database_gis`.`variabel` (`id`) ON DELETE CASCADE;
ALTER TABLE `kamus_indikator` ADD CONSTRAINT `kamus_indikator_id_variabel` FOREIGN KEY (`id_variabel`) REFERENCES `database_gis`.`variabel` (`id`) ON DELETE CASCADE;
ALTER TABLE `fakta` ADD CONSTRAINT `fakta_id_bulan` FOREIGN KEY (`id_bulan`) REFERENCES `database_gis`.`bulan` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `fakta_id_wilayah` FOREIGN KEY (`id_wilayah`) REFERENCES `database_gis`.`wilayah` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `fakta_id_variabel` FOREIGN KEY (`id_variabel`) REFERENCES `database_gis`.`variabel` (`id`) ON UPDATE CASCADE,ADD CONSTRAINT `fakta_id_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `database_gis`.`kategori` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `fakta_id_item_kategori` FOREIGN KEY (`id_item_kategori`) REFERENCES `database_gis`.`item_kategori` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `fakta_id_sumber_data` FOREIGN KEY (`id_sumber_data`) REFERENCES `database_gis`.`sumber_data` (`id`) ON DELETE CASCADE;