import { readFileSync, writeFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const template = process.argv[2];
const version = process.argv[3];

if (!template || !version) {
  console.error('❌ Error: Template name and version arguments are required');
  console.error('Usage: node sync-template-version.mjs <template> <version>');
  console.error('Example: node sync-template-version.mjs assigment 1.2.3');
  process.exit(1);
}

console.log(`🔄 Syncing ${template} template to version ${version}...`);

// Update <template>/_extensions/<template>/_extension.yml
const extensionYmlPath = join(__dirname, `../${template}/_extensions/${template}/_extension.yml`);
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

console.log(`✨ Version sync completed successfully for ${template}!`);
