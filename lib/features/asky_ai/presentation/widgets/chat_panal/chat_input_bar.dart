import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:zyntra/core/helpers/custom_loading_indicator.dart';
import 'package:zyntra/core/helpers/custom_snack_bar.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/asky_ai/domain/entities/query_entity.dart';
import 'package:zyntra/features/asky_ai/presentation/cubits/send_query/send_query_cubit.dart';

import '../../../../../app_theme.dart';

class ChatInputBar extends StatefulWidget {
  const ChatInputBar({super.key});

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  final _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() => _hasText = _controller.text.trim().isNotEmpty);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Input container
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              // Text field
              Expanded(
                child: TextField(
                  minLines: 2,
                  maxLines: 5,
                  controller: _controller,
                  style: AppStyles.styleMedium18(
                    context,
                  ).copyWith(color: AppColors.textPrimary),
                  decoration: InputDecoration(
                    hintText: 'Ask anything about the research data...',
                    hintStyle: AppStyles.styleMedium16(
                      context,
                    ).copyWith(color: AppColors.textMuted),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                  onSubmitted: (_) => _send(),
                ),
              ),

              const SizedBox(width: 8),
              // Send button
              BlocConsumer<SendQueryCubit, SendQueryState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is SendQuerySuccess) {
                    CustomSnackBar.showWarning(context, state.message.content);
                  }

                  if (state is SendQueryFailure) {
                    CustomSnackBar.showError(context, state.message);
                  }
                },
                builder: (context, state) {
                  if (state is SendQueryLoading) {
                    return Center(child: CustomLoadingIndicator());
                  }
                  return _SendButton(active: _hasText, onTap: _send);
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  void _send() {
    if (_hasText) {
      QueryEntity query = QueryEntity(message: _controller.text);
      context.read<SendQueryCubit>().sendQuery(query: query);
      FocusScope.of(context).unfocus();
      Logger().i({'message': query.message});
      _controller.clear();
      setState(() => _hasText = false);
    }
  }
}

class _SendButton extends StatefulWidget {
  final bool active;
  final VoidCallback onTap;

  const _SendButton({required this.active, required this.onTap});

  @override
  State<_SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<_SendButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: widget.active
                ? (_hovered ? AppColors.orangeLight : AppColors.orange)
                : AppColors.bgCardHover,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Send',
                style: AppStyles.styleSemiBold16(context).copyWith(
                  color: widget.active ? Colors.white : AppColors.textMuted,
                ),
              ),
              const SizedBox(width: 5),
              Icon(
                Icons.arrow_forward_rounded,
                color: widget.active ? Colors.white : AppColors.textMuted,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
