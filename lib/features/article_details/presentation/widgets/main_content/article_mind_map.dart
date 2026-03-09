import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/article_details/presentation/widgets/mind_map/info_bar.dart';
import 'package:zyntra/features/article_details/presentation/widgets/mind_map/mind_map_graph_view.dart';

// ─────────────────────────────────────────────────────────────
// MindMap Data Model
// ─────────────────────────────────────────────────────────────
class MindMapNode {
  final String id;
  final String label;
  final int depth;
  final List<MindMapNode> children;

  MindMapNode({
    required this.id,
    required this.label,
    required this.depth,
    this.children = const [],
  });
}

// ─────────────────────────────────────────────────────────────
// Markmap Parser
// ─────────────────────────────────────────────────────────────
class MarkmapParser {
  static MindMapNode parse(String markmap) {
    // Support both real newlines and literal \n escape sequences
    final normalized = markmap.replaceAll(r'\n', '\n');
    final lines = normalized
        .split('\n')
        .where((l) => l.trim().isNotEmpty && !l.trim().startsWith('mindmap'))
        .toList();

    int idCounter = 0;

    String cleanLabel(String raw) {
      return raw
          .replaceAll(RegExp(r'root\(\((.+?)\)\)'), r'\1')
          .replaceAll(RegExp(r'^\s+'), '')
          .trim();
    }

    int getDepth(String line) {
      int spaces = 0;
      for (var ch in line.runes) {
        if (ch == ' '.codeUnitAt(0)) {
          spaces++;
        } else {
          break;
        }
      }
      return spaces ~/ 2;
    }

    MindMapNode buildNode(String label, int depth) {
      return MindMapNode(
        id: '${idCounter++}',
        label: cleanLabel(label),
        depth: depth,
        children: [],
      );
    }

    final rootLine = lines.firstWhere(
      (l) => l.contains('root(('),
      orElse: () => lines.first,
    );
    final root = buildNode(rootLine, 0);
    final stack = <MindMapNode>[root];

    for (final line in lines) {
      if (line == rootLine) continue;
      final depth = getDepth(line) + 1;
      final label = cleanLabel(line);
      if (label.isEmpty) continue;

      final node = buildNode(label, depth);

      while (stack.length > 1 && stack.last.depth >= depth) {
        stack.removeLast();
      }

      (stack.last.children as List<MindMapNode>).add(node);
      stack.add(node);
    }

    return root;
  }
}

// ─────────────────────────────────────────────────────────────
// Color palette per depth
// ─────────────────────────────────────────────────────────────
const _depthColors = [
  Color(0xFF6C63FF),
  Color(0xFF3ECFCF),
  Color(0xFFFF6B6B),
  Color(0xFFFFD166),
  Color(0xFF06D6A0),
  Color(0xFFEF476F),
  Color(0xFF118AB2),
];

Color depthColor(int depth) => _depthColors[depth % _depthColors.length];

// ─────────────────────────────────────────────────────────────
// InteractiveResearchMap  ← main widget (same outer shell)
// ─────────────────────────────────────────────────────────────
class InteractiveResearchMap extends StatefulWidget {
  final String markmapText;

  const InteractiveResearchMap({super.key, required this.markmapText});

  @override
  State<InteractiveResearchMap> createState() => _InteractiveResearchMapState();
}

class _InteractiveResearchMapState extends State<InteractiveResearchMap> {
  static const double _zoomStep = 0.2;
  static const double _minScale = 0.2;
  static const double _maxScale = 3.0;

  final TransformationController _controller = TransformationController();
  double _currentScale = 1.0;

  late final MindMapNode _root;
  late final Map<String, MindMapNode> _nodeDataMap;
  String? _selectedNodeId;

  @override
  void initState() {
    super.initState();
    _root = MarkmapParser.parse(widget.markmapText);
    _nodeDataMap = {};
    _collectNodes(_root);
  }

