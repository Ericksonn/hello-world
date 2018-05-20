#!bin/bash
#NAC20

echo "escolha um número entre 1 e 6"
read NUMBER
case $NUMBER in

#Criação do usuário
1)
clear
echo "Digite o nome do usuário a ser adicionado"
MSG="Erro usuario não informado"
read USER

#Testando a variável USER

test -z $USER && echo "$MSG" && exit

#Vlaidando se o usuário existe

RESP=$(getent passwd | grep $USER)
test -z $RESP
if [ $? -eq 0 ]; then
	echo "Usuario não existe"
		else
	echo "Usuario Existe"
	exit
fi
echo "Adicionando o usuario $USER..."
sleep 3
useradd $USER
echo "Usuáro $USER adicionado"
;;

#Alterando a senha do usuario
2)
clear
echo "Digite o usuario que voce deseja alterar a senha"
MSG="Erro usuario não informado"
read USER

#Testando a variável USER

test -z $USER && echo "$MSG" && exit

#Vlaidando se o usuário existe

RESP=$(getent passwd | grep $USER)
test -z $RESP
if [ $? -eq 1 ]; then
        echo "Usuario existe"
                else
        echo "Usuario não Existe"
        exit
fi
passwd $USER 
echo "Senha do usuario $USER alterada com sucesso"
;;

#Adicionando um gurpo
3)
clear
echo "Digite um grupo que deseja adicionar"
MSG="Erro usuario não informado"
read GROUP

#Testando a variável GROUP

test -z $GROUP && echo "$MSG" && exit

#Vlaidando se o grupo existe

RESP=$(getent passwd | grep $GROUP)
test -z $RESP
if [ $? -eq 0 ]; then
        echo "Grupo não existe"
                else
        echo "Gruṕo Existe"
        exit
fi
echo "Adicionando o grupo $GROUP..."
sleep 3
groupadd $GROUP
echo "Grupo $GROUP adicionado"
;;

#Adicionando um user a um grupo
4)
clear
echo "A seguir digite o usuário e o grupo ao qual vocẽ deseja adiciona-lo"
echo "Digite o usuário"
MSG="Erro usuario não informado"
read USER

#Testando a variável USER

test -z $USER && echo "$MSG" && exit

#Vlaidando se o usuário existe

RESP=$(getent passwd | grep $USER)
test -z $RESP
if [ $? -eq 1 ]; then
        echo "Usuario existe"
                else
        echo "Usuario não Existe"
        exit
fi

echo "Digite o grupo"
MSG="Erro usuario não informado"
read GROUP

#Testando a variável GROUP

test -z $GROUP && echo "$MSG" && exit

#Vlaidando se o grupo existe

RESP=$(getent passwd | grep $GROUP)
test -z $RESP
if [ $? -eq 0 ]; then
        echo "Grupo existe"
                else
        echo "Gruṕo não Existe"
        exit
fi
echo "Adicionando o usuario $USER ao grupo $GROUP..."
sleep 3
echo "Usuario $USER adicionado ao grupo $GROUP"
;;

#Removendo usuário
5)
clear
echo "Digite o nome do usuário a ser excluido"
MSG="Erro usuario não informado"
read USER

#Testando a variável USER

test -z $USER && echo "$MSG" && exit

#Vlaidando se o usuário existe

RESP=$(getent passwd | grep $USER)
test -z $RESP
if [ $? -eq 1 ]; then
        echo "Usuario existe"
                else
        echo "Usuario não Existe"
        exit
fi
echo "Excluindo o usuario $USER..."
sleep 3
userdel $USER
echo "Usuáro $USER excluido"
;;

#Excluindo um grupo
6)
clear
echo "Digite o nome do grupo a ser excluido"
MSG="Erro grupo não informado"
read GROUP

#Testando a variável GROUP

test -z $GROUP && echo "$MSG" && exit

#Vlaidando se o grupo existe

RESP=$(getent passwd | grep $GROUP)
test -z $RESP
if [ $? -eq 0 ]; then
        echo "Grupo existe"
                else
	echo "Grupo não Existe"
        exit
fi
echo "Excluindo o grupo $GROUP..."
sleep 3
groupdel $GROUP
echo "Grupo $GROUP excluido"
;;
esac
