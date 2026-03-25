// ─────────────────────────────────────────────────────────────
// Parser — converts the raw "significant" string to a list of
// finding strings (strips title + bullet markers).
// ─────────────────────────────────────────────────────────────
class SignificantFindingsParser {
  static List<String> parse(String raw) {
    return raw
        .split('\n')
        .map((l) => l.trim())
        .where((l) => l.startsWith('*'))
        .map((l) => l.replaceFirst(RegExp(r'^\*\s*'), '').trim())
        .where((l) => l.isNotEmpty)
        .toList();
  }
}
