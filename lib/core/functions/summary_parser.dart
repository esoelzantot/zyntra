// ─────────────────────────────────────────────────────────────
// Parser — extracts bullet points from the summary string
// ─────────────────────────────────────────────────────────────

class SummaryParser {
  /// Cleans and extracts pure summary text (no headers, no bullets)
  static String parseSummary(String raw) {
    return raw
        .split('\n')
        .map((l) => l.trim())
        .where(
          (l) =>
              l.isNotEmpty &&
              !l.startsWith('#') && // remove ## Summary / ##
              !l.startsWith('*') && // remove bullet lines
              !l.startsWith('-'),
        ) // remove dash bullet lines
        .join(' ')
        .trim();
  }

  /// Extracts bullet points from raw content
  static List<String> parseBullets(String raw) {
    // 1. Try markdown bullets (* or -)
    final bulletLines = raw
        .split('\n')
        .map((l) => l.trim())
        .where((l) => l.startsWith('*') || l.startsWith('-'))
        .map((l) => l.replaceFirst(RegExp(r'^[*-]\s*'), '').trim())
        .where((l) => l.isNotEmpty)
        .toList();

    if (bulletLines.isNotEmpty) return bulletLines;

    // 2. Fallback: extract from cleaned summary text as sentences
    final cleanedText = parseSummary(raw);

    return cleanedText
        .split(RegExp(r'\.\s+'))
        .map((s) => s.trim())
        .where((s) => s.length > 20)
        .take(5)
        .map((s) => s.endsWith('.') ? s : '$s.')
        .toList();
  }

  /// Extract only the concise summary paragraph (before "### 2.")
  static String parseParagraph(String raw) {
    // Take everything after "### 1. Concise Summary" (or similar)
    final parts = raw.split(RegExp(r'###\s*\d+\.'));
    if (parts.length > 1) return parts[1].trim().split('\n\n').first.trim();
    // Fallback: first non-empty paragraph
    return raw
        .split('\n\n')
        .firstWhere((p) => p.trim().length > 30, orElse: () => raw.trim());
  }
}
