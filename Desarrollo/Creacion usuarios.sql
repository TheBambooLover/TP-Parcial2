SELECT * FROM user;

--
CREATE user auditor@'localhost' IDENTIFIED BY 'claveauditor';
CREATE user administrador@'localhost' IDENTIFIED BY 'claveadministrador';
CREATE USER sitio_web@'%' IDENTIFIED BY 'clavesitioweb';
CREATE USER sitio_web_revisor@'%' IDENTIFIED BY 'clavesitiowebrevisor';
--
GRANT SELECT ON parcial2.* TO auditor;

GRANT ALTER ON parcial2.* TO administrador@'localhost';
GRANT INSERT ON parcial2.* TO administrador@'localhost';

GRANT INSERT ON parcial2.* TO sitio_web@'%';
GRANT SELECT ON parcial2.* TO sitio_web@'%';

GRANT INSERT ON parcial2.* TO sitio_web_revisor@'%';
GRANT EXECUTE ON parcial2.* TO sitio_web_revisor@'%';
