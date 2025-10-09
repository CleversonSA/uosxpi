# uosxpi

Um "clone" do MSX 1 e MSX 2 baseado no port do emulador Blue MSX para linux e no fork do Blueberry MSX (https://github.com/matheusjgsantos/BlueberryMSX-2.0plus), usando uma imagem refinada do Raspberry PI OS Lite 32bits e voltado para a utilização da placa adaptadora RPMC (https://github.com/meesokim/msxslot).

Basta queimar a imagem em um cartão SD e usar o emulador do MSX, mensagens do console, comandos linux, logins etc. Diversão direto ao assunto.

# ANTES DE COMEÇAR

Lembre-se que esse é um projeto hobby, está ainda no estágio beta e de refinamento. Entenda que problemas, remotos, poderão acontecer. Então, por sua conta em risco! Boa sorte.

# RPMC

O projeto nasceu para a utilização da placa adaptadora de cartuchos de MSX para Raspberry PI, criada por meesokim (https://github.com/meesokim/msxslot) e ser quase um "MSX" mini, ainda que emulado. A placa pode ser montada ou pode ser adquirida no site do Victor Trucco (https://loja.victortrucco.com/msxpi)

# Pré-requisitos

Você irá precisar de:

	- Raspberry PI 3B
  - Placa RPMC
  - Teclado USB qualquer
  - Monitor HDMI
  - Cartão SD (mínimo 8GB)
  - (Opcional) Cartucho de jogo qualquer (somente para testar o carregamento)
  - Fonte 5V de no mínimo 2A (menos que isso vão aparecer mensagens de "undervoltage" e pode não funcionar a contento o conjunto)

# Instalação

Devido a limitacao de tamanho de arquivos do GitHub (100MB no plano free), as imagens tiveram que ser hospedadas em outro lugar, todavia, seguem os links abaixo:

| Data de lancamento | Arquivo | Tamanho estimado | Link para download |
| :---: | :---: | :---: | :---: |
| 09/10/2025 | umsxpi-rpi32-openmsx18-1.1.0.img | 5.47GB |https://drive.google.com/file/d/1CgXYqz3FWKDRIX2jsybpgL1BD3Kf9fIN/view?usp=drive_link|
| 22/07/2025 | uosxpi-rpi32-openmsx-1.0.1.img | 5.42GB |https://drive.google.com/file/d/1u877i-Nh13IshybfbvdMw5NoP5Hb05cP/view?usp=drivesdk|
| 02/06/2024 | uosxpi-rpi3-32bit-v0.9.0.img | 3.3GB | (indisponível temporariamente) |

Baixe a imagem mais recente no repositório e queime em um cartão SD utilizando o programa de preferência. Se for o Windows, por exemplo, existe o Balena Etcher (https://etcher.balena.io/) que pode fazer esse trabalho. No linux, pode ser usado o comando dd ou o app Disks (distribuições baseadas no Ubuntu). 

Após queimar a imagem do uosxpi no cartão no PC, coloque-o no Raspberry PI, ligue o teclado, a placa RPMC nos pinos da GPIO, conecte o Raspberry PI no monitor HDMI. Por último, a fonte no RPi, logo será inicializado.

O primeiro boot pode demorar até 20-30 segundos e a tela do MSX2 aparecerá para uso com o MSX-DOS carregado.

---

# PARA VERSÃO NOVA BASEADA EM OPENMSX

**Atenção - No OpenMSX o RPMC NÃO FUNCIONA**

Nessa versão de imagem a placa RPMC NÃO FUNCIONA! Existe uma versão do OpenMSX antiga que foi adicionado suporte a essa placa, no entanto, a versão está muito defasada e talvez em um futuro pode ser feito um merge, mas não sei se vale a pena. Esteja ciente disso ao usar essa nova imagem. A imagem vem completa com imagem de HD de 1GB (dá e sobra), MSX-DOS2, SofaRun e extras e era de meu uso pessoal para um portátil que montei com o Raspberry PI 3B.

**Uso**

 - Insira o cartão no Raspberry PI 3B
 - Execute e aguarde em torno de 20 segundos. O sistema irá carregar.

**Reiniciando o MSX dentro do OpenMSX sem precisar reiniciar o Raspberry PI (útil quando está jogando)**

  - Pressione a tecla F10 para abrir o Console
  - Digite o comando "reset" e pressione ENTER
  - Pressione a tecla F10 para fechar o Console.

**Desligando de maneira correta o Raspberry para evitar corrompimento do SD**

  - Pressione a tecla F10 para abrir o Console
  - Digite o comando "quit" e pressione ENTER
  - Aguarde o encerramento do linux e desligue o Raspberry PI com segurança


**Trocando de modelo de MSX - Caso esteja no HotBit ou Expert 1.1 (versão 1.1.0 ou superior)**
  - Se estiver no MSX-DOS, entre no BASIC, digitando "basic" e pressionando ENTER
  - Digite LOAD "CHMSX.BAS" e pressione ENTER
  - Digite RUN e pressione ENTER
  - Escolha uma das opções no menu e aguarde alguns segundos para o reinício do emulador


**Trocando de modelo de MSX - Caso esteja no Expert 3 (MSX2) (versão 1.1.0 ou superior)**
  - Se estiver no MSX-DOS, digite o comando "CD C:\BASIC" e pressione ENTER
  - Entre no BASIC, digitando "basic" e pressionando ENTER
  - Digite LOAD "CHMSX.BAS" e pressione ENTER
  - Digite RUN e pressione ENTER
  - Escolha uma das opções no menu e aguarde alguns segundos para o reinício do emulador


**Acessando modo administrador (linux, para manutenções avançadas)**

  - Pressione as teclas ALT+F3 depois ENTER
  - No prompt do console entre com o usuário "umsxpi" pressione ENTER
  - Entre com a senha "umsxpi"
  - Todos os scripts e atalhos estão na pasta /home/umsxpi. Altere com cautela.


**Problemas no Som ou sem áudio HDMI (RPi 4/RPi 400)**

  - Entre no modo administrador do linux, passos no parágrafo anterior
  - Digite o comando "sudo raspi-config" e pressione ENTER
  - Entre no menu "System Options"
  - Escolha a opção "Audio"
  - Escolha a opção "HDMI" ou "bcm2835 HDMI" e pressione ENTER
  - Aperte TAB até o botão FINISH estar selecionado, pressione ENTER
  - Digite o comando "sudo reboot" e pressione ENTER

  O aúdio deve funcionar, use esse mesmo menu se quiser trocar por outras saídas, como placa de som USB por exemplo.


**Montando um DSK - MODO AUTOMATIZADO (versão 1.1.0 ou superior)**
  - Você precisará de um PENDRIVE ou cartão SD com leitor formatado em FAT ou exFat, não importa o tamanho (você só usará alguns kilobytes)
  - Conecte o pendrive ou cartão SD com leitor no PC
  - Renomeie seu DSK para o arquivo "diska.dsk" na pasta raiz do pendrive ou cartão SD com leitor
  - Ejete o pendrive
  - Com o Raspberry iniciado com o MSX desejado, coloque o pendrive
  - Aguarde alguns segundos, o led FDD na tela do emulador piscará 3 vezes, isso indicará que a unidade está montada
  - Digite A: e pressione ENTER no MSX-DOS
  - Digite o comando "DIR" e pressione ENTER, os arquivos estarão lá.


**Montando qualquer DSK (versão 1.1.0 ou superior)**
  - Você precisará de um PENDRIVE ou cartão SD com leitor formatado em FAT ou exFat, não importa o tamanho (você só usará alguns kilobytes)
  - Conecte o pendrive ou cartão SD com leitor no PC
  - Copie na pasta raiz do pendrive ou cartão SD com leitor o DSK que precisa
  - Ejete o pendrive
  - Com o Raspberry iniciado com o MSX desejado, coloque o pendrive
  - Aguarde alguns segundos, o led FDD na tela do emulador piscará 3 vezes, isso indicará que a unidade está montada
  - Pressione F10 para entrar no console do emulador.
  - Digite o comando "diska eject" e pressione ENTER
  - Digite o comando "diska /mnt/storage1/ARQUIVODSKQUEPRECISA.dsk" e pressione ENTER
  - O arquivo está montado e pronto para uso.
  - Caso não queria usar mais o pendrive, basta removê-lo. Ele será desmontado e o led FDD irá piscar 3x indicando que o disco foi desmontado no emulador.
  

**Montando uma pasta como disquete - MODO AUTOMATIZADO (versão 1.1.0 ou superior)**
  - Você precisará de um PENDRIVE ou cartão SD com leitor formatado em FAT ou exFat, não importa o tamanho (você só usará alguns kilobytes)
  - Conecte o pendrive ou cartão SD com leitor no PC
  - Crie uma pasta chamada "diska" na pasta raiz do pendrive ou cartão SD com leitor
  - Coloque os arquivos que precisa, lembrando que o emulador limita a 720kb de tamanho máximo por vez (o emulador lançará erro e ignorará o resto dos arquivos)
  - Ejete o pendrive
  - Com o Raspberry iniciado com o MSX desejado, coloque o pendrive
  - Aguarde alguns segundos, o led FDD na tela do emulador piscará 3 vezes, isso indicará que a unidade está montada
  - Digite A: e pressione ENTER no MSX-DOS
  - Digite o comando "DIR" e pressione ENTER, os arquivos estarão lá.
  - Caso não queria usar mais o pendrive, basta removê-lo. Ele será desmontado e o led FDD irá piscar 3x indicando que o disco foi desmontado no emulador.
  

**Adicionando arquivos à imagem do OpenMSX (ROMs, jogos, utilitários) - MODO AUTOMATIZADO (versão 1.1.0 ou superior)**
  - Lembre-se que esses passos somente funcionarão na máquina MSX2 Expert 3, pois não consegui, até o momento, fazer o Nextor funcionar nos MSX1, ou seja, não existe unidade C. 
  - Você precisará de um PENDRIVE ou cartão SD com leitor formatado em FAT ou exFat, não importa o tamanho (você só usará alguns kilobytes)
  - Conecte o pendrive ou cartão SD com leitor no PC
  - Crie uma pasta chamada "diska" na pasta raiz do pendrive ou cartão SD com leitor
  - Coloque os arquivos que precisa, lembrando que o emulador limita a 720kb de tamanho máximo por vez (o emulador lançará erro e ignorará o resto dos arquivos)
  - Ejete o pendrive
  - Com o Raspberry iniciado com o MSX desejado, coloque o pendrive
  - Aguarde alguns segundos, o led FDD na tela do emulador piscará 3 vezes, isso indicará que a unidade está montada
  - Digite A: e pressione ENTER no MSX-DOS
  - Digite o comando "DIR" e pressione ENTER, os arquivos estarão lá.
  - Você pode usar o comando copy para copiar os arquivos para a unidade C:, deixei uma pasta criada em C:\GAMES:
    ```- Digite A: e pressione ENTER
    	- Digite COPY *.* C:\GAMES e pressione ENTER
       	- Digite C: e pressione ENTER
       	- Digite CD C:\SR8 e pressione ENTER
       	- Digite SR e pressione ENTER.
       	- Com a setas, escolha a opção ".." e pressione ENTER
       	- Acesse a pasta GAMES e pressione ENTER
       	- Boa diversão.```
  - Caso não queria usar mais o pendrive, basta removê-lo. Ele será desmontado e o led FDD irá piscar 3x indicando que o disco foi desmontado no emulador.
  

**Adicionando arquivos à imagem do OpenMSX (ROMs, jogos, utilitários) - MODO RAIZ**

  - Desligue o Raspberry
  - Insira o cartão no computador PC
  - Crie uma pasta chamada diskA na raiz da partição de boot do cartão
  - Coloque os arquivos a copiar para imagem
  - Ejete o cartão, coloque no Raspberry Pi e o inicie
  - Aguarde a inicialização completa do MSX-DOS2
  - Pressione F10 para abrir o Console
  - digite o comando "diska /boot/firmware/diskA" e pressione ENTER
  - No MSX-DOS2 digite A: e pressione ENTER
  - Digite o comando "DIR" e pressione ENTER, os arquivos estarão lá.
  - Você pode usar o comando copy para copiar os arquivos para a unidade C:, deixei uma pasta criada em C:\GAMES:
    ```- Digite A: e pressione ENTER
    	- Digite COPY *.* C:\GAMES e pressione ENTER
       	- Digite C: e pressione ENTER
       	- Digite CD C:\SR8 e pressione ENTER
       	- Digite SR e pressione ENTER.
       	- Com a setas, escolha a opção ".." e pressione ENTER
       	- Acesse a pasta GAMES e pressione ENTER
       	- Boa diversão.```

**Ativando modo 80 colunas**

  - No MSX-DOS2 digite o comando "mode 80" e pressione ENTER
  - Para voltar a 40 colunas (default), digite o comando "mode 40" e pressione ENTER

**Desabilitando os avisos de low-voltage (LEIA COM ATENÇÃO)**

  Já não coloquei esse recurso como default por que seria como se o marcador de gasolina do carro estivesse piscando e marcando pouco combustível e você colocasse uma fita cobrindo o marcador e seguindo adiante. Entretanto, dependendo do projeto que você utilize para o seu Raspberry PI, pode acontecer de não ter nenhum problema na alimentação e queira desativar o "low-voltage warning".

  Primeiro, entenda que essa mensagem acontece por que a voltagem suprida para o Raspberry PI (em especial o 3b) está abaixo da mínima recomendada pelo fabricante. Tem fontes que indicam 5v/3A, mas na hora de uma carga, caem a tensão para 4.9v, 4.8v, fazendo o RPI funcionar, mas esse aviso virá a tela. Pelo fabricante, podem ocorrer problemas de corrompimento de SD, etc. O RPI 3b quando está em pico de consumo, especialmente com Wifi e Emulador ativos, consome os limites de uma fonte, que um carregador de celular, por exemplo, não é capaz de suprir. O meu RPI3 já tem quase 10 anos, nunca deu problema e já sofreu com fontes ruins e powebanks.
  
  Então, se as mensagens incomodam e se se estiver CIENTE dos riscos, essa alteração é por SUA CONTA EM RISCO SE CASO OCORRA ALGUMA FALHA, DEFEITO DO RPI, PERCA DE DADOS, ETC...ASSIM COMO QUALQUER PROJETO OPEN SOURCE:

  - Certifique-se que esteja no modo administrador do linux
  - Digite "sudo nano /boot/firmware/config.txt"
  - Adicione a seguinte linha ao final do arquivo:
    ```
    avoid_warnings=2
    ```
  - Aperte CTRL+O (tecla ó) e pressione ENTER para salvar o arquivo
  - Aperte CTRL+X e pressione ENTER para sair
  - Digite o comando "sudo reboot"
    
---

# PARA VERSÃO ANTIGA BASEADA EM BLUEBERRYMSX 

**Uso**

Por default, o MSX inicializado é um MSX2+ genérico, no entanto, os aparelhos que o Blue MSX suportar poderão ser utilizados (ver sessão configurações).

- Para carregar um jogo do cartucho, coloque o cartucho no slot 1 do RPMC e pressione F12 para reiniciar o emulador

- Para retirar o cartucho, retire o cartucho e pressione F12 para reiniciar o emulador e acessar o MSX-DOS. É RECOMENDADO, primeiro desligue o Raspberry PI, retire o cartucho e o ligue novamente. Nos testes que fiz, não precisei disso, no entanto, fica a recomendação.

- Para reiniciar o emulador, pressione F12.

**Limitações** 

- Por ser uma imagem personalizada, o acesso Wifi e SSH da imagem linux está desativada. Pode ser configurada posteriormente, no entanto, não é o intuito desse projeto. Todavia, se quiser configurar o Wifi para acesso remoto, fique a vontade.
  
Sobre o RPMC tenha em mente que:

- Cartuchos de IO (ex: WozBlaster OPL4, Obsonet...) não funcionam, travam o emulador apesar de parecer que a parte da ROM deles carregam.
- SD Mapper não funciona, inicializa com os leds ligados e trava na inicialização.
- Conforme relatos na comunidade MSX no Facebook (https://www.facebook.com/groups/msxbrasiloficial/?locale=pt_BR), cartuchos de jogos mais elaborados não funcionam com o RPMC.

Em pesquisas, parece que o meesokim implementou os protocolos básicos de comunicação do emulador com os cartuchos, conforme o artigo no MSX Resource Center(https://www.msx.org/forum/msx-talk/hardware/rpmc-raspberry-pi-msx). Fora isso, existe uma limitação da GPIO do RPi no quesito alocação de uso. Se algum processo do linux requisitar um dos pinos do GPIO enquanto o emulador opera, quebra a comunicação com o cartucho, fora a questão dos timings dos sinais.

Além disso:

- Raspberry PIs abaixo de 3B não funciona a imagem. Ou ficam lentos demais ou nem inicializa (testei no Raspberry PI Zero por exemplo).
- Raspberry PI 4, 400 ou superior - Pendente de teste. Não garanto que funcione.
- Pode ser que o SD corrompa após muitos desligues do Raspberry PI (se colocar centenas de vezes, explicado na sessão Desligando o uosxpi)

**Desligando o uosxpi**

Até o momento, desligar seria desligar o Raspberry PI da fonte mesmo. No linux, isso não é recomendado, pode corromper o SD (em mais de 10 anos que acompanho RPi, nunca me aconteceu), isso se deve por que o blueberry MSX é lançado como serviço do Linux, muito antes do login no S.O.

Assim, não consigo capturar as entradas do usuário para uma tecla de atalho de desligue. A tecla F12, sai do emulador, e o uso para reinício para não ter que ficar esperando 30 segundos cada reinício.

É uma limitação que estou pesquisando uma solução no momento.

**Configurações:**

- Desligue o Raspberry PI e coloque o cartão em um leitor de cartões no PC. A partição boot será utilizada para as configurações.

- Escolhendo a máquina emulada:

 	* Na pasta raiz da partição de boot, crie um arquivo vazio, respeitando maiúsculas e minúsculas, sem nenhuma extensão, conforme a tabela abaixo:
    
   | Nome do arquivo | Máquina emulada |
   | :---: | :---: |
	| msxpimsxexpert | MSX Expert 1.1 Gradiente |
	| msxpimsx2 | MSX 2+ Genérico |

- Acessando o shell e login para configurações avançadas:

 	* Na pasta raiz da partição de boot, crie o arquivo vazio *msxpilogin*, respeitando maiúsculas e minúsculas, sem nenhuma extensão

	* O usuário é *umsxpi* e a senha *umsxpi*
    
	* O emulador está na pasta _/home/umsxpi/BlueBerryMSX-2.0.plus_

	* O serviço que lança o emulador é o _/lib/systemd/system/bluemsx.service_


**Disquetes virtuais (experimental):**

Internamente a emulação carrega um disquete com o MSX-DOS 2.11 (está no /home/umsxpi). No entanto, se na partição de boot do cartão SD estiver presente os seguintes arquivos abaixo (respeitar maiúsculas e minúsculas), serão carregados no emulador:

| Nome do arquivo | Drive |
| :---: | :---: |
| diska.dsk | Unidade de disco A |
| diskb.dsk | Unidade de disco B |

Todos os discos virtuais devem estar no formato msx-dos de 720kb. No Windows, use o app Disk-Manager, no caso de dúvidas, tem o vídeo do TByteCreator explicando (https://www.youtube.com/watch?v=ycX79EpJy6g).

---
# Known issues

- Versão 1.1.0
  * Existe um problema no OpenMSX 18, que intermitentemente, talvez depois de 1h de uso, pode desligar o raspberry, devido a um crash no socket de leitura dos comandos remotos. Não achei solução plausível para isso. Talvez fazendo um upgrade para a versão 20+ tenha melhorias em relação a isso. Peço desculpas sobre esse problema.

---
# Changelog

- Versão 1.1.0
  * Adicionado mais dois perfis de máquinas brasileiras famosas: Expert GPC 800 (MSX1) e HotBit (MSX1)
  * Adicionado suporte a montagem automática de pendrive como disquetes
  * Adicionada interface linux-openmsx via protocolo de comunicação do emulador (OpenMSX remote control)
  * Corrigido problema de necessitar de mouse adicional para iniciar a imagem no Raspberry PI 3 - Problema com um módulo do Wayland que ficava verificando inputs
  * Adicionado script em BASIC para troca e persistência dos emuladores
  * Remodelada engine de scripts para novos projetos
  * Montagem automática de DSKs e pastas virtuais no emulador
  * Adicionado MSX-DOS 1.3 e EXECROM nas imagens MSX1, com suporte a drive DDX.
  * Melhorado recurso de iniciar sem teclado e adicionar depois do sistema iniciado.

- Versão 1.0.1
  * Para deixar mais complaince, eu removi as ROMs da versão anterior. Desculpe, mas a vida é assim mesmo, mas elas podem ser facilmente encontrada nas Interwebs da vida =//
  * Removi aplicações que usei de exemplo, mas podem ser encontradas nas interwebs da vida
  * Deixei mais espaço na imagem para a próxima feature que estou finalizando, a integração com IA e o MCP-Server criado por Natalia-PC
    
- Versão 1.0
  * Imagem voltada para o OpenMSX sem suporte ao MSX-Hat ainda
  * Criada com a versão mais recente do Raspberry PI OS Lite (2024)
    
- Versão 0.9
  * Imagem inicial voltada para versão 32bits do Raspiberry PI OS
  * Suporte a RPMC
  * Atalhos somente para o MSX Expert e MSX 2
  * Desligamento ainda não implementado
    
---
# Licença

GNU Public License (GPL)
