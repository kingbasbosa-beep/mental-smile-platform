const admin = require('firebase-admin');

const CONFIRMATION = 'PROVIDER_PROFILE_FINAL_PURGE';

const specialistCategories = {
  psychologist: {
    label: 'Ø£Ø®ØµØ§Ø¦ÙŠ Ù†ÙØ³ÙŠ',
    librarySectionId: 'specialist_psychologists',
  },
  social_worker: {
    label: 'Ø£Ø®ØµØ§Ø¦ÙŠ Ø§Ø¬ØªÙ…Ø§Ø¹ÙŠ',
    librarySectionId: 'specialist_social_workers',
  },
  clinical: {
    label: 'Ø£Ø®ØµØ§Ø¦ÙŠ Ø¥ÙƒÙ„ÙŠÙ†ÙŠÙƒÙŠ',
    librarySectionId: 'specialist_clinical',
  },
  family_counseling: {
    label: 'Ø£Ø®ØµØ§Ø¦ÙŠ Ù…Ø´ÙˆØ±Ø© Ø£Ø³Ø±ÙŠØ©',
    librarySectionId: 'specialist_family_counseling',
  },
  addiction_behavior: {
    label: 'Ù…Ø±Ø´Ø¯ Ø¹Ù„Ø§Ø¬ Ø³Ù„ÙˆÙƒÙŠØ§Øª Ø¥Ø¯Ù…Ø§Ù†ÙŠØ©',
    librarySectionId: 'specialist_addiction_behavior',
  },
  coaching: {
    label: 'Ø£Ø®ØµØ§Ø¦ÙŠ ÙƒÙˆØªØ´ÙŠÙ†Ø¬',
    librarySectionId: 'specialist_coaching',
  },
  support_supervisor: {
    label: 'Ù…Ø´Ø±Ù Ø¨Ø±Ø§Ù…Ø¬ Ø¯Ø¹Ù…',
    librarySectionId: 'specialist_support_supervisors',
  },
  behavior_autism: {
    label: 'Ø£Ø®ØµØ§Ø¦ÙŠ ØªØ¹Ø¯ÙŠÙ„ Ø³Ù„ÙˆÙƒ ÙˆØªÙˆØ­Ø¯',
    librarySectionId: 'specialist_behavior_autism',
  },
  speech: {
    label: 'Ø£Ø®ØµØ§Ø¦ÙŠ ØªØ®Ø§Ø·Ø¨',
    librarySectionId: 'specialist_special_needs_rehabilitation',
  },
  addiction_recovery: {
    label: 'Ø¹Ù„Ø§Ø¬ Ø§Ù„Ø³Ù„ÙˆÙƒÙŠØ§Øª Ø§Ù„Ø¥Ø¯Ù…Ø§Ù†ÙŠØ©',
    librarySectionId: 'specialist_addiction_recovery',
  },
};

const centerCategories = {
  addiction_treatment: {
    label: 'Ù…Ø±ÙƒØ² Ø¹Ù„Ø§Ø¬ Ø¥Ø¯Ù…Ø§Ù†',
    librarySectionId: 'center_addiction_detox',
  },
  mental_health: {
    label: 'Ù…Ø±ÙƒØ² ØµØ­Ø© Ù†ÙØ³ÙŠØ©',
    librarySectionId: 'center_mental_health',
  },
  rehabilitation: {
    label: 'Ù…Ø±ÙƒØ² ØªØ£Ù‡ÙŠÙ„',
    librarySectionId: 'center_rehabilitation_recovery',
  },
  consulting: {
    label: 'Ù…Ø±ÙƒØ² Ø§Ø³ØªØ´Ø§Ø±Ø§Øª',
    librarySectionId: 'center_family_counseling',
  },
  clinic: {
    label: 'Ø¹ÙŠØ§Ø¯Ø©',
    librarySectionId: 'center_clinics',
  },
  community_center: {
    label: 'Ù…Ø±ÙƒØ² Ù…Ø¬ØªÙ…Ø¹ÙŠ',
    librarySectionId: 'center_ngos_foundations',
  },
};

const specialistPrivateFields = [
  'ownerUid',
  'profileType',
  'status',
  'fullName',
  'specialty',
  'specialtyLabel',
  'otherSpecialties',
  'shortBio',
  'email',
  'phone',
  'showEmailPublicly',
  'showPhonePublicly',
  'profileImageUrl',
  'createdAt',
  'updatedAt',
  'source',
];

const centerPrivateFields = [
  'ownerUid',
  'profileType',
  'status',
  'centerName',
  'category',
  'categoryLabel',
  'otherServices',
  'shortBio',
  'email',
  'phone',
  'showEmailPublicly',
  'showPhonePublicly',
  'identityImageUrl',
  'createdAt',
  'updatedAt',
  'source',
];

function text(value, maxLength) {
  const output = value === undefined || value === null ? '' : String(value).trim();
  return maxLength && output.length > maxLength
    ? output.substring(0, maxLength)
    : output;
}

function cleanMap(data, allowedFields) {
  return Object.fromEntries(
    Object.entries(data).filter(([key]) => allowedFields.includes(key)),
  );
}

function specialistPrivate(uid, data) {
  const category = specialistCategories[text(data.specialty)];
  if (!category) return null;
  return {
    ownerUid: uid,
    profileType: 'specialist',
    status: 'published',
    fullName: text(data.fullName),
    specialty: text(data.specialty),
    specialtyLabel: category.label,
    otherSpecialties: text(data.otherSpecialties, 160),
    shortBio: text(data.shortBio, 300),
    email: text(data.email),
    phone: text(data.phone),
    showEmailPublicly: data.showEmailPublicly === true,
    showPhonePublicly: data.showPhonePublicly === true,
    profileImageUrl: text(data.profileImageUrl),
    createdAt: data.createdAt || admin.firestore.FieldValue.serverTimestamp(),
    updatedAt: admin.firestore.FieldValue.serverTimestamp(),
    source: 'specialist_professional_profile_clean_layout_v1',
  };
}

