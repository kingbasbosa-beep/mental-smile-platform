class CommercialV2PlugCodes {
  const CommercialV2PlugCodes._();

  static const sectionCode = 'SEC-CV2';
  static const inboxPlug = 'PLG-CV2-IN';
  static const outboxPlug = 'PLG-CV2-OUT';
  static const destinationCode = 'DST-CV2-INBOX';

  static const archiveSectionCode = 'SEC-ARC';
  static const archiveInboxPlug = 'PLG-ARC-IN';
}

class CommercialV2InboxPlugInterface {
  const CommercialV2InboxPlugInterface._();

  static const sectionCode = CommercialV2PlugCodes.sectionCode;
  static const plugCode = CommercialV2PlugCodes.inboxPlug;
  static const storageOwner = 'Archive';
}

class CommercialV2OutboxPlugInterface {
  const CommercialV2OutboxPlugInterface._();

  static const sectionCode = CommercialV2PlugCodes.sectionCode;
  static const plugCode = CommercialV2PlugCodes.outboxPlug;
  static const storageOwner = 'Archive';
  static const destinationSectionCode =
      CommercialV2PlugCodes.archiveSectionCode;
  static const destinationInboxPlug = CommercialV2PlugCodes.archiveInboxPlug;
}
