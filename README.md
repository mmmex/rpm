# Выполнение домашнего задания №7: Управление пакетами. Дистрибьюция софта 

### Запуск ВМ:
```sh
#vagrant up
```
После старта ВМ будет запущен [скрипт](/script.sh), и выполнит все необходимое.

Проверка:

Выполнить команды:
```sh
# vagrant ssh
$ sudo -i
# yum repolist
# yum list | grep nginx-debuginfo
# yum -y install nginx-debuginfo
```

[Лог проверки](/check.log)
