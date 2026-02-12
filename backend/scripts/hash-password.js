import argon2 from 'argon2';

async function hashPassword(password) {
  try {
    const hash = await argon2.hash(password);
    console.log('\n✅ Hash généré :');
    console.log(hash);
    console.log('\n📋 Copie ce hash dans ton seeder !\n');
  } catch (err) {
    console.error('❌ Erreur:', err);
  }
}

// Hash "password123" pour le user de test
hashPassword('password123');