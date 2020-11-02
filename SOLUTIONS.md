# **Solutions to Ansible Sample Exam for EX407/EX294**

Possible [solutions](./SOLUTIONS.md) based on [Ansible Sample Exam for EX407/EX294](https://www.lisenet.com/2019/ansible-sample-exam-for-ex407/).

## **Solutions**

### **Task 1: Ansible Installation and Configuration**

```sh
 ansible-playbook 1_managed-nodes.yml -i inventory -e "ansible_user=vagrant ansible_password=vagrant"
```

### **Task 2: Ad-Hoc Commands**

```sh
sh 2_adoc.sh
```

### **Task 3: File Content**

```sh
ansible-playbook motd.yml -i inventory --become -e "text='Welcome to HAProxy server'" --limit proxy
ansible-playbook motd.yml -i inventory --become -e "text='Welcome to Apache server'" --limit webservers
ansible-playbook motd.yml -i inventory --become -e "text='Welcome to MySQL server'" --limit database

ansible-playbook 3_motd.yml --become
```

### **Task 4: Configure SSH Server**

```sh
ansible-playbook 4_sshd.yml -i inventory --become
```

### **Task 5: Ansible Vault**

```sh
ansible-vault create 5_secrets.yml
echo "devops" >> /home/vagrant/plays/vault_key
```

### **Task 6: Users and Groups**

```sh
ansible-playbook 6_users.yml --vault-password-file /home/vagrant/plays/vault_key -e @5_secrets.yml -e @vars/6_user_list.yml --become
```

### **Task 7: Scheduled Tasks**

```sh
ansible-playbook 7_regular_tasks.yml --become
```

### **Task 8: Software Repositories**

```sh
 ansible-playbook 8_repository.yml --become
```

### **Task 9: Create and Work with Roles**

```sh
cd roles
ansible-galaxy role init sample-mysql
ansible-playbook 9_mysql.yml --vault-password-file /home/vagrant/plays/vault_key -e @5_secrets.yml --become
```

### **Task 10: Create and Work with Roles (Some More)**

```sh
cd roles
ansible-galaxy role init sample-apache

```

### **Task 11: Download Roles From Ansible Galaxy and Use Them**

```sh
ansible-galaxy role install geerlingguy.haproxy -p roles
ansible-playbook 11_haproxy.yml --become

curl http://ansible2.hl.local/
```

### **Task 12: Security**

```sh
 ansible-playbook 12_selinux.yml --become
```

### **Task 13: Use Conditionals to Control Play Execution**

```sh
ansible-playbook 13_sysctl.yml --become
```

### **Task 14: Use Archiving**

```sh
ansible-playbook 14_archive.yml --become
```

### **Task 15: Work with Ansible Facts**

```sh
ansible-playbook 15_facts.yml --become
```

### **Task 16: Software Packages**

```sh
ansible-playbook 16_packages.yml --become
```

### **Task 17: Services**

```sh
ansible-playbook 17_target.yml --become
```

### **Task 18. Create and Use Templates to Create Customised Configuration Files**

```sh
ansible-playbook 18_server_list.yml --become
```
