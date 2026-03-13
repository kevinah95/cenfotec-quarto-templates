import { readFileSync, writeFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const version = process.argv[2];
if (!version) {
  console.error('❌ Error: Version argument is required');
  process.exit(1);
}

console.log(`🔄 Syncing version to ${version}...`);

// Update assigment/_extensions/assigment/_extension.yml
const extensionYmlPath = join(__dirname, '../assigment/_extensions/assigment/_extension.yml');
try {
  let content = readFileSync(extensionYmlPath, 'utf8');
  
  // Replace version line (handles "version: X.X.X")
  content = content.replace(/version:\s*\d+\.\d+\.\d+/, `version: ${version}`);
  
  writeFileSync(extensionYmlPath, content, 'utf8');
  console.log(`✅ Updated ${extensionYmlPath}`);
} catch (error) {
  console.error(`❌ Error updating ${extensionYmlPath}:`, error.message);
  process.exit(1);
}

console.log(`✨ Version sync completed successfully!`);
