import 'package:flutter/material.dart';
import 'package:kazumi/bean/widget/translated_text.dart';
import 'package:kazumi/modules/staff/staff_item.dart';

class StaffCard extends StatelessWidget {
  const StaffCard({
    super.key,
    required this.staffFullItem,
  });

  final StaffFullItem staffFullItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: staffFullItem.staff.images?.grid == null
            ? NetworkImage('https://bangumi.tv/img/info_only.png')
            : NetworkImage(staffFullItem.staff.images!.grid),
      ),
      title: TranslatedText(
        staffFullItem.staff.name,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: staffFullItem.staff.nameCN.isNotEmpty
          ? TranslatedText(staffFullItem.staff.nameCN)
          : null,
      trailing: TranslatedText(staffFullItem.positions.isNotEmpty
          ? (staffFullItem.positions[0].type.cn)
          : ''),
    );
  }
}
