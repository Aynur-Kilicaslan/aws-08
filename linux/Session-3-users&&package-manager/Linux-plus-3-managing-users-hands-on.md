# Hands-on Linux-03 : Managing Users and Groups

Purpose of the this hands-on training is to teach the students how to manage users and groups.

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- explain users and groups in linux.

- manage users and groups.

## Outline

- Part 1 - Basic User Commands

- Part 2 - User Management

- Part 3 - User Passwords

- Part 4 - Group Management

## Part 1 - Basic User Commands
​
- whoami.
​#sudo komutu ile rootun gücünden faydalaniyoruz.bunu sadece yöneticiler kullanabilir,biz sanal makinasinin yönetisidiyz ondan kullaniok
```bash
whoami
sudo su #root kullanici olarak ec2 user kullanicisini icine giriyor
su root #roota gec diosun sifre ister
pwd
whoami #kullanici adi
su ec2-user
sudo su - # root yetkisi ile o kullanicinin alanina gireriz
pwd
```
​
- who.
​
```bash
exit
who #kullanici adi ne zaman login oldugu ve ipsi
who # open a new shell and retry who command to see the users who logged in.
```
​
- w.
​
```bash
w #kullanici ile en detayli bilgleri icerir
who
```
​
- id.
​
```bash
id #user idsini grpup id yi ve dahil oldugu gruplari gösterir
id root
sudo su #roota gecti
useradd user1 #kullanici ekledi
id user1 
tail /etc/passwd #kullanicilari görürüz
```
​
- su.
​
```bash
su ec2-user
su user1
sudo su user1 #user1 olarak ec2 nun ortamina girdik
pwd
exit #
sudo su - user1 #artik user1 olarak tüm ortami kullaniyoruz
pwd
```
​
- passwd.
​
```bash
exit
sudo su
useradd user2
passwd user2    # give a password to user2 user2 ye pasword ver
su - user2 #user2 ye gecti sifre ile
passwd # user2 nin sifresini degistirdi ama kurallara uygun vermek zorunda,ama rootta iken istedigini verebiliodun (sudo komutu ile) burda sudo komutunu kullanamazsin
exit
su user2
```
​
## Part 2 - User management
​
- /etc/passwd.
​
```bash
exit
cat /etc/passwd
tail -3 /etc/passwd #son 3 kulklanicinin bilgisini gösteriyor
```
​
- useradd.
​
```bash
sudo useradd user3
cd /home
ls #hommdaki kullanicilari gösteriyor
cd /etc
ls login*
cat login.defs
sudo nano login.defs    # change the CREATE_HOME variable's value to "no" #burayi no yaparsan yeni olusturacagin user larin home kolasoru ortami yok,sadece kullanici var test icin bakmak icin vs
sudo useradd user4
cd /home && ls
cat /etc/passwd
sudo useradd -m user5    # force to system to create a home directory for user with -m option.#zorla ortam olusturur
cd /home && ls
sudo useradd -m -d /home/user6home user6    # change the user's home directory name with -d option.# yeni isimle ortami olan bir kullanici olusturuyor
ls
sudo useradd -m -c "this guy is developer" user7    # give a descrpition to user with -c option.kullanica yorum ekliyor
cat /etc/passwd
cat /etc/passwd | grep user7
```
​
- userdel.
​
```bash
cat /etc/passwd
sudo userdel user5 #kullaniciyi sildik
cat /etc/passwd #kullanicilaei görürüz burda sildigimiz gider
cd /home && ls #sildigimizin ortami klasoru duruyor sonradan silebiliriy
sudo userdel -r user1    # delete user and its home directory with -r option.kökten silersin klasoru ile beraber
cd /home && ls 
```
​
- usermod.
​
```bash
cat /etc/passwd 
sudo usermod -c "this guy will be an aws solution architect" user7 #yorumu degistirdik
cat /etc/passwd
sudo usermod --help
sudo usermod -l Superuser user2    # change the name of the user2 with -l option.
cat /etc/passwd
```
​
## Part 3 - User Passwords
​
- passwd-etc/shadow-etc/login.defs.
​
```bash
  sudo su
  useradd user8
  passwd user8cat log 
  cd /etc
  cat shadow 
  cat login.defs
```
​
## Part 4 - Group Management
​
- groups.
​
```bash
groups
sudo groupadd linux
sudo groupadd aws
sudo groupadd python
cat /etc/group
groups user6
sudo usermod -a -G linux ec2-user    # append ec2-user in linux group.
cat /etc/group
groups
sudo usermod -G aws ec2-user    # this command deletes all groups that ec2-user in except default group of ec2-user and add ec2-user to aws group.
cat /etc/group
sudo groupmod -n my-linux linux    # change the name of the linux group.
cat /etc/group
groups
cat /etc/group
sudo groupdel python
cat /etc/group
sudo gpasswd -a user7 aws    # add a user to a group.
cat /etc/group
sudo gpasswd -d user7 aws    # delete a user to a group.
cat /etc/group
```