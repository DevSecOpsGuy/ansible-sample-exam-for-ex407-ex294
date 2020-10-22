# **Ansible Exam for EX407/EX294**

Provides machines configuration

## **Prerequisites**

- [Vagrant](https://www.vagrantup.com/)
- [Virtualbox](https://www.virtualbox.org/)

## **Playground**

- Generate ssh key pair

```sh
ssh-keygen -f ./ssh-keys/ansible_exam -N "" -q
```

- Lift it up

```sh
vagrant up
```

## **Runbook**

- Check additional volumes were mounted

```sh
lsblk
```
