# Hands-on Linux-02 : Linux Environment Variables

Purpose of the this hands-on training is to teach the students how to use environment variables.

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- explain environment variables.

- understand Quoting with Variables.

## Outline

- Part 1 - Common Environment Variables & Accessing Variable

- Part 2 - Path Variable

- Part 3 - Quoting with Variables

- Part 4 - Sudo Command
# ip yi isim olarak degistirme
# sudo hostnamectl set-hostname AYNUR (ip yerine AYNUR geldi)(sanalda)
# bi degisken olusrtur NAME = Aynur
# bash deyince yeni bi shell acar ve orda görunmez 
# export AGE = 32 #bu degisken sonraki butun shellerde görünr. env dediginde ordada gorursun. öncekilerde görunmez.

## Part 1 - Common Environment/Shell Variables & Accessing Variable
​
- Difference between "env" and "printenv" commands.
​
```bash
env
printenv
printenv HOME
echo $HOME
env HOME #env | grep HOME
```
​
- Understanding the shell variable.
​
```bash
CLARUS=way #shell degiskni
env #birsey getirmiyor,bu ortam degiskenini görür,shell degiskenini görmez)
set
set | grep CLARUS   #key,value
echo $CLARUS  #value
```
​
- Understanding the environment variable. Use export command.(ortm dgskenini anlamak.disa aktarma komutunu kullan)
​
```bash
export WAY=clarus #ortam degiskeni yapiyo normal degiskenleri
env
echo $SHLVL # hangi shellde oldugunu gösterir

```
​
- Difference between shell and environment variables. Create a user, name it "user1", switch to user1, check the environment and shell variables.(arasndaki fark)
​
```bash
export WAY=clarus
sudo su
useradd user1
passwd user1 # give user1 any password.
exit
su user1
env | grep WAY
set | grep CLARUS
```
​
- Change the environment variable value.
​
```bash
export WAY=linux
env
export WAY=script
env
```

​
- Remove the environment variable with unset command.
​
```bash
export WAY=clarusway
env | grep WAY
unset WAY #degiskeni siler 
env | grep WAY
```
​
## Part 2 - Path Variable
​
- PATH variable. #path te olanlar direk calistirilir
​
```bash
printenv PATH #rootta bak,burda direk calistirmak icin path a tanimlamak lazim
cd /bin
ls ca*    # see the cat command.
```
​
- Add a path to PATH variable for running a script.
​
```bash
cd
mkdir test && cd test
nano test.sh
# copy and paste the code-echo "hello world"- in test.sh
chmod +x test.sh
./test.sh
cd    # change directory to ec2-user's home directory
./test.sh    # it doesnt work. 
./test/test.sh
printenv PATH
cd test
pwd
export PATH=$PATH:/home/ec2-user/test #rootta yap
printenv PATH
cd
test.sh
cd /
test.sh
```
​
- Using the environment variable in the script.
​
```bash
cd test
export CLARUS=env.var
WAY=shell.var
cd test
nano test1.sh
# copy and paste the code-echo "normalde env değişkeni $CLARUS'u görmemiz gerekir ancak muhtemelen $WAY shell değişkenini göremiyoruz "
 #env.var görünür ama shell.var görünmez
# bir script icinde degisken tanimliycaksan ve görülmesini istiyorsan env tanimlamalisin
chmod +x test1.sh
./test1.sh
 export WAY=env.var2 #bunu tanimlarsan way i de gorursun
```
​
## Part 3 - Quoting with Variables.
​
- Double Quotes.
​
```bash
MYVAR=my value #bosluk oldugu icin kabul etmedi
echo $MYVAR
MYVAR="my value" #tirnak icinde kabul ediyor
echo $MYVAR 
MYNAME=Aynur 
MYVAR="my name is $MYNAME"
echo $MYVAR
MYNAME="Aynur"
MYVAR="hello $MYNAME"
echo $MYVAR
MYVAR="hello \$MYNAME" # \ bu isaret kendinden sonra gelenin etkisini kaldirirken ' ' icindekilerin tamaminin etkisini kaldirir
echo $MYVAR
MYVAR='hello $MYNAME'
```
​
- Single Quotes.
​
```bash
echo '$SHELL'
echo 'My\$SHELL'
```
​
## Part 4 - Sudo Command. 

​
- Sudo Command. 
​
```bash 
yum update
sudo yum update
cd /
mkdir testfile
sudo su
sudo -s
sudo su -
```