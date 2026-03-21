/* Script para ejecutar migraciones en Producción (Supabase) */
import 'dotenv/config';
import { execSync } from 'child_process'; 
const args = process.argv.slice(2);

const files = {
  init: './db/migration/1-create-tables.sql',
  seed: './db/migration/2-restore-data.sql',
};

const action = args[0];
const file = files[action];

if (!file) { 
  console.error('❌ Uso: node scripts/tu-script.js init|seed'); 
  process.exit(1); 
}

if (!process.env.PROD_DATABASE_URL) {
  console.error('❌ ERROR: No se encontró PROD_DATABASE_URL en el archivo .env');
  process.exit(1);
}

console.log(`🚀 Ejecutando ${action} en Supabase...`);

try {  
  execSync(`psql "${process.env.PROD_DATABASE_URL}" -f ${file}`, { 
    stdio: 'inherit' 
  });
  
  console.log(`✅ ${action} completado con éxito.`);
} catch (error) {
  console.error(`❌ Error al ejecutar el script: ${error.message}`);
  process.exit(1);
}