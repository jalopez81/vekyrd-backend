/* Script para ejecutar migraciones en Producción (Supabase) */
import 'dotenv/config';
import { execSync } from 'child_process'; // Importación necesaria

const args = process.argv.slice(2);

// Mapeo de archivos SQL
const files = {
  init: './db/migration/1-create-tables.sql',
  seed: './db/migration/2-restore-data.sql',
};

const action = args[0];
const file = files[action];

// 1. Validar que la acción sea correcta
if (!file) { 
  console.error('❌ Uso: node scripts/tu-script.js init|seed'); 
  process.exit(1); 
}

// 2. Validar que la variable de entorno exista
if (!process.env.PROD_DATABASE_URL) {
  console.error('❌ ERROR: No se encontró PROD_DATABASE_URL en el archivo .env');
  process.exit(1);
}

console.log(`🚀 Ejecutando ${action} en Supabase...`);

try {
  /* IMPORTANTE: Envolvemos la URL en comillas dobles para que Windows 
     no rompa la cadena si tiene caracteres especiales.
  */
  execSync(`psql "${process.env.PROD_DATABASE_URL}" -f ${file}`, { 
    stdio: 'inherit' 
  });
  
  console.log(`✅ ${action} completado con éxito.`);
} catch (error) {
  console.error(`❌ Error al ejecutar el script: ${error.message}`);
  process.exit(1);
}