// ─── Research Resource Model ───────────────────────────────────────────────
class ResearchResource {
  final String title;
  final String subtitle;
  final ResourceIcon icon;
  final bool isActive;

  const ResearchResource({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.isActive = false,
  });
}

enum ResourceIcon { database, neural, climate }

// ─── Chat Message Model ─────────────────────────────────────────────────────
abstract class ChatMessage {
  final String sender;
  final String time;
  const ChatMessage({required this.sender, required this.time});
}

class AiMessage extends ChatMessage {
  final String text;
  final AiMessageWidget? widget;

  const AiMessage({
    required super.sender,
    required super.time,
    required this.text,
    this.widget,
  });
}

class UserMessage extends ChatMessage {
  final String text;

  const UserMessage({
    required super.sender,
    required super.time,
    required this.text,
  });
}

// Widget types embedded in AI messages
abstract class AiMessageWidget {}

class StatOutlierWidget extends AiMessageWidget {
  final double progress; // 0.0 – 1.0
  final double confidenceScore;
  StatOutlierWidget({required this.progress, required this.confidenceScore});
}

class BulletListWidget extends AiMessageWidget {
  final List<String> items;
  final String summary;
  final String highlightValue;
  BulletListWidget({
    required this.items,
    required this.summary,
    required this.highlightValue,
  });
}

// ─── Sample Data ────────────────────────────────────────────────────────────
class SampleData {
  static List<ResearchResource> get resources => [
    const ResearchResource(
      title: 'Genomic Dataset v.9',
      subtitle: 'Zyntra Lab Stream',
      icon: ResourceIcon.database,
    ),
    const ResearchResource(
      title: 'Neural Mapping X1',
      subtitle: 'Cortex Systems',
      icon: ResourceIcon.neural,
      isActive: true,
    ),
    const ResearchResource(
      title: 'Climate Model Beta',
      subtitle: 'Global Eco Data',
      icon: ResourceIcon.climate,
    ),
  ];

  static List<ChatMessage> get messages => [
    AiMessage(
      sender: 'Asky AI',
      time: '10:42 AM',
      text:
          'I have analyzed the current data stream from the Cortex Systems Mapping X1. Based on the preliminary findings, the synaptic density in the prefrontal cortex region shows a 14.2% deviation from the control group.',
      widget: StatOutlierWidget(progress: 0.78, confidenceScore: 0.982),
    ),
    UserMessage(
      sender: 'You',
      time: '10:44 AM',
      text:
          'Can you cross-reference these deviations with the Genomic Dataset v.9? I want to see if there\'s any correlation with the RX-204 gene markers we identified last week.',
    ),
    AiMessage(
      sender: 'Asky AI',
      time: '10:45 AM',
      text: 'Cross-referencing datasets now...',
      widget: BulletListWidget(
        items: [
          'RX-204 marker sequence mapped (Genomic v.9)',
          'Correlation detected in the Z3-Alpha sub-region.',
        ],
        summary:
            'The correlation coefficient is 0.84. This suggests a significant statistical relationship between the RX-204 marker and the observed synaptic density spikes.',
        highlightValue: '0.84',
      ),
    ),
  ];
}
