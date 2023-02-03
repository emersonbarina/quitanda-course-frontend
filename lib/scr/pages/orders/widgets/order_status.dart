import 'package:flutter/material.dart';
import 'package:quitanda/scr/constants/colors.dart';
import 'package:quitanda/scr/constants/texts.dart';

class OrderStatus extends StatelessWidget {
  OrderStatus({
    Key? key,
    required this.status,
    required this.isOverdue,
  }) : super(key: key);

  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(
          isActive: true,
          tile: tOrderStatusPendingPayment,
        ),
        const _CustomDivider(),
        if (currentStatus == 1) ...[
          const _StatusDot(
            isActive: true,
            tile: tOrderStatusRefunded,
            backgroundColor: tColorsBadge,
          ),
        ] else if (isOverdue) ...[
          const _StatusDot(
            isActive: true,
            tile: tOrderStatusOverdue,
            backgroundColor: tColorsBadge,
          ),
        ] else ...[
          _StatusDot(
            isActive: currentStatus >= 2,
            tile: tOrderStatusPaid,
          ),
          const _CustomDivider(),

          _StatusDot(
            isActive: currentStatus >= 3,
            tile: tOrderStatusPreparingPurchase,
          ),
          const _CustomDivider(),

          _StatusDot(
            isActive: currentStatus >= 4,
            tile: tOrderStatusShipping,
          ),
          const _CustomDivider(),

          _StatusDot(
            isActive: currentStatus == 5,
            tile: tOrderStatusDelivered,
          ),
        ]
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 3,
      ),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot({
    Key? key,
    required this.isActive,
    required this.tile,
    this.backgroundColor,
  }) : super(key: key);

  final bool isActive;
  final String tile;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Dot
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: tColorsPrimary,
            ),
            color: isActive
                ? backgroundColor ?? tColorsPrimary
                : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: tColorsLight,
                )
              : const SizedBox.shrink(),
        ),
        // Divisor
        const SizedBox(
          width: 5,
        ),

        // Text
        Expanded(
          child: Text(
            tile,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