function centerPrivate(uid, data) {
  const category = centerCategories[text(data.category)];
  if (!category) return null;
  return {
    ownerUid: uid,
    profileType: 'center',
    status: 'published',
    centerName: text(data.centerName),
    category: text(data.category),
    categoryLabel: category.label,
    otherServices: text(data.otherServices, 160),
    shortBio: text(data.shortBio, 300),
    email: text(data.email),
    phone: text(data.phone),
    showEmailPublicly: data.showEmailPublicly === true,
    showPhonePublicly: data.showPhonePublicly === true,
    identityImageUrl: text(data.identityImageUrl),
    createdAt: data.createdAt || admin.firestore.FieldValue.serverTimestamp(),
    updatedAt: admin.firestore.FieldValue.serverTimestamp(),
    source: 'center_professional_profile_clean_layout_v1',
  };
}

function specialistPublic(uid, data) {
  const category = specialistCategories[data.specialty];
  const output = {
    providerId: uid,
    profileType: 'specialist',
    displayName: data.fullName,
    categoryId: data.specialty,
    categoryLabel: category.label,
    librarySectionId: category.librarySectionId,
    imageUrl: data.profileImageUrl,
    showEmailPublicly: data.showEmailPublicly,
    showPhonePublicly: data.showPhonePublicly,
    status: 'published',
    updatedAt: admin.firestore.FieldValue.serverTimestamp(),
  };
  if (data.otherSpecialties) output.otherSpecialties = data.otherSpecialties;
  if (data.shortBio) output.shortBio = data.shortBio;
  if (data.showEmailPublicly && data.email) output.email = data.email;
  if (data.showPhonePublicly && data.phone) output.phone = data.phone;
  return output;
}

function centerPublic(uid, data) {
  const category = centerCategories[data.category];
  const output = {
    providerId: uid,
    profileType: 'center',
    displayName: data.centerName,
    categoryId: data.category,
    categoryLabel: category.label,
    librarySectionId: category.librarySectionId,
    imageUrl: data.identityImageUrl,
    showEmailPublicly: data.showEmailPublicly,
    showPhonePublicly: data.showPhonePublicly,
    status: 'published',
    updatedAt: admin.firestore.FieldValue.serverTimestamp(),
  };
  if (data.otherServices) output.otherServices = data.otherServices;
  if (data.shortBio) output.shortBio = data.shortBio;
  if (data.showEmailPublicly && data.email) output.email = data.email;
  if (data.showPhonePublicly && data.phone) output.phone = data.phone;
  return output;
}

async function processCollection({
  db,
  mode,
  collectionName,
  providerType,
  privateFields,
  makePrivate,
  makePublic,
  publicCollection,
}) {
  const providerDocs = await db.collection(collectionName).listDocuments();
  const rows = [];
  for (const providerDoc of providerDocs) {
    const uid = providerDoc.id;
    const privateRef = providerDoc.collection('profile').doc('current');
    const privateSnap = await privateRef.get();
    if (!privateSnap.exists) continue;

    const current = privateSnap.data();
    const nextPrivate = makePrivate(uid, current);
    const fieldsToRemove = Object.keys(current).filter(
      (field) => !privateFields.includes(field),
    );
    const valid = nextPrivate !== null &&
      text(providerType === 'specialist' ? nextPrivate.fullName : nextPrivate.centerName) !== '';

    rows.push({
      id: uid,
      providerType,
      mode,
      valid,
      preserve: privateFields,
      remove: fieldsToRemove,
      categoryMappingValid: nextPrivate !== null,
      publicStatus: valid ? 'published' : 'skipped',
      projectionCanBeRebuilt: valid,
    });

    if (mode === 'write' && valid) {
      await privateRef.set(nextPrivate);
      await db.collection(publicCollection).doc(uid).set(makePublic(uid, nextPrivate));
    }
  }
  return rows;
}

async function listObsoleteStorageObjects() {
  const bucket = admin.storage().bucket();
  const [files] = await bucket.getFiles();
  return files
    .map((file) => file.name)
    .filter((name) => {
      if (name.match(/^clinicians\/[^/]+\/official\/profile_image$/)) return false;
      if (name.match(/^centers\/[^/]+\/official\/identity_image$/)) return false;
      return name.startsWith('clinicians/') || name.startsWith('centers/');
    });
}

async function main() {
  const args = new Set(process.argv.slice(2));
  const mode = args.has('--write') ? 'write' : 'dry-run';
  if (mode === 'write' && !args.has(`--confirm=${CONFIRMATION}`)) {
    throw new Error(`Write mode requires --confirm=${CONFIRMATION}`);
  }

  admin.initializeApp();
  const db = admin.firestore();
  const results = [];
  results.push(...await processCollection({
    db,
    mode,
    collectionName: 'clinicians',
    providerType: 'specialist',
    privateFields: specialistPrivateFields,
    makePrivate: specialistPrivate,
    makePublic: specialistPublic,
    publicCollection: 'public_specialist_profiles',
  }));
  results.push(...await processCollection({
    db,
    mode,
    collectionName: 'centers',
    providerType: 'center',
    privateFields: centerPrivateFields,
    makePrivate: centerPrivate,
    makePublic: centerPublic,
    publicCollection: 'public_center_profiles',
  }));

  const obsoleteStorageObjects = args.has('--list-storage')
    ? await listObsoleteStorageObjects()
    : [];

  console.log(JSON.stringify({ mode, results, obsoleteStorageObjects }, null, 2));
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
