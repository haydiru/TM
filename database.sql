CREATE TABLE IF NOT EXISTS `user` ( 
 `id` int(11) NOT NULL AUTO_INCREMENT, 
 `username` varchar(255) NOT NULL, 
 `nama_depan` varchar(64) NOT NULL, 
 `nama_tengah` varchar(64) NOT NULL, 
 `nama_belakang` varchar(64) NOT NULL, 
 `tg_lahir` DATE, 
 `id_sex` smallint(1), 
 `id_negara` varchar(11) NOT NULL,
 `id_prov` varchar(11) NOT NULL,
 `id_kab` varchar(11) NOT NULL,
 `id_kec` varchar(11) NOT NULL,
 `id_scan` text,
 `aut_key` varchar(32) NOT NULL,
 `email` varchar(255) NOT NULL,
 `password_hash` varchar(225) NOT NULL,
 `password_reset_token` varchar(225) NULL,
 `id_status` smallint(6),
 `create_at` int(11),
 `update_at` int(11),
 
 KEY `username` (`username`),
 KEY `password_reset_token` (`password_reset_token`),
 KEY `id_sex` (`id_sex`), 
 KEY `id_negara` (`id_negara`), 
 KEY `id_prov` (`id_prov`), 
 KEY `id_kab` (`id_kab`),
 KEY `id_kec` (`id_kec`),
 KEY `id_status` (`id_status`),
 PRIMARY KEY (`id`) 
)ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `traveler_posting` ( 
`id` int(11) NOT NULL AUTO_INCREMENT, 
`id_user` int(11) NOT NULL,
`id_negara_asal` varchar(11) NOT NULL,
`id_prov_asal` varchar(11) NOT NULL,
`id_kab_asal` varchar(11) NOT NULL,
`id_kec_asal` varchar(11) NOT NULL,
`id_negara_destinasi` varchar(11) NOT NULL,
`id_prov_destinasi` varchar(11) NOT NULL,
`id_kab_destinasi` varchar(11) NOT NULL,
`id_kec_destinasi` varchar(11) NOT NULL,
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
`id_status_pos` smallint(6) NOT NULL,
`create_at` int(11),
`update_at` int(11),
KEY `id_user` (`id_user`), 
KEY `id_negara_asal` (`id_negara_asal`), 
KEY `id_basis_harga` (`id_basis_harga`), 
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
)ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

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
)ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `testimoni` ( 
 `id` int(11) NOT NULL AUTO_INCREMENT, 
 `id_traveler_posting` int(11) NOT NULL,
 `id_consumer` int(11) NOT NULL, 
 `rate` smallint(6) NOT NULL, 
 `time` int(11) NOT NULL, 
 `isi` text, 
 `kontak` boolean, 
 KEY `id_traveler_posting` (`id_traveler_posting`),
 KEY `id_consumer` (`id_consumer`),
 PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `barang` ( 
 `id` int(11) NOT NULL AUTO_INCREMENT, 
 `id_traveler_posting` int(11) NOT NULL,
 `id_type_barang` int(11) NOT NULL,
 KEY `id_traveler_posting` (`id_traveler_posting`),
 KEY `id_type_barang` (`id_type_barang`),
 PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `type_barang` ( 
 `id` int(11) NOT NULL AUTO_INCREMENT, 
 `nama` varchar(64),
 PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `status` ( 
 `id` smallint(6) NOT NULL AUTO_INCREMENT, 
 `nama` varchar(64),
 PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `basis_harga` ( 
 `id` int(11) NOT NULL AUTO_INCREMENT, 
 `nama` varchar(64),
 PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `payment` ( 
 `id` smallint(6) AUTO_INCREMENT, 
 `nama` varchar(64),
 PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

ALTER TABLE `user` ADD CONSTRAINT `user_id_negara` FOREIGN KEY (`id_negara`) REFERENCES `titip_dbs`.`negara` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `user_id_prov` FOREIGN KEY (`id_prov`) REFERENCES `titip_dbs`.`provinsi` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `user_id_kab` FOREIGN KEY (`id_kab`) REFERENCES `titip_dbs`.`kabupaten` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `user_id_kec` FOREIGN KEY (`id_kec`) REFERENCES `titip_dbs`.`kecamatan` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `user_id_status` FOREIGN KEY (`id_status`) REFERENCES `titip_dbs`.`status` (`id`) ON DELETE CASCADE;
ALTER TABLE `traveler_posting` ADD CONSTRAINT `traveler_posting_id_user` FOREIGN KEY (`id_user`) REFERENCES `titip_dbs`.`user` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `traveler_posting_id_negara_asal` FOREIGN KEY (`id_negara_asal`) REFERENCES `titip_dbs`.`negara` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `traveler_posting_id_prov_asal` FOREIGN KEY (`id_prov_asal`) REFERENCES `titip_dbs`.`provinsi` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `traveler_posting_id_kab_asal` FOREIGN KEY (`id_kab_asal`) REFERENCES `titip_dbs`.`kabupaten` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `traveler_posting_id_kec_asal` FOREIGN KEY (`id_kec_asal`) REFERENCES `titip_dbs`.`kecamatan` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `traveler_posting_id_negara_destinasi` FOREIGN KEY (`id_negara_destinasi`) REFERENCES `titip_dbs`.`negara` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `traveler_posting_id_prov_destinasi` FOREIGN KEY (`id_prov_destinasi`) REFERENCES `titip_dbs`.`provinsi` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `traveler_posting_id_kab_destinasi` FOREIGN KEY (`id_kab_destinasi`) REFERENCES `titip_dbs`.`kabupaten` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `traveler_posting_id_kec_destinasi` FOREIGN KEY (`id_kec_destinasi`) REFERENCES `titip_dbs`.`kecamatan` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `traveler_posting_id_barang` FOREIGN KEY (`id_barang`) REFERENCES `titip_dbs`.`barang` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `traveler_posting_id_status_pos` FOREIGN KEY (`id_status_pos`) REFERENCES `titip_dbs`.`status` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `traveler_posting_id_payment` FOREIGN KEY (`id_payment`) REFERENCES `titip_dbs`.`payment` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `traveler_posting_id_basis_harga` FOREIGN KEY (`id_basis_harga`) REFERENCES `titip_dbs`.`basis_harga` (`id`) ON DELETE CASCADE;
ALTER TABLE `provinsi` ADD CONSTRAINT `provinsi_id_negara` FOREIGN KEY (`id_negara`) REFERENCES `titip_dbs`.`negara` (`id`) ON DELETE CASCADE;
ALTER TABLE `kabupaten` ADD CONSTRAINT `kabupaten_id_provinsi` FOREIGN KEY (`id_provinsi`) REFERENCES `titip_dbs`.`provinsi` (`id`) ON DELETE CASCADE;
ALTER TABLE `kecamatan` ADD CONSTRAINT `kecamatan_id_kabupaten` FOREIGN KEY (`id_kabupaten`) REFERENCES `titip_dbs`.`kabupaten` (`id`) ON DELETE CASCADE;
ALTER TABLE `message` ADD CONSTRAINT `message_idusersender` FOREIGN KEY (`idusersender`) REFERENCES `titip_dbs`.`user` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `message_iduserreceiver` FOREIGN KEY (`iduserreceiver`) REFERENCES `titip_dbs`.`user` (`id`) ON DELETE CASCADE;
ALTER TABLE `testimoni` ADD CONSTRAINT `testimoni_id_traveler_posting` FOREIGN KEY (`id_traveler_posting`) REFERENCES `titip_dbs`.`traveler_posting` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `testimoni_id_consumer` FOREIGN KEY (`id_consumer`) REFERENCES `titip_dbs`.`user` (`id`) ON DELETE CASCADE;
ALTER TABLE `barang` ADD CONSTRAINT `barang_id_traveler_posting` FOREIGN KEY (`id_traveler_posting`) REFERENCES `titip_dbs`.`traveler_posting` (`id`) ON DELETE CASCADE, ADD CONSTRAINT `barang_type_barang` FOREIGN KEY (`id_type_barang`) REFERENCES `titip_dbs`.`type_barang` (`id`) ON DELETE CASCADE;
