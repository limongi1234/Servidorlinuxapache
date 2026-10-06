# Servidor Web Apache — Infraestrutura como Código

Script Bash que provisiona um servidor web **Apache** em Linux e publica um site estático automaticamente. Projeto desenvolvido no curso de Linux da DIO.

## O que o script faz

1. Atualiza os pacotes do sistema.
2. Instala `apache2`, `unzip` e `wget`.
3. Baixa o site de exemplo ([denilsonbonatti/linux-site-dio](https://github.com/denilsonbonatti/linux-site-dio)) e copia os arquivos para `/var/www/html`.
4. Habilita e inicia o serviço do Apache.

## Como usar

Em um servidor Debian/Ubuntu (de preferência uma máquina virtual de testes):

```bash
chmod +x script-iac2.sh
sudo ./script-iac2.sh
```

Ao final, o script mostra o endereço IP em que o site está disponível.
