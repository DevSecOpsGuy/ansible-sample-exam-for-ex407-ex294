# **Ansible Exam for EX407/EX294**

Provides virtual machines to be able to successfully complete all questions and possible [solutions](./SOLUTIONS.md) based on [Ansible Sample Exam for EX407/EX294](https://www.lisenet.com/2019/ansible-sample-exam-for-ex407/).

## **Prerequisites**

- [Vagrant](https://www.vagrantup.com/)
- [Virtualbox](https://www.virtualbox.org/)

## **Playground**

- Generate ssh key pair

  ```sh
  ssh-keygen -f ./ssh-keys/ansible_exam -N "" -q
  ```

- Setting up the environment

  - Bastion

    ```sh
    VAGRANT_VAGRANTFILE=bastion/Vagrantfile vagrant up
    ```

  - Managed nodes

    ```sh
    VAGRANT_VAGRANTFILE=managed-nodes/Vagrantfile vagrant up
    ```

## **Tips**

- Check additional volumes were mounted

  ```sh
  lsblk
  ```

- Replace `tab` with `spaces` for `vi`

  ```sh
  echo "set expandtab
  set tabstop=2
  set shiftwidth=2" > ~/.vimrc
  ```

- Verify `.ssh` permissions

  ```sh
  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/authorized_keys
  chmod 600 ~/.ssh/id_rsa
  chmod 644 ~/.ssh/id_rsa.pub
  ```
