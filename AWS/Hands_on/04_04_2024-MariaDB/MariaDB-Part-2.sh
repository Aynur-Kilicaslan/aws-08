# Part 2 - Connecting and Configuring MariaDB Database

# Connect to the MariaDB Server and open MySQL CLI with root user, no password set as default.
mysql -u root #sql e baglandik

# Show default databases in the MariaDB Server.
SHOW DATABASES; #database leri gösterdi

# Choose a database (mysql db) to work with. ⚠️ Caution: We have chosen mysql db as demo purposes, normally database mysql is used by server itself, it shouldn't be changed or altered by the user.
USE mysql; #buraya gecis yapti mysgl databse e

# Show tables within the mysql db.
SHOW TABLES; #mysql icindeki tablolara bakalim

# Show users defined in the db server currently.
SELECT Host, User, Password FROM user; # herhangi bir  pasword yok,bu yuzden bizi hemen bagladi,herkeste baglanabilir,ama biz sifre koycaz simdi

#Close the mysql terminal.
EXIT;

# Setup secure installation of MariaDB.
# No root password for root so 'Enter' for first question,
# Then set root password: 'root1234' and yes 'y' to all remaining ones.
sudo mysql_secure_installation #secur ayari yapmak istedigimizi soyluyoruz,gelene enterla y de yeni oass gir yroot1234
#anonym kullanicilar cikartilsin mi y,
#disallow root.. root kullanicisini uzaktan erisime engellensin mi? y 
#Remove test database and access to it? test database e girisi engellemek ister misin ? bunu remove edelimy
#Reload privilege tables now? yaptigin tüm degisiklikler tablolara islensin mi? y
#artik database in güvenli

# Show that you can not log into mysql terminal without password anymore.
mysql -u root #bizi almadi 

#Connect to the MariaDB Server and open MySQL CLI with root user and password (pw:root1234).
mysql -u root -p # root olarak password ile baglan dedik,sifreyi gir baglandik

# Show that test db is gone.
SHOW DATABASES;

# List the users defined in the server and show that it has now password and its encrypted.
USE mysql;
SELECT Host, User, Password FROM user;

# Create new database named 'clarusdb'.
CREATE DATABASE clarusdb;

# Show newly created database.
SHOW DATABASES;

# Create a user named 'clarususer'.
CREATE USER clarususer IDENTIFIED BY 'clarus1234';

# Grant permissions to the user clarususer for database clarusdb.
GRANT ALL ON clarusdb.* TO clarususer IDENTIFIED BY 'clarus1234' WITH GRANT OPTION; #kullaniciya butun yetkileri verdik

# Update privileges.
FLUSH PRIVILEGES; #yaptigimiz yetkiler komutlar ilgili tablolara islensin update yapilsin dedik

# Close the mysql terminal.
EXIT;
