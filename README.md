# App Toalha Nerd Po UI + Protheus

Um app para criar toalhas personalizadas para celebrar o Dia do Orgulho Nerd!

### Video demonstração
[![](https://github.com/JoseCamilo/desafio-toalha-poui-protheus/blob/main/imagens/video.png?raw=true)](https://drive.google.com/file/d/1gaB9IKILI6gmzf_4Bctu3wH7McW7d46n/view?usp=sharing "Video Demonstração")

#### Lista do Cadastro
![Browse](https://github.com/JoseCamilo/desafio-toalha-poui-protheus/blob/main/imagens/browse.png?raw=true "Browse")

#### Opções de cores
![Opções de Cor](https://github.com/JoseCamilo/desafio-toalha-poui-protheus/blob/main/imagens/opcoes_cor.png?raw=true "Opções de Cor")

#### Opções de Estampas
![Opções de Estampa](https://github.com/JoseCamilo/desafio-toalha-poui-protheus/blob/main/imagens/opcoes_estampa.png?raw=true "Opções de Estampa")

#### Goku
![Goku](https://github.com/JoseCamilo/desafio-toalha-poui-protheus/blob/main/imagens/goku.png?raw=true "Goku")

#### Scooby
![Scooby](https://github.com/JoseCamilo/desafio-toalha-poui-protheus/blob/main/imagens/scooby.png?raw=true "Scooby")

#### Darth Vader
![Darth](https://github.com/JoseCamilo/desafio-toalha-poui-protheus/blob/main/imagens/darth.png?raw=true "Darth")

#### Batman
![Batman](https://github.com/JoseCamilo/desafio-toalha-poui-protheus/blob/main/imagens/batman.png?raw=true "Batman")

# Passo a passo implementação

1. Ter um ambiente ERP Protheus com versões mínimas de LIB 20200214 e Appserver 7.00.191205P

2. Criar um serviço de WebService Rest no Protheus, além na conexão via smartclient

3. Configurar no ini do appserver da conexão via smartclient, a chave App_Environment conforme [documentação](https://tdn.totvs.com/display/framework/FwCallApp+-+Abrindo+aplicativos+Web+no+Protheus):<br/>[General]<br/>App_Environment={nome-do-ambiente-utilizado}

4. Alterar a propriedade __urlBackEnd__ do arquivo [environment.ts](https://github.com/JoseCamilo/desafio-toalha-poui-protheus/blob/main/toalha-frontend/src/environments/environment.ts), colocando o endereço do seu serviço WebService criado no Passo 1

5. Realizar o build do projeto Angular [toalha-frontend](https://github.com/JoseCamilo/desafio-toalha-poui-protheus/tree/main/toalha-frontend). Para isso você precisará do [Node.js](https://nodejs.org/) e [Angular](https://angular.io/) instalados em sua máquina, executar a [instalação de pacotes](https://docs.npmjs.com/cli/v7/commands/npm-install) e a [construção do projeto](https://angular.io/cli/build).

6. Colocar os arquivos gerados pela build em uma nova pasta com o nome de toalha-frontend, zipar a pasta e alterar a extensão para .app

7.  Aplicar no ERP Protheus os dicionários da pasta [dicionarios](https://github.com/JoseCamilo/desafio-toalha-poui-protheus/tree/main/dicionarios)

8. Compilar no serviço de WebService do Protheus o recurso [WsAppDToalha.prw](https://github.com/JoseCamilo/desafio-toalha-poui-protheus/blob/main/toalha-backend/WsAppDToalha.prw)

9. Compilar no ambiente de conexão de smartclient o recurso [AppDToalha.prw](https://github.com/JoseCamilo/desafio-toalha-poui-protheus/blob/main/toalha-backend/AppDToalha.prw) e o recurso que você criou no Passo 5, toalha-frontend.app <br/>
__Importante: Habilitar a compilação de recursos diversos para ser possível compilar o recurso toalha-frontend.app. No VsCode a configuração é enableExtensionsFilter=false__

10. Adicionar no Menu no Protheus ou executar a função U_AppDToalha


# Desafio Dia do Orgulho Nerd TOTVS!

#### E para você que é DEV na TOTVS, temos um desafio ainda muito especial para este dia 

Para celebrar  todos os DEVS para esse desafio! O objetivo é criar, em uma semana, uma Aplicação Web (Mobile também vale) usando o PO UI, integrado à plataforma/linguagem que usam no seu dia-a-dia.

Venha mostrar que está antenado e pode encarar este desafio, e não diga: “Ah eu não conheço PO UI”, porque o que não falta é documentação, acesse:

#### Documentação oficial PO UI
https://po-ui.io/guides/getting-started
https://github.com/po-ui/po-angular
https://github.com/po-ui/po-sample-conference

#### Linha Protheus
https://tdn.totvs.com/display/framework/FwCallApp+-+Abrindo+aplicativos+Web+no+Protheus

#### Linha Datasul
https://tdn.totvs.com/display/public/FRAMJOI/Desenvolvimento+de+APIs+para+o+produto+Datasul
https://tdn.totvs.com/pages/viewpage.action?pageId=327320989

#### Linha RM
https://tdn.totvs.com/pages/viewpage.action?pageId=516194871

# Feliz Dia da Toalha! 