import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/block_5_prompt_ai_memory/data/block_5_prompt_ai_memory_data.dart';
import 'package:mental_smile_os/features/os_generation_1_kernel/presentation/widgets/kernel_dashboard_widgets.dart';

class Block5PromptsDashboardPage extends StatelessWidget {
  const Block5PromptsDashboardPage({super.key});
  @override
  Widget build(BuildContext context) => const KernelDashboardPage(
      title: 'Block 5 Prompts',
      subtitle:
          'Prompt memory dashboard with search, filters, counters, and boundaries.',
      metrics: block5Metrics,
      items: block5PromptItems,
      searchHint: 'Search prompts');
}

class Block5PromptPacksDashboardPage extends StatelessWidget {
  const Block5PromptPacksDashboardPage({super.key});
  @override
  Widget build(BuildContext context) => const KernelDashboardPage(
      title: 'Block 5 Prompt Packs',
      subtitle:
          'Prompt pack registry for repeated operation patterns and future readiness.',
      metrics: block5Metrics,
      items: block5PackItems,
      searchHint: 'Search prompt packs');
}

class Block5AiMemoryDashboardPage extends StatelessWidget {
  const Block5AiMemoryDashboardPage({super.key});
  @override
  Widget build(BuildContext context) => const KernelDashboardPage(
      title: 'Block 5 AI Memory',
      subtitle:
          'AI memory boundaries, authority, risk, and Not Connected Yet states.',
      metrics: block5Metrics,
      items: block5MemoryItems,
      searchHint: 'Search AI memory');
}

class Block5PromptHealthDashboardPage extends StatelessWidget {
  const Block5PromptHealthDashboardPage({super.key});
  @override
  Widget build(BuildContext context) => const KernelDashboardPage(
      title: 'Block 5 Prompt Health',
      subtitle:
          'Prompt readiness and safety gates without runtime AI execution.',
      metrics: block5Metrics,
      items: block5HealthItems,
      searchHint: 'Search prompt health');
}
