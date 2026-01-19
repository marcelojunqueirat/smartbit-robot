# 📘 Documentação do Projeto

## 🔧 Pré-requisitos

Antes de iniciar, certifique-se de que os seguintes itens estejam instalados ou configurados:

- PostgreSQL (instalado localmente ou via Docker)
- Node.js
- Java
- Android Studio

> ⚠️ Importante:  
> Preencher corretamente as **variáveis de ambiente** nas pastas **api** e **robot**.

---

## ▶️ Executar os Projetos

### 🔹 Subir a API

A API será iniciada, por padrão, em:  
**http://localhost:3333**

```bash
cd api
npm install
npm run dev
```

### 🔹 Subir a Aplicação Web

A aplicação web será iniciada, por padrão, em:  
**http://localhost:3000**

```bash
cd web
npm install
npm run dev
```
  
---
  

## 🤖 Executar a Automação

🌐 Automação Web:  
```bash
cd robot
pip install -r requirements.txt

cd web   # robot/web
robot -d ./results tests
```

📱 Automação Mobile
```bash
cd robot
pip install -r requirements.txt
# (desnecessário se este passo já foi executado no robot/web)

cd mobile   # robot/mobile
robot -d ./results tests

```
  
---
  

## 📝 Observações

* Para verificar se o ambiente atende aos requisitos para execução dos testes mobile, utilize:

```bash
npx appium-doctor
```

