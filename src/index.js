require('dotenv').config();
const express = require('express');
const { Pool } = require('pg');

const app = express();

const PORT = process.env.PORT || 3000;  

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

pool.connect()
.then(() => console.log('✅ Conectado ao PostgreSQL com sucesso!'))
.catch((err) => console.error('❌ Erro ao conectar no banco:', err.message));


app.get('/', (req, res) => {
  res.send('Api esta rodando na porta ' + process.env.PORT);
});

app.listen(PORT, () => {
  console.log(`🚀 Servidor rodando na porta ${PORT}`);
});