  void _collectNodes(MindMapNode node) {
    _nodeDataMap[node.id] = node;
    for (final child in node.children) _collectNodes(child);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _zoomIn() => _applyScale(_currentScale + _zoomStep);
  void _zoomOut() => _applyScale(_currentScale - _zoomStep);

  void _applyScale(double newScale) {
    newScale = newScale.clamp(_minScale, _maxScale);
    _controller.value = Matrix4.identity()..scale(newScale);
    setState(() => _currentScale = newScale);
  }

  void _openFullscreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            _FullscreenMindMap(root: _root, nodeDataMap: _nodeDataMap),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header row ───────────────────────────────────────────
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 32,
                        height: 4,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Text(
                        'Interactive Research Map',
                        style: AppStyles.styleBold30(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Visualize connections between research nodes',
                    style: AppStyles.styleMedium16(
                      context,
                    ).copyWith(color: Color(0xFF6B7A99)),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                _MapControlButton(icon: Icons.zoom_in_rounded, onTap: _zoomIn),
                const SizedBox(width: 8),
                _MapControlButton(
                  icon: Icons.zoom_out_rounded,
                  onTap: _zoomOut,
                ),
                const SizedBox(width: 8),
                _MapControlButton(
                  icon: Icons.fullscreen_rounded,
                  onTap: _openFullscreen,
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 16),

        // ── Selected node info bar ───────────────────────────────
        if (_selectedNodeId != null) ...[
          InfoBar(node: _nodeDataMap[_selectedNodeId!]!),
          const SizedBox(height: 10),
        ],

        // ── MindMap canvas ───────────────────────────────────────
        SizedBox(
          height: 350,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              color: const Color(0xFF111827),
              child: InteractiveViewer(
                transformationController: _controller,
                constrained: false,
                boundaryMargin: const EdgeInsets.all(500),
                minScale: _minScale,
                maxScale: _maxScale,
                onInteractionUpdate: (_) {
                  setState(() {
                    _currentScale = _controller.value.getMaxScaleOnAxis().clamp(
                      _minScale,
                      _maxScale,
                    );
                  });
                },
                child: MindMapGraphView(
                  root: _root,
                  nodeDataMap: _nodeDataMap,
                  selectedNodeId: _selectedNodeId,
                  onNodeTap: (id) => setState(() {
                    _selectedNodeId = _selectedNodeId == id ? null : id;
                  }),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Fullscreen MindMap page
// ─────────────────────────────────────────────────────────────
class _FullscreenMindMap extends StatefulWidget {
  final MindMapNode root;
  final Map<String, MindMapNode> nodeDataMap;

  const _FullscreenMindMap({required this.root, required this.nodeDataMap});

  @override
  State<_FullscreenMindMap> createState() => _FullscreenMindMapState();
}

class _FullscreenMindMapState extends State<_FullscreenMindMap> {
  static const double _zoomStep = 0.2;
  static const double _minScale = 0.2;
  static const double _maxScale = 3.0;

  final TransformationController _controller = TransformationController();
  double _currentScale = 1.0;
  String? _selectedNodeId;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _zoomIn() => _applyScale(_currentScale + _zoomStep);
  void _zoomOut() => _applyScale(_currentScale - _zoomStep);

  void _applyScale(double newScale) {
    newScale = newScale.clamp(_minScale, _maxScale);
    _controller.value = Matrix4.identity()..scale(newScale);
    setState(() => _currentScale = newScale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1520),
      body: SafeArea(
        child: Stack(
          children: [
            // ── Full canvas ──────────────────────────────────────
            Positioned.fill(
              child: InteractiveViewer(
                transformationController: _controller,
                constrained: false,
                boundaryMargin: const EdgeInsets.all(800),
                minScale: _minScale,
                maxScale: _maxScale,
                onInteractionUpdate: (_) {
                  setState(() {
                    _currentScale = _controller.value.getMaxScaleOnAxis().clamp(
                      _minScale,
                      _maxScale,
                    );
                  });
                },
                child: MindMapGraphView(
                  root: widget.root,
                  nodeDataMap: widget.nodeDataMap,
                  selectedNodeId: _selectedNodeId,
                  onNodeTap: (id) => setState(() {
                    _selectedNodeId = _selectedNodeId == id ? null : id;
                  }),
                ),
              ),
            ),

            // ── Controls overlay (top-right) ─────────────────────
            Positioned(
              top: 16,
              right: 16,
              child: Row(
                children: [
                  _MapControlButton(
                    icon: Icons.zoom_in_rounded,
                    onTap: _zoomIn,
                  ),
                  const SizedBox(width: 8),
                  _MapControlButton(
                    icon: Icons.zoom_out_rounded,
                    onTap: _zoomOut,
                  ),
                  const SizedBox(width: 8),
                  _MapControlButton(
                    icon: Icons.fullscreen_exit_rounded,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),

            // ── Title (top-left) ─────────────────────────────────
            const Positioned(
              top: 20,
              left: 16,
              child: Text(
                'Interactive Research Map',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),

            // ── Selected node info bar (bottom) ──────────────────
            if (_selectedNodeId != null)
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: InfoBar(node: widget.nodeDataMap[_selectedNodeId!]!),
              ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Control button
// ─────────────────────────────────────────────────────────────
class _MapControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _MapControlButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFF1A2235),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}